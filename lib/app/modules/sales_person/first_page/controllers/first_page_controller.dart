import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:inventory_1/app/data/models/dashboard_start/dashboard_stats.dart';
import 'package:inventory_1/app/data/models/product/product.dart';
import 'package:inventory_1/app/data/models/store/store.dart';
import 'package:inventory_1/app/routes/app_pages.dart';
import 'package:inventory_1/app/data/models/order/order.dart' as o;

class FirstPageController extends GetxController {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  late StreamSubscription<QuerySnapshot<Map<String, dynamic>>>
      productStreamSubscription;
  late StreamSubscription<QuerySnapshot<Map<String, dynamic>>>
      orderStreamSubscription;
  // final OrdersController _orderController = Get.find<OrdersController>();
  // final DashboardController _dashboardController =
  //     Get.find<DashboardController>();

  String userName = '';
  String userCompanyId = '';
  String phoneNumber = '';
  final RxList<o.Order> todaysOrders = RxList<o.Order>([]);

  final store = Rx<Store>(Store(id: '', name: '', location: ''));

  final RxList<Product> _products = RxList<Product>([]);
  List<Product> get products => _products;
  set products(List<Product> value) => _products.value = value;

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

  late StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>
      dashboardStreamSubscription;

  @override
  void onInit() {
    super.onInit();
    final List<String> user = Get.arguments;
    userName = user[1];
    userCompanyId = user[0];
    // phoneNumber = user[2];

    firebaseFirestore
        .collection('stores')
        .doc(userCompanyId)
        .get()
        .then((value) {
      var data = value.data() as dynamic;
      store(Store.fromJson({...data, "id": value.id}));
    });
    // a listener to update the dailySales stats
    orderStreamSubscription = FirebaseFirestore.instance
        .collection('orders')
        .where('storeId', isEqualTo: userCompanyId)
        .snapshots()
        .listen(
      (event) {
        // STEP 1: set allorders List
        todaysOrders(
          event.docs
              .map((doc) => o.Order.fromJson({...doc.data(), "id": doc.id}))
              .where((o.Order order) {
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

    productStreamSubscription = firebaseFirestore
        .collection('products')
        .where('storeId', isEqualTo: userCompanyId)
        .snapshots()
        .listen((event) {
      _products(event.docs
          .map((e) => Product.fromJson({...e.data(), "id": e.id}))
          .toList());

      // updateDashbaordStats();
    });

    dashboardStreamSubscription = FirebaseFirestore.instance
        .collection('dashboard')
        .doc(userCompanyId)
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

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    productStreamSubscription.cancel();
    dashboardStreamSubscription.cancel();
    orderStreamSubscription.cancel();
    super.onClose();
  }

  Future<void> handleSignOut() async {
    await _firebaseAuth.signOut();
    onClose();
    Get.offAndToNamed(Routes.LOGIN);
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
        .doc(userCompanyId)
        .update(dashboardStats.toJson());
  }
}
