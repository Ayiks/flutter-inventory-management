import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:inventory_1/app/data/models/dashboard_start/dashboard_stats.dart';
import 'package:inventory_1/app/data/models/order/order.dart' as o;
import 'package:inventory_1/app/data/models/product/product.dart';
import 'package:inventory_1/app/data/models/store/store.dart';
import 'package:inventory_1/app/modules/admin/stores/controllers/stores_controller.dart';

class DashboardController extends GetxController {
  final StoresController storeController = Get.find<StoresController>();

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

  final Rx<Store?> _store = Rx<Store?>(null);
  Store? get store => _store.value;
  set store(Store? value) => _store.value = value;

  final RxString _storeID = ''.obs;
  String get storeID => _storeID.value;
  set storeID(String value) => _storeID.value = value;

  final RxString _storeName = ''.obs;
  String get storeName => _storeName.value;
  set storeName(String value) => _storeName.value = value;

  @override
  void onInit() {
    super.onInit();
    final List<String> store = Get.arguments;

    storeID = store[0];
    storeName = store[1];

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
    orderStreamSubscription = FirebaseFirestore.instance
        .collection('orders')
        .where('storeId', isEqualTo: storeID)
        // .orderBy('createdAt', descending: true)
        .snapshots()
        .listen(
      (event) {
        // STEP 1: set allorders List
        todaysOrders(
          event.docs
              .map((doc) => o.Order.fromJson({...doc.data(), "id": doc.id}))
              .where((order) {
            Timestamp? createdAt = order.createdAt;

            if (createdAt != null) {
              final now = DateTime.now();
              final newCreatedAt =
                  DateFormat.yMMMEd().format(createdAt.toDate());
              final newNow = DateFormat.yMMMEd().format(now);

              if (newCreatedAt == newNow) {
                return true;
              }
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
        // todaysOrders(event.docs.map((doc) {
        //   var data = doc.data();
        //   if (data['createdAt'] == null) {
        //     print("data has a null createdAt field");
        //     print(data);
        //     throw Error();
        //   }
        //   return o.Order.fromJson({...doc.data(), "id": doc.id});
        // }).toList());

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
        .doc(storeID)
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
  }

  void setTotalProductCount() {
    dashboardStats(
        dashboardStats.value.copyWith(totalProductCount: allProducts.length));
  }

  void setLowOnStockProductsCount() {
    lowOnStockProducts(
      allProducts
          .where((product) => product.quantity <= product.lowOnStock)
          .toList(),
    );

    dashboardStats(dashboardStats.value
        .copyWith(lowOnStockProductsCount: lowOnStockProducts.length));
  }

  void setOutOfStockProductsCount() {
    outOfStockProducts(
      allProducts.where((product) => product.quantity == 0).toList(),
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
  void onClose() {
    productStreamSubscription.cancel();
    orderStreamSubscription.cancel();
    dashboardStreamSubscription.cancel();
    super.onClose();
  }
}
