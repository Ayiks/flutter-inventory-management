import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/store/store.dart';
import 'package:inventory_1/app/modules/admin/stores/controllers/stores_controller.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

class ConfirmStoreDeleteAlertDialog extends GetView<StoresController> {
  final Store store;

  const ConfirmStoreDeleteAlertDialog({
    required this.store,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Icon(
        Icons.warning_amber_rounded,
        color: Colors.red,
        size: Dimensions.font26 * 2,
      ),
      content: Obx(() {
        if (controller.isDeleting) {
          return const SizedBox(
            child: Center(
              child: Column(
                children: [
                  Text('Deleting store and related data, Please wait!...'),
                  SizedBox(
                    height: 10,
                  ),
                  CircularProgressIndicator.adaptive(),
                ],
              ),
            ),
          );
        } else {
          return const Text(
              'This action will delete every data related this store.\n\n NB: This action is NOT reversible, do you want to proceed?');
        }
      }),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
            Get.back();
          },
          child: Text(
            'No',
            style: TextStyle(fontSize: Dimensions.font20),
          ),
        ),
        TextButton(
          onPressed: () {
            controller.onDeleteStoreConfirmed(store);
          },
          child: Text(
            'Yes',
            style: TextStyle(color: Colors.red, fontSize: Dimensions.font16),
          ),
        ),
      ],
    );
  }
}
