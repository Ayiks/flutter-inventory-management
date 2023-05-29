import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/store/store.dart';
import 'package:inventory_1/app/routes/app_pages.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

class StoreActionModal extends StatelessWidget {
  final Store store;
  const StoreActionModal({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 30,
      content: SizedBox(
        height: Dimensions.height20 * 5,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
                Get.toNamed(Routes.EDIT_STORE, arguments: store);
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
                        'Edit Store',
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
                // Get.dialog(ConfirmProductDeleteAlertDialog(product: product));
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
                        'Delete Store',
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
