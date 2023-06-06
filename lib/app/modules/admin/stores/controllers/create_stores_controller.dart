import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/store/store.dart';
import 'package:inventory_1/app/widgets/buttons.dart';

class CreateStoresController extends GetxController {
  //TODO: Implement CreateStoresController
  final SubmitButtonController _submitButtonController =
      Get.find<SubmitButtonController>();

  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  final CollectionReference<Map<String, dynamic>> _storeCollection =
      _firebaseFirestore.collection("stores");

  late final GlobalKey<FormState> formKey;

  final Rx<StoreDTO> _storeDTO =
      Rx<StoreDTO>(StoreDTO(name: '', location: '', address: ''));
  StoreDTO get storeDTO => _storeDTO.value;

  // late Worker _worker;
  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey<FormState>();
    // _worker = ever(_storeDTO, (storeDTO) {
    //   _submitButtonController.isFormValid = formKey.currentState!.validate();
    // });
  }

  void setStoreName(String value) {
    _storeDTO(storeDTO.copyWith(name: value));
  }

  void setStoreLocation(String value) {
    _storeDTO(storeDTO.copyWith(location: value));
  }

  void setStoreAddress(String value) {
    _storeDTO(storeDTO.copyWith(address: value));
  }

  String? validateStoreName(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? validateStoreLocation(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

//function to add stores
  void createStore() async {
    try {
      _submitButtonController.buttonState = ButtonState.loading;
      if (formKey.currentState!.validate()) {
        var docRef = _storeCollection.doc();
        await docRef.set({
          ...storeDTO.toJson(),
          "createdAt": FieldValue.serverTimestamp(),
        });
        await FirebaseFirestore.instance
            .collection('dashboard')
            .doc(docRef.id)
            .set({
          'storeId': docRef.id,
        });
        _submitButtonController.buttonState = ButtonState.success;
        Get.back();
        Get.snackbar('Alert!', 'New Store Added');
      }
    } catch (e) {
      _submitButtonController.buttonState = ButtonState.error;

      Get.snackbar("Error", "Details: $e");
    }
    _submitButtonController.buttonState = ButtonState.idle;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
