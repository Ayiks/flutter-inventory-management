import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/product/product.dart';
import 'package:inventory_1/app/modules/admin/products/controllers/edit_product_controller.dart';
import 'package:inventory_1/app/modules/admin/products/widgets/product_action_modal.dart';

class AllProductsController extends GetxController {
  final EditProductController editProductController =
      Get.find<EditProductController>();

  final TextEditingController searchController = TextEditingController();

  late Worker worker;

  final RxString _searchText = RxString('');
  String get searchText => _searchText.value;
  set searchText(String value) => _searchText.value = value;

  late StreamSubscription<QuerySnapshot<Map<String, dynamic>>>
      productStreamSubscription;

  final RxList<Product> _allProducts = RxList<Product>([]);
  List<Product> get allProducts => _allProducts;
  set allProducts(List<Product> value) => _allProducts.value = value;

  final RxList<Product> _searchedProducts = RxList<Product>([]);
  List<Product> get searchResults => _searchedProducts;
  set searchResults(List<Product> value) => _searchedProducts.value = value;

  final RxList<Product> lowOnStockProducts = RxList<Product>([]);
  final RxList<Product> outOfStockProducts = RxList<Product>([]);
  final RxList<Product> productList = RxList([]);
  // final RxDouble totalValue = RxDouble(0);

  final RxString _pageTitle = RxString('');
  String get pageTitle => _pageTitle.value;
  set pageTitle(String value) => _pageTitle.value = value;

  final RxString _storeID = ''.obs;
  String get storeID => _storeID.value;
  set storeID(String value) => _storeID.value = value;

  @override
  void onInit() {
    final String storeId = Get.arguments;
    storeID = storeId;
    // A listenert to update product stats
    productStreamSubscription = FirebaseFirestore.instance
        .collection('products')
        .where('storeId', isEqualTo: storeID)
        .snapshots()
        .listen(
      (event) {
        // STEP 1: set allProduct List
        _allProducts(
          event.docs
              .map((doc) => Product.fromJson({...doc.data(), "id": doc.id}))
              .toList(),
        );

        // STEP 2: set the stats
        setLowOnStockProducts();
        setOutOfStockProducts();
      },
      onError: (err) {
        print("Product Stream error: $err");
      },
      onDone: () {
        print("Product Stream is done");
      },
    );

    searchForProducts();

    worker = everAll(
        [_allProducts, outOfStockProducts, lowOnStockProducts, _searchText],
        (_) => searchForProducts());

    String? q = Get.parameters['q'];

    pageTitle = q?.replaceAll("-", " ").capitalize ?? 'All Products';

    print("query products q: $q");

    if (q == 'low-on-stock') {
      productList(lowOnStockProducts);
    } else if (q == 'out-of-stock') {
      productList(outOfStockProducts);
    } else {
      productList(allProducts);
    }

    super.onInit();
  }

  double getGrandQuantity() {
    double stockValue = 0.0;

    // basket.forEach(
    //   (_, basketItem) {
    //     quantity += basketItem.quantity;
    //   },
    // );
    for (var element in allProducts) {
      double quantity = 0.0;
      double stock = 0.0;

      quantity = element.quantity;
      stock = element.price;

      stockValue += quantity * stock;
    }
    return stockValue;
  }

  void setLowOnStockProducts() {
    lowOnStockProducts(
      allProducts
          .where((product) =>
              product.quantity <= product.lowOnStock && product.quantity > 0)
          .toList(),
    );
  }

  void setOutOfStockProducts() {
    outOfStockProducts(
      allProducts.where((product) => product.quantity == 0).toList(),
    );
  }

  void onDeleteProductConfirmed(Product product) {
    FirebaseFirestore.instance
        .collection('products')
        .doc(product.id)
        .delete()
        .then((_) {
      Get.back();
      Get.back();
      Get.snackbar("Success", "Product was deleted successfully");
    });
  }

  void showAlertDialog({required Product product}) {
    editProductController.product = product;
    Get.dialog(ProductActionModal(product: product));
  }

  void searchForProducts() {
    searchResults = productList
        .where((product) =>
            product.name.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }

  @override
  void onClose() {
    productStreamSubscription.cancel();
    super.onClose();
  }
}
