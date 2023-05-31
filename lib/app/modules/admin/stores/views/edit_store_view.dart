import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

import '../controllers/edit_store_controller.dart';

class EditStoreView extends GetView<EditStoreController> {
  const EditStoreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Details'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.all(Dimensions.height15),
        children: [
          Obx(() {
            // Store? store = controller.store;
            return Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.store_outlined),
                          prefixIconColor: Colors.red,
                          border: OutlineInputBorder()),
                      initialValue: controller.store?.name,
                      validator: controller.validateName,
                      onChanged: controller.setStoreName,
                    ),
                    SizedBox(height: Dimensions.height15),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.location_on_outlined,
                            color: Colors.green,
                          ),
                          border: OutlineInputBorder()),
                      initialValue: controller.store?.location,
                      validator: controller.validateLocation,
                      onChanged: controller.setStoreLocation,
                    ),
                    SizedBox(height: Dimensions.height15),
                    TextFormField(
                      maxLines: 3,
                      keyboardType: TextInputType.streetAddress,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.location_city_outlined,
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder()),
                      initialValue: controller.store?.address,
                      onChanged: controller.setStoreAddress,
                    ),
                    SizedBox(height: Dimensions.height45),
                    GestureDetector(
                      onTap: controller.updateStore,
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 16, 81, 133),
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15 - 5)),
                        height: Dimensions.height10 * 5,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                            child: Text(
                          'Save Changes',
                          style: TextStyle(
                              fontSize: Dimensions.font16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ],
                ));
          })
        ],
      )),
    );
  }
}
