import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/product/product.dart';
import 'package:inventory_1/app/data/models/user_profile/user_profile.dart';
import 'package:inventory_1/app/modules/sales_person/shopping/controllers/checkout_controller.dart';
import 'package:inventory_1/app/routes/app_pages.dart';

class ShoppingController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CheckoutController checkoutController = Get.find<CheckoutController>();
  // final DashboardStatsController _dashboardStatsService =
  //     Get.find<DashboardStatsController>();

  final TextEditingController searchController = TextEditingController();

  late Worker worker;

  final RxString _searchText = RxString('');
  String get searchText => _searchText.value;
  set searchText(String value) => _searchText.value = value;

  final RxList<Product> _availableProducts = RxList<Product>([]);
  List<Product> get availableProducts => _availableProducts;
  set availableProducts(List<Product> value) =>
      _availableProducts.value = value;

  final RxList<Product> _searchedProducts = RxList<Product>([]);
  List<Product> get searchResults => _searchedProducts;
  set searchResults(List<Product> value) => _searchedProducts.value = value;

// get the item count in the basket from the checkoutController
  get itemsInBasketCount => checkoutController.itemsInBasketCount;

  late StreamSubscription<QuerySnapshot<Map<String, dynamic>>>
      streamSubscription;

  @override
  void onInit() {
    super.onInit();
    final List<String> user = Get.arguments;
    final String storeID = user[0];
    streamSubscription = FirebaseFirestore.instance
        .collection('products')
        .where('storeId', isEqualTo: storeID)
        .where("quantity", isGreaterThan: 0)
        .snapshots()
        .listen(
      (event) {
        _availableProducts(
          event.docs.map((doc) {
            print("Available products doc: ${doc.data()}");

            return Product.fromJson({...doc.data(), "id": doc.id});
          }).toList(),
        );
      },
      onError: (err) {
        print("Shopping Stream error: $err");
      },
      onDone: () {
        print("Shopping Stream is done");
      },
    );

    searchForProducts();

    worker =
        everAll([_availableProducts, _searchText], (_) => searchForProducts());
  }

  Future<void> handleSignOut() async {
    await streamSubscription.cancel();
    await _firebaseAuth.signOut();
    Get.offAndToNamed(Routes.LOGIN);
  }

  getTotal() {
    return checkoutController.getGrandTotal();
  }

  void searchForProducts() {
    searchResults = availableProducts
        .where((product) =>
            product.name.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }
}
