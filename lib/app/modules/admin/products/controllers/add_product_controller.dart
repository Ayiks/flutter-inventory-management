import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/product/product.dart';
import 'package:inventory_1/app/widgets/buttons.dart';

class AddProductController extends GetxController {
  final SubmitButtonController _submitButtonController =
      Get.find<SubmitButtonController>();

  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  final CollectionReference<Map<String, dynamic>> _productCollection =
      _firebaseFirestore.collection("products");

  late final GlobalKey<FormState> formKey;

  final Rx<ProductDTO> _productDTO = Rx<ProductDTO>(
      ProductDTO(name: '', price: 0, lowOnStock: 0, storeId: ''));
  ProductDTO get productDTO => _productDTO.value;

  final RxBool _isCreated = false.obs;
  bool get isCreated => _isCreated.value;
  set isCreated(bool value) => _isCreated.value = value;

  late Worker _worker;

  String selectedStoreId = '';

  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey<FormState>();
    final argument = Get.arguments;
    selectedStoreId = argument;
  }

  void setProductName(String value) {
    _productDTO(productDTO.copyWith(name: value));
  }

  void setProductType(String value) {
    _productDTO(productDTO.copyWith(type: value));
  }

  void setProductPrice(String value) {
    _productDTO(productDTO.copyWith(
      price: double.tryParse(value.isEmpty ? "0" : value) ?? 0,
    ));
  }

  void setProductQuantity(String value) {
    _productDTO(productDTO.copyWith(
      quantity: double.tryParse(value.isEmpty ? "0" : value) ?? 0,
    ));
  }

  void setProductUnit(String? value) {
    _productDTO(productDTO.copyWith(unit: value));
  }

  void setProductLowOnStock(String value) {
    _productDTO(productDTO.copyWith(
      lowOnStock: double.tryParse(value.isEmpty ? "0" : value) ?? 0,
    ));
  }

  String? validateProductName(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? validateProductQuantiy(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? validateProductLowStock(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    } else if ((double.tryParse(value) ?? 0) < 1) {
      return 'This field must be greater than 0';
    }
    return null;
  }

  void addProductToFirestore() async {
    try {
      _submitButtonController.buttonState = ButtonState.loading;
      isCreated = true;
      if (formKey.currentState!.validate()) {
        await _productCollection.doc().set({
          ...productDTO.toJson(),
          "createdAt": FieldValue.serverTimestamp(),
          //field for store id
          "storeId": selectedStoreId,
        }).then((_) {
          // set the button to success
          _submitButtonController.buttonState = ButtonState.success;
          Get.back();
          Get.snackbar("Success", "Product added successfully");
        }).catchError((onError) {
          _submitButtonController.buttonState = ButtonState.error;

          Get.snackbar("Error", "Something went wrong... $onError");
        }).timeout(const Duration(seconds: 60), onTimeout: () {
          _submitButtonController.buttonState = ButtonState.error;
          isCreated = false;

          Get.snackbar(
              "Error", "Please check your internet connection and try again");
        });
      }
    } catch (e) {
      _submitButtonController.buttonState = ButtonState.error;
      isCreated = false;

      Get.snackbar("Error", "Details: $e");
    } finally {
      isCreated = false;
    }
    // set the buttonState to idle
    _submitButtonController.buttonState = ButtonState.idle;
  }
}
