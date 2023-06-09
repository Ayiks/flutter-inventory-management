import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/modules/admin/users/controllers/add_user_controller.dart';
import 'package:inventory_1/app/utils/dimmension.dart';
import 'package:inventory_1/app/widgets/buttons.dart';

class AddUserView extends GetView<AddUserController> {
  const AddUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register User',
          style: TextStyle(fontSize: Dimensions.font20),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    size: Dimensions.iconSize24,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: ('Name'),
                  labelStyle: TextStyle(fontSize: Dimensions.font16),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey, width: Dimensions.width10 / 10)),
                  hintText: 'Enter your full Name',
                  hintStyle: TextStyle(fontSize: Dimensions.font16),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black, width: Dimensions.width10 / 10),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.radius15 - 5))),
                ),
                onChanged: controller.setUserName,
                validator: controller.validateUserName,
              ),
              SizedBox(
                height: Dimensions.height15,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    size: Dimensions.iconSize24,
                  ),
                  labelText: ('E-mail'),
                  labelStyle: TextStyle(fontSize: Dimensions.font16),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey, width: Dimensions.width10 / 10)),
                  hintText: 'Enter your E-mail',
                  hintStyle: TextStyle(fontSize: Dimensions.font16),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black, width: Dimensions.width10 / 10),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.radius15 - 10))),
                ),
                onChanged: controller.setEmail,
                validator: controller.validateEmail,
              ),
              SizedBox(
                height: Dimensions.height15,
              ),
              TextFormField(
                obscureText: true,
                obscuringCharacter: '*',
                keyboardType: TextInputType.visiblePassword,
                textCapitalization: TextCapitalization.none,
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
                          color: Colors.grey, width: Dimensions.width10 / 10)),
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(fontSize: Dimensions.font16),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black, width: Dimensions.width10 / 10),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.radius15 - 10))),
                ),
                onChanged: controller.setPassword,
                validator: controller.validatePassword,
              ),
              SizedBox(
                height: Dimensions.height15,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.numbers,
                    size: Dimensions.iconSize24,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: ('Mobile Number'),
                  labelStyle: TextStyle(fontSize: Dimensions.font16),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey, width: Dimensions.width10 / 10)),
                  hintText: 'Enter your Mobile Number',
                  hintStyle: TextStyle(fontSize: Dimensions.font16),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black, width: Dimensions.width10 / 10),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.radius15 - 10))),
                ),
                onChanged: controller.setPhoneNumber,
                validator: controller.validatePhoneNumber,
              ),
              SizedBox(
                height: Dimensions.height15,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.work,
                    size: Dimensions.iconSize24,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: ('Company name'),
                  labelStyle: TextStyle(fontSize: Dimensions.font16),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey, width: Dimensions.width10 / 10)),
                  hintText: 'Enter your Company Name',
                  hintStyle: TextStyle(fontSize: Dimensions.font16),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black, width: Dimensions.width10 / 10),
                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                ),
                // onChanged: controller.setCompany,
                // validator: controller.validateCompany,
              ),
              SizedBox(
                height: Dimensions.height30,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 13, 70, 117),
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius15 - 5)),
                child: PrimaryButton(
                  onPressed: controller.createUser,
                  text: "Create User",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
