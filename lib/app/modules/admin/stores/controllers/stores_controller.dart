import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/store/store.dart';
import 'package:inventory_1/app/widgets/buttons.dart';

class StoresController extends GetxController {
  //TODO: Implement StoresController
  final SubmitButtonController _submitButtonController =
      Get.find<SubmitButtonController>();

  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  final CollectionReference<Map<String, dynamic>> _storeCollection =
      _firebaseFirestore.collection("stores");

  late final GlobalKey<FormState> formKey;

  final Rx<StoreDTO> _storeDTO = Rx<StoreDTO>(StoreDTO(name: '', location: ''));
  StoreDTO get storeDTO => _storeDTO.value;
  // set storeDTO(value) => this._storeDTO.value = value;

  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey<FormState>();
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
  }

  String? validateStoreLocation(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
  }

  //function to add stores
  void createStore() async {
    try {
      _submitButtonController.buttonState = ButtonState.loading;
      if (formKey.currentState!.validate()) {
        await _storeCollection.doc().set({
          ...storeDTO.toJson(),
          "createdAt": FieldValue.serverTimestamp(),
        }).then((_) {
          _submitButtonController.buttonState = ButtonState.success;
          Get.back();
          Get.snackbar('Alert!', 'New Store Added');
        }).catchError((onError) {
          _submitButtonController.buttonState = ButtonState.error;

          Get.snackbar('Error', 'Something went wrong... $onError',
              backgroundColor: Colors.red);
        }).timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            _submitButtonController.buttonState = ButtonState.error;

            Get.snackbar(
                "Error", "Please check your internet connection and try again");
          },
        );
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
