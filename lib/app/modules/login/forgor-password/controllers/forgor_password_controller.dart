import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/routes/app_pages.dart';
import 'package:inventory_1/app/widgets/buttons.dart';

class ForgorPasswordController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final SubmitButtonController _submitButtonController =
      Get.find<SubmitButtonController>();

  final _email = ''.obs;
  String get email => _email.value;
  set email(String value) => _email.value = value;

  late Worker _worker;
  late final GlobalKey<FormState> formKey;
  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey<FormState>();

    _worker = everAll([
      _email,
    ], (_) {
      bool isFormValid = formKey.currentState!.validate();
      _submitButtonController.isFormValid = isFormValid;
    });
  }

  String? validateEmail(String? value) {
    if (value == null || !value.isEmail) {
      return "This field requires a valid email";
    }
    return null;
  }

  void sendResetLink() async {
    try {
      _submitButtonController.buttonState = ButtonState.loading;
      bool? isSent = await sendPasswordResetEmail(email: email);
      if (isSent != null) {
        Future.delayed(const Duration(seconds: 3), () {
          _submitButtonController.buttonState = ButtonState.success;

          Get.offAndToNamed(Routes.LOGIN);
        });
      } else {
        _submitButtonController.buttonState = ButtonState.error;
      }
    } catch (e) {
      Get.snackbar("Authentication Failed", "Please try again!");
    }
  }

  Future<bool?> sendPasswordResetEmail({required String email}) async {
    bool isSent = false;
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", 'oops $e');
    }
    return isSent;
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
