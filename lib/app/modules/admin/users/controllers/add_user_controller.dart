import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/user_profile/user_profile.dart';
import 'package:inventory_1/app/widgets/buttons.dart';

class AddUserController extends GetxController {
  final SubmitButtonController _submitButtonController =
      Get.find<SubmitButtonController>();

  late final GlobalKey<FormState> formKey;
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  final CollectionReference<Map<String, dynamic>> _userCollection =
      _firebaseFirestore.collection("users");

  final RxString _userPassword = RxString('');
  String get userPassword => _userPassword.value;
  set userPassword(String value) => _userPassword.value = value;

  final Rx<UserProfile> _userProfile = Rx<UserProfile>(
    UserProfile(
      userId: '',
      name: '',
      email: '',
      phoneNumber: '',
      storeId: '',
    ),
  );
  UserProfile get userProfile => _userProfile.value;

  late Worker _worker;

  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey<FormState>();
    _worker = ever(_userProfile, (userProfile) {
      _submitButtonController.isFormValid = formKey.currentState!.validate();
    });
  }

  void setUserName(String value) {
    _userProfile(userProfile.copyWith(name: value));
  }

  void setEmail(String value) {
    _userProfile(userProfile.copyWith(email: value));
  }

  void setPhoneNumber(String value) {
    _userProfile(userProfile.copyWith(phoneNumber: value));
  }

  void setPassword(String value) {
    userPassword = value;
  }

  // void setCompany(String value) {
  //   _userProfile(userProfile.copyWith(company: value));
  // }

  String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return "Name is required";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty || !value.isEmail) {
      return "a valid Email is required";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty || value.length == 6) {
      return "Password is required";
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty || !value.isPhoneNumber) {
      return "A valid Phonenumber is required";
    }
    return null;
  }

  void createUser() async {
    try {
      _submitButtonController.buttonState = ButtonState.loading;
      if (formKey.currentState!.validate()) {
        FirebaseAuth.instance
            // create user account
            .createUserWithEmailAndPassword(
                email: userProfile.email, password: userPassword)
            .then((userCredential) async {
          await _userCollection.doc(userCredential.user!.uid).set({
            ...userProfile.toJson(),
            "password": userPassword,
            "userId": userCredential.user!.uid,
          }).then((_) {
            // set the button to success
            _submitButtonController.buttonState = ButtonState.success;
            Get.back();
            Get.snackbar("Success", "Person added successfully");
          }).catchError((onError) {
            _submitButtonController.buttonState = ButtonState.error;
            Get.snackbar("Error", "Something went wrong... $onError");
          }).timeout(const Duration(seconds: 10), onTimeout: () {
            _submitButtonController.buttonState = ButtonState.error;

            Get.snackbar(
                "Error", "Please check your internet connection and try again");
          });
        });
      }
    } catch (e) {
      _submitButtonController.buttonState = ButtonState.error;

      Get.snackbar("Error", "Details: $e");
    }

    _submitButtonController.buttonState = ButtonState.idle;
  }
}
