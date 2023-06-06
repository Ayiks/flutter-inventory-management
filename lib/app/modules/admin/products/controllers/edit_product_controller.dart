import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/product/product.dart';

class EditProductController extends GetxController {
  // final TextEditingController quantityController = TextEditingController();
  // final TextEditingController priceController = TextEditingController();
  late final GlobalKey<FormState> formKey;

  final Rx<Product?> _product = Rx<Product?>(null);
  Product? get product => _product.value;
  set product(Product? value) => _product.value = value;

  // final RxDouble _productPrice = RxDouble(0);
  // double get productPrice => _productPrice.value;
  // set productPrice(double value) => _productPrice.value = value;

  final RxDouble _productQuantity = RxDouble(0);
  double get productQuantity => _productQuantity.value;
  set productQuantity(double value) => _productQuantity.value = value;

  late Worker _worker;

  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey<FormState>();
    _worker = ever<Product?>(_product, (product) {
      if (product != null) {}
    });
  }

  @override
  void onReady() {
    super.onReady();
    //  TODO: Redirect if product
    print("Editcontroller Products: $product");
  }

  @override
  void onClose() {
    _worker.dispose();
    super.onClose();
  }

  void setProductQuantity(String value) {
    productQuantity = double.tryParse(value) ?? 0;
  }

  void setProductPrice(String value) {
    product = product?.copyWith(price: double.tryParse(value) ?? 0);
  }

  String? validateQuantity(String? value) {
    if (value == null || value.isEmpty || value == '0') {
      return 'The quantity should be greater than 0';
    }
    return null;
  }

  String? validatePrice(String? value) {
    if (value == null || value.isEmpty || value == '0') {
      return 'The price should be greater than 0';
    }
    return null;
  }

  void updateProduct() {
    try {
      if (formKey.currentState!.validate() && product != null) {
        FirebaseFirestore.instance
            .collection('products')
            .doc(product?.id ?? '')
            .update(product
                    ?.copyWith(
                        quantity: (product?.quantity ?? 0) + productQuantity)
                    .toJson() ??
                {});

        Get.back();
        Get.snackbar("Success", "Product details updated");
      } else {
        Get.snackbar(
            "Something went wrong", "Please check your inputs and try again");
      }
    } catch (e) {
      Get.snackbar("Error", "something happened: $e");
    }
  }
}
 // Create the store_id field if it doesn't exist.
  