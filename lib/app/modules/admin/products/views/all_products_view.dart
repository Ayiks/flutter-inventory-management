import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/product/product.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

import '../controllers/all_products.dart';

class AllProdcutsView extends GetView<AllProductsController> {
  const AllProdcutsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.pageTitle,
          style: TextStyle(fontSize: Dimensions.font20),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(
          () => Column(
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
              SizedBox(
                height: Dimensions.height10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width10,
                ),
                child: Container(
                  height: Dimensions.height30,
                  decoration: BoxDecoration(color: Colors.black54),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total Stock Value:',
                        style: TextStyle(
                            fontSize: Dimensions.font16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      Obx((() {
                        return Text(
                          '${controller.getGrandQuantity()}',
                          style: TextStyle(
                              fontSize: Dimensions.font16, color: Colors.white),
                        );
                      }))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.height10,
                      horizontal: Dimensions.width10),
                  itemCount: controller.searchResults.length,
                  itemBuilder: ((context, index) {
                    Product product = controller.searchResults[index];
                    var quantity = product.quantity;
                    var lowOnStock = product.lowOnStock;
                    return Container(
                      height: Dimensions.height20 * 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black12),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height10,
                            horizontal: Dimensions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${product.name}  ${product.type}',
                                  style: TextStyle(
                                      fontSize: Dimensions.font16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: Dimensions.width10,
                                ),
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color:
                                      (quantity) <= lowOnStock && (quantity) > 0
                                          ? Colors.yellow
                                          : quantity == 0
                                              ? Colors.red
                                              : Colors.green,
                                )
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.width20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${product.quantity} in Stock',
                                  style: TextStyle(
                                      fontSize: Dimensions.font16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'GHC ${product.price}',
                                  style: TextStyle(
                                    fontSize: Dimensions.font16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                GestureDetector(
                                    onTap: (() {
                                      controller.showAlertDialog(
                                          product: product);
                                    }),
                                    child: Icon(
                                      Icons.more_horiz,
                                      size: Dimensions.iconSize24,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                  separatorBuilder: ((context, index) => const Divider()),
                ),
              ),
            ],
          ),
          // bottomNavigationBar: Container(
          //   decoration: BoxDecoration(
          //       border: Border(top: BorderSide(width: Dimensions.width10 / 10))),
          // ),
        ),
      ),
    );
  }
}
