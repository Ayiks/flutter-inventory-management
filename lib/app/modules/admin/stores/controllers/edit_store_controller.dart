import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/store/store.dart';

class EditStoreController extends GetxController {
  late final GlobalKey<FormState> formKey;

  final Rx<Store?> _store = Rx<Store?>(null);
  Store? get store => _store.value;
  set store(Store? value) => _store.value = value;

  late Worker _worker;

  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey<FormState>();
    _worker = ever<Store?>(_store, (store) {
      if (store != null) {}
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setStoreName(String value) {
    store = store?.copyWith(name: value);
  }

  void setStoreLocation(String value) {
    store = store?.copyWith(location: value);
  }

  void setStoreAddress(String value) {
    store = store?.copyWith(address: value);
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty || value == "") {
      return "This field should not be empty";
    }

    return null;
  }

  String? validateLocation(String? value) {
    if (value == null || value.isEmpty || value == "") {
      return 'This field should not be empty';
    }
    return null;
  }

  void updateStore() {
    try {
      if (formKey.currentState!.validate() && store != null) {
        FirebaseFirestore.instance
            .collection('stores')
            .doc(store?.id ?? '')
            .update(store?.toJson() ?? {});

        Get.back();
        Get.snackbar('Success', 'Store details updated');
      } else {
        Get.snackbar('Alert!',
            'Something went wrong, please check your inputs and try again');
      }
    } catch (e) {
      Get.snackbar('Error', 'oops! something went wrong! $e');
    }
  }
}
