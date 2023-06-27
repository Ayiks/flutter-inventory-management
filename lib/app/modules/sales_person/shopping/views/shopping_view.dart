import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/product/product.dart';
import 'package:inventory_1/app/modules/sales_person/shopping/widgets/add_to_basket_bottom_sheet.dart';
import 'package:inventory_1/app/routes/app_pages.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

import '../controllers/shopping_controller.dart';

class ShoppingView extends GetView<ShoppingController> {
  const ShoppingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping',
          style: TextStyle(fontSize: Dimensions.font26 - 2),
        ),
        actions: [
          controller.role == 'user'
              ? IconButton(
                  onPressed: controller.handleSignOut,
                  icon: Icon(
                    Icons.logout_rounded,
                    size: Dimensions.iconSize24,
                    color: Colors.red,
                  ))
              : Container()
        ],
        centerTitle: true,
      ),
      body: Obx(
        () => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: Dimensions.height10,
                    right: Dimensions.width10,
                    left: Dimensions.width10,
                    bottom: Dimensions.height10 - 5),
                child: TextFormField(
                  controller: controller.searchController,
                  onChanged: (value) {
                    controller.searchText = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      size: Dimensions.iconSize24,
                      color: Colors.black,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: ('Search'),
                    labelStyle: TextStyle(fontSize: Dimensions.font16),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: Dimensions.width10 / 10,
                      ),
                    ),
                    hintText: 'Search items here',
                    hintStyle: TextStyle(fontSize: Dimensions.font16),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: Dimensions.width10 / 10,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(Dimensions.radius15),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: ListView.separated(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width10,
                    vertical: Dimensions.height10),
                itemCount: controller.searchResults.length,
                itemBuilder: (context, index) {
                  Product product = controller.searchResults[index];

                  return GestureDetector(
                    onTap: () {
                      Get.bottomSheet(AddToBasketBottomSheet(product: product));
                    },
                    child: Container(
                      height: Dimensions.height20 * 4,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: Dimensions.width10 / 10,
                                  color: Colors.grey))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${product.name} ${product.type ?? ''} ',
                              style: TextStyle(
                                  fontSize: Dimensions.font16,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'GHC ${product.price} ',
                              style: TextStyle(
                                  fontSize: Dimensions.font16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext int, index) {
                  return Divider(
                    height: Dimensions.height10,
                  );
                },
              ))
            ]),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.height20, horizontal: Dimensions.width30),
        child: GestureDetector(
          onTap: () {
            Get.toNamed(Routes.CHECKOUT, arguments: [controller.storeID]);
          },
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 13, 71, 118),
                borderRadius: BorderRadius.circular(Dimensions.radius15 - 5)),
            height: Dimensions.height20 * 3,
            width: Dimensions.width30,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height20,
                  horizontal: Dimensions.width20),
              child: Obx(
                () => Text(
                  'CONFIRM ORDER ${controller.itemsInBasketCount} ITEM(S) GHC ${controller.getTotal()}',
                  style: TextStyle(
                      fontSize: Dimensions.font16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
