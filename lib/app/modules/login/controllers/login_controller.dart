import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/user_profile/user_profile.dart';
import 'package:inventory_1/app/routes/app_pages.dart';
import 'package:inventory_1/app/widgets/buttons.dart';

class LoginController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final SubmitButtonController _submitButtonController =
      Get.find<SubmitButtonController>();

  final _email = ''.obs;
  String get email => _email.value;
  set email(String value) => _email.value = value;

  final _password = ''.obs;
  String get password => _password.value;
  set password(String value) => _password.value = value;

  final _obscureText = false.obs;
  bool get obscureText => _obscureText.value;
  set obscureText(bool value) => _obscureText.value = value;

  late Worker _worker;
  late final GlobalKey<FormState> formKey;

  @override
  void onInit() async {
    super.onInit();
    formKey = GlobalKey<FormState>();

    _worker = everAll([_email, _password], (_) {
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

  String? validatePassword(String? value) {
    if (value == null) {
      return "This field is required";
    } else if (value.length < 6) {
      return "Password must be more than 6 characters";
    }
    return null;
  }

  void login() async {
    try {
      _submitButtonController.buttonState = ButtonState.loading;
      UserCredential? userCredential =
          await signInWithEmailAndPassword(email: email, password: password);

      if (userCredential != null) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .get()
            .then((DocumentSnapshot doc) {
          var json = doc.data() as dynamic;
          if (json != null) {
            UserProfile userProfile = UserProfile.fromJson({...json});
            _submitButtonController.buttonState = ButtonState.success;
            Future.delayed(const Duration(seconds: 1), () {
              if (userProfile.role == 'admin') {
                Get.offAndToNamed(Routes.STORES);
              } else {
                Get.offAndToNamed(
                  Routes.FIRST_PAGE,
                  arguments: [userProfile.company, userProfile.name],
                );
              }
            });
          }
        }).timeout(const Duration(seconds: 30), onTimeout: () {
          Get.snackbar('Internet Error', 'PLease check your connection');
        });
      } else {
        _submitButtonController.buttonState = ButtonState.error;
        Get.snackbar('Error', 'Please check your email and password again!',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: const Duration(seconds: 5));
      }
    } catch (e) {
      Get.snackbar("Authentication Failed", "Please try again!");
    }
  }

  Future<UserCredential?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    return null;
  }

  @override
  void onClose() {
    _worker.dispose();
    super.onClose();
  }
}
