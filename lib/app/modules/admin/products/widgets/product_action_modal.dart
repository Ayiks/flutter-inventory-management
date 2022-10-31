import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventory_1/app/data/models/product/product.dart';
import 'package:inventory_1/app/modules/admin/products/widgets/confirm_product_delete_alert.dart';
import 'package:inventory_1/app/routes/app_pages.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

class ProductActionModal extends StatelessWidget {
  final Product product;

  ProductActionModal({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 30,
      content: Container(
        height: Dimensions.height20 * 5,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
                Get.toNamed(Routes.EDIT_PRODUCT, arguments: product);
              },
              child: Container(
                height: Dimensions.height20 * 2,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius15 - 5)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.height10,
                      horizontal: Dimensions.width10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Edit Product',
                        style: TextStyle(
                            fontSize: Dimensions.font16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 22, 90, 145)),
                      ),
                      Icon(
                        Icons.edit_note_rounded,
                        size: Dimensions.iconSize24,
                        color: Color.fromARGB(225, 22, 90, 145),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height15,
            ),
            GestureDetector(
              onTap: () async {
                Get.dialog(ConfirmProductDeleteAlertDialog(product: product));
              },
              child: Container(
                height: Dimensions.height20 * 2,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius15 - 5)),
                child: Padding(
                  padding: EdgeInsets.all(Dimensions.width10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delete Product',
                        style: TextStyle(
                            fontSize: Dimensions.font16,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.red,
                        size: Dimensions.iconSize24,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
