import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/routes/app_pages.dart';
import 'package:inventory_1/app/utils/dimmension.dart';
import 'package:inventory_1/app/widgets/buttons.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: controller.formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height10),
              children: [
                Image.asset(
                  'assets/login_icon.gif',
                  height: 150,
                ),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: Dimensions.font20 * 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                TextFormField(
                  // controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      size: Dimensions.iconSize24,
                    ),
                    labelText: ('E-mail'),
                    labelStyle: TextStyle(fontSize: Dimensions.font16),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey,
                            width: Dimensions.width10 / 10)),
                    hintText: 'Enter your E-mail',
                    hintStyle: TextStyle(fontSize: Dimensions.font16),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black,
                            width: Dimensions.width10 / 10),
                        borderRadius: BorderRadius.all(
                            Radius.circular(Dimensions.radius15 - 10))),
                  ),
                  onChanged: (value) => controller.email = value,
                  validator: controller.validateEmail,
                ),
                SizedBox(
                  height: Dimensions.height15,
                ),
                TextFormField(
                  // controller: _passwordController,
                  obscureText: true,
                  obscuringCharacter: '*',
                  keyboardType: TextInputType.visiblePassword,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      size: Dimensions.iconSize24,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: ('Password'),
                    labelStyle: TextStyle(fontSize: Dimensions.font16),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey,
                            width: Dimensions.width10 / 10)),
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(fontSize: Dimensions.font16),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black,
                            width: Dimensions.width10 / 10),
                        borderRadius: BorderRadius.all(
                            Radius.circular(Dimensions.radius15 - 10))),
                  ),
                  onChanged: (value) => controller.password = value,
                  validator: controller.validatePassword,
                ),
                SizedBox(
                  height: Dimensions.height15,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        Get.offAndToNamed(Routes.FORGOR_PASSWORD);
                      },
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 4, 82, 146),
                            fontSize: Dimensions.font16),
                        textAlign: TextAlign.right,
                      )),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 4, 82, 146),
                      borderRadius: BorderRadius.circular(10)),
                  child: PrimaryButton(
                    onPressed: controller.login,
                    text: "Login",
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
              ],
            )),
      ),
    );
  }
}
