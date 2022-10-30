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
        child: Obx(() => ListView.separated(
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height10,
                  horizontal: Dimensions.width10),
              itemCount: controller.productList.length,
              itemBuilder: ((context, index) {
                Product product = controller.productList[index];
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
                              color: (quantity) <= lowOnStock && (quantity) > 0
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
                                  controller.showAlertDialog(product: product);
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
            )),
      ),
    );
  }
}
