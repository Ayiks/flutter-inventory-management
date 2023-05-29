import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/store/store.dart';
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
            Store? store = controller.store;
            return Form(
                child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.store_outlined),
                      border: OutlineInputBorder()),
                )
              ],
            ));
          })
        ],
      )),
    );
  }
}
