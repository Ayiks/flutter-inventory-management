import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/product/product.dart';
import 'package:inventory_1/app/modules/admin/products/controllers/all_products.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

class ConfirmProductDeleteAlertDialog extends GetView<AllProductsController> {
  final Product product;

  const ConfirmProductDeleteAlertDialog({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Icon(Icons.warning_amber_rounded, color: Colors.red),
      content: const Text('Are you sure you want to delete product?'),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
              Get.back();
            },
            child: const Text('No')),
        TextButton(
            onPressed: () {
              controller.onDeleteProductConfirmed(product);
            },
            child: Text(
              'Yes',
              style: TextStyle(color: Colors.red, fontSize: Dimensions.font16),
            ))
      ],
    );
  }
}
