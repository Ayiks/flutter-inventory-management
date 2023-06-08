import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:inventory_1/app/data/models/dashboard_start/dashboard_stats.dart';
import 'package:inventory_1/app/data/models/order/order.dart' as o;
import 'package:inventory_1/app/data/models/product/product.dart';
import 'package:inventory_1/app/data/models/store/store.dart';
import 'package:inventory_1/app/modules/admin/stores/controllers/stores_controller.dart';
import 'package:inventory_1/app/routes/app_pages.dart';

class DashboardController extends GetxController {
  final StoresController storeController = Get.find<StoresController>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  late StreamSubscription<QuerySnapshot<Map<String, dynamic>>>
      productStreamSubscription;

  late StreamSubscription<QuerySnapshot<Map<String, dynamic>>>
      orderStreamSubscription;

  late StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>
      dashboardStreamSubscription;

  final RxList<Product> allProducts = RxList<Product>([]);
  final RxList<Product> lowOnStockProducts = RxList<Product>([]);
  final RxList<Product> outOfStockProducts = RxList<Product>([]);
  final RxList<o.Order> todaysOrders = RxList<o.Order>([]);
  final dashboardStats = Rx<DashboardStats>(
    DashboardStats(
      totalProductCount: 0, // add or delete a product
      lowOnStockProductsCount:
          0, // when product is bought or editted to a lower quantity
      outOfStockProductsCount:
          0, // when product is bought or editted to a lower quantity such that quantity ==0
      dailySales: 0, // when an o.Order is confirmed
    ),
  );

  final RxList _recentProducts = RxList([]);
  List get recentProducts => _recentProducts;
  set recentProducts(List value) => _recentProducts.value = value;

  // final RxString _selectedStoreId = ''.obs;
  // String get selectedStoreId => _selectedStoreId.value;
  // set selectedStoreId(String value) => _selectedStoreId.value = value;

  // ignore: unused_field
  late Worker _worker;

  final Rx<Store?> _store = Rx<Store?>(null);
  Store? get store => _store.value;
  set store(Store? value) => _store.value = value;

  final RxString _storeID = ''.obs;
  String get storeID => _storeID.value;
  set storeID(String value) => _storeID.value = value;

  @override
  void onInit() {
    super.onInit();
    final String storeId = Get.arguments;

    storeID = storeId;

    // // Get the argument from the route
    // Map<String, dynamic> jsonString = Get.arguments;

    // // Convert the JSON string to an object
    // Store store = Store.fromJson(jsonString);

    // // Do something with the object
    // storeName = store.name;

    // A listenert to update product stats
    productStreamSubscription = FirebaseFirestore.instance
        .collection('products')
        .where("storeId", isEqualTo: storeID)
        .snapshots()
        .listen(
      (event) {
        // STEP 1: set allProduct List
        allProducts(
          event.docs
              .map((doc) => Product.fromJson({...doc.data(), "id": doc.id}))
              .toList(),
        );

        // STEP 2: set the stats
        setTotalProductCount();
        setLowOnStockProductsCount();
        setOutOfStockProductsCount();
        updateDashbaordStats();
      },
      onError: (err) {
        print("Product Stream error: $err");
      },
      onDone: () {
        print("Product Stream is done");
      },
    );

    // a listener to update the dailySales stats
    orderStreamSubscription =
        FirebaseFirestore.instance.collection('orders').snapshots().listen(
      (event) {
        // STEP 1: set allorders List
        todaysOrders(
          event.docs
              .map((doc) => o.Order.fromJson({...doc.data(), "id": doc.id}))
              .where((o.Order order) {
            Timestamp? createdAt = order.createdAt;

            final now = DateTime.now();
            final newCreatedAt =
                DateFormat.yMMMEd().format(createdAt!.toDate());
            final newNow = DateFormat.yMMMEd().format(now);

            if (newCreatedAt == newNow) {
              return true;
            }

            // if (createdAt != null) {
            //   int year = createdAt.toDate().year;
            //   int month = createdAt.toDate().month;
            //   int day = createdAt.toDate().day;
            //   return DateTime.utc(year, month, day).weekday ==
            //       DateTime.now().weekday;
            // }
            return false;
          }).toList(),
        );

        // STEP 2: set the stats
        setDailySales();
        updateDashbaordStats();
      },
      onError: (err) {
        print("Orders Stream error: $err");
      },
      onDone: () {
        print("Orders Stream is done");
      },
    );

    dashboardStreamSubscription = FirebaseFirestore.instance
        .collection('dashboard')
        .doc('stat')
        .snapshots()
        .listen(
      (event) {
        var json = event.data();
        if (json != null) {
          dashboardStats(DashboardStats.fromJson(json));
        }
      },
      onError: (error) => print("Listen failed: $error"),
    );
  }

  // String get selectedStoreId => selectedStore['id'];
  // String get selectedStoreName => selectedStore?['name'];

  @override
  void onReady() {
    super.onReady();
    //  TODO: Redirect if product
    print("dashboardcontroller Products: $store");
  }

  void setTotalProductCount() {
    dashboardStats(
        dashboardStats.value.copyWith(totalProductCount: allProducts.length));
  }

  void setLowOnStockProductsCount() {
    lowOnStockProducts(
      allProducts
          .where((product) =>
              product.quantity <= product.lowOnStock &&
              product.storeId == storeID)
          .toList(),
    );

    dashboardStats(dashboardStats.value
        .copyWith(lowOnStockProductsCount: lowOnStockProducts.length));
  }

  void setOutOfStockProductsCount() {
    outOfStockProducts(
      allProducts
          .where(
              (product) => product.quantity == 0 && product.storeId == storeID)
          .toList(),
    );

    dashboardStats(dashboardStats.value
        .copyWith(outOfStockProductsCount: outOfStockProducts.length));
  }

  void setDailySales() {
    double dailySales = 0;

    for (o.Order order in todaysOrders) {
      dailySales += order.total;
    }

    dashboardStats(dashboardStats.value.copyWith(dailySales: dailySales));
  }

  void updateDashbaordStats() {
    FirebaseFirestore.instance
        .collection('dashboard')
        .doc(storeID)
        .update(dashboardStats.toJson());
  }

  @override
  void onClose() async {
    super.onClose();
    _worker.dispose();
    await productStreamSubscription.cancel();
    await orderStreamSubscription.cancel();
    await dashboardStreamSubscription.cancel();
  }

  void handleSignOut() async {
    try {
      await productStreamSubscription.cancel();
      await orderStreamSubscription.cancel();
      await dashboardStreamSubscription.cancel();
      await _firebaseAuth.signOut();
      Get.offAndToNamed(Routes.LOGIN);
    } catch (e) {}
  }
}
