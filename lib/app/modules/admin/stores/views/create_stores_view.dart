import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

import '../controllers/create_stores_controller.dart';

class CreateStoresView extends GetView<CreateStoresController> {
  const CreateStoresView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Store'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Dimensions.height15),
        child: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Store Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.store_outlined,
                      color: Colors.red,
                    ),
                  ),
                  onChanged: controller.setStoreName,
                  validator: controller.validateStoreName,
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Location',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.location_on_outlined,
                      color: Colors.green,
                    ),
                  ),
                  onChanged: controller.setStoreLocation,
                  validator: controller.validateStoreLocation,
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                TextFormField(
                  maxLines: 3,
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.location_city_outlined,
                      color: Colors.blue,
                    ),
                  ),
                  onChanged: controller.setStoreAddress,
                ),
                SizedBox(height: Dimensions.height45),
                GestureDetector(
                  onTap: () {
                    controller.createStore();
                  },
                  child: Container(
                    height: Dimensions.height10 * 5,
                    width: Dimensions.width20 * 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 9, 82, 142)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, top: 15),
                      child: Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimensions.font16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
