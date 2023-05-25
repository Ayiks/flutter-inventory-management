import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/utils/dimmension.dart';
import 'package:inventory_1/app/widgets/buttons.dart';

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
            ),
            SizedBox(height: Dimensions.height45),
            PrimaryButton(
              onPressed: () {},
              text: 'Save',
              color: Colors.blue,
            )
          ],
        )),
      ),
    );
  }
}
