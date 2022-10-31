import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/routes/app_pages.dart';
import 'package:inventory_1/app/utils/dimmension.dart';
import 'package:inventory_1/app/widgets/buttons.dart';

import '../controllers/forgor_password_controller.dart';

class ForgorPasswordView extends GetView<ForgorPasswordController> {
  const ForgorPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: controller.formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height10 * 10),
              children: [
                Center(
                    child: Text(
                  '',
                  style: TextStyle(
                    fontSize: Dimensions.font20 * 2,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                SizedBox(
                  height: Dimensions.height20,
                ),
                const Center(
                  child: Text(
                    'Provide your e-mail and we will send you a link to reset your password',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height45,
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
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 4, 82, 146),
                      borderRadius: BorderRadius.circular(10)),
                  child: PrimaryButton(
                    onPressed: controller.sendResetLink,
                    text: "Send Reset Link",
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        Get.offAndToNamed(Routes.LOGIN);
                      },
                      child: Text(
                        'Back to Login',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 4, 82, 146),
                            fontSize: Dimensions.font16),
                        textAlign: TextAlign.right,
                      )),
                ),
              ],
            )),
      ),
    );
  }
}
