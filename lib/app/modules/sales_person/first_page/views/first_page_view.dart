import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/routes/app_pages.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

import '../controllers/first_page_controller.dart';

class FirstPageView extends GetView<FirstPageController> {
  const FirstPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
              top: Dimensions.height45,
              left: Dimensions.height15,
              right: Dimensions.height15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Welcome back!'),
                Text(
                  controller.userName,
                  style: TextStyle(
                      fontSize: Dimensions.font20, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: Dimensions.height20),
                Container(
                  padding: EdgeInsets.all(Dimensions.height15),
                  // height: Dimensions.height45 * 5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.radius20))),
                  child: Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.store().name,
                              style: TextStyle(
                                  fontSize: Dimensions.font20,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: Dimensions.height10),
                            const Divider(),
                            const Text('Today\'s Sales'),
                            SizedBox(height: Dimensions.height10),
                            const Text(
                              'GHC 3,000',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: Dimensions.height30),
                            const Text('Products'),
                            SizedBox(height: Dimensions.height10),
                            const Text(
                              '200',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )
                          ])),
                )
              ]),
        ),
      ),
      bottomNavigationBar: Material(
        child: GestureDetector(
          onTap: () {
            Get.toNamed(Routes.SHOPPING, arguments: [controller.userCompanyId]);
          },
          child: Container(
            height: Dimensions.height20 * 5,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 6, 5, 77),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20))),
            child: Center(
                child: Text(
              'MAKE SALE',
              style:
                  TextStyle(color: Colors.white, fontSize: Dimensions.font20),
            )),
          ),
        ),
      ),
    );
  }
}
