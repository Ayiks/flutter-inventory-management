import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/store/store.dart';
import 'package:inventory_1/app/modules/admin/stores/widgets/store_card.dart';
import 'package:inventory_1/app/routes/app_pages.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

import '../controllers/stores_controller.dart';

class StoresView extends GetView<StoresController> {
  const StoresView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Stores'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.CREATE_STORES);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: SafeArea(
          child: Obx(() => controller.storeList.isEmpty
              ? Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/store.gif',
                        height: Dimensions.height45 * 6,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        "You have no Store yet!",
                        style: TextStyle(
                            fontSize: Dimensions.font20,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                )
              : ListView.separated(
                  padding: EdgeInsets.all(Dimensions.height15),
                  itemBuilder: ((context, index) {
                    Store store = controller.storeList[index];
                    return GestureDetector(
                      onTap: () => Get.toNamed(Routes.DASHBOARD),
                      child: StoreCard(
                        onPressed: () {
                          controller.showAlertDialog(store: store);
                        },
                        title: store.name,
                        numberOfProducts: '${controller.products.length}',
                        valueOfProducts: "Ghc ${controller.getQuantity(store)}",
                      ),
                    );
                  }),
                  separatorBuilder: ((index, context) {
                    return const Divider();
                  }),
                  itemCount: controller.storeList.length))),
    );
  }
}
