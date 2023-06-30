import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/modules/admin/dashboard/controllers/dashboard_controller.dart';
import 'package:inventory_1/app/modules/admin/dashboard/widgets/card_dash.dart';
import 'package:inventory_1/app/routes/app_pages.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Dashboard',
          style: TextStyle(fontSize: Dimensions.font20),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: Dimensions.width10),
            child: IconButton(
              icon: Icon(
                Icons.more_vert,
                size: Dimensions.iconSize24,
              ),
              onPressed: () {
                Get.toNamed(Routes.USER_PROFILE);
              },
            ),
          ),
          // IconButton(
          //   onPressed: controller.handleSignOut,
          //   icon: Icon(
          //     Icons.logout_rounded,
          //     size: Dimensions.iconSize24,
          //     color: Colors.red,
          //   ),
          // ),
        ],
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width20, vertical: Dimensions.height20),
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                'Stats for ${controller.storeName}',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: Dimensions.font26),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              Obx(() {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StatCard(
                            color: Colors.blue[900],
                            icon: Icons.calendar_month,
                            label: 'Daily Sales',
                            value: controller.dashboardStats().dailySales,
                            onTap: () {
                              Get.toNamed(
                                Routes.TODAYS_ORDERS,
                                arguments: controller.storeID,
                              );
                            }),
                        StatCard(
                            color: Colors.green,
                            icon: Icons.list_alt,
                            label: 'Total Stock ',
                            value:
                                controller.dashboardStats().totalProductCount,
                            onTap: () {
                              // print("tapped");
                              Get.toNamed(Routes.ALL_PRODUCTS,
                                  arguments: controller.storeID);
                            }),
                      ],
                    ),
                    SizedBox(height: Dimensions.height10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StatCard(
                            color: Colors.amber,
                            icon: Icons.warning_amber_rounded,
                            label: 'Low on Stock ',
                            value: controller
                                .dashboardStats()
                                .lowOnStockProductsCount,
                            onTap: () {
                              Get.toNamed(Routes.LOW_ON_STOCK_PRODUCT,
                                  arguments: controller.storeID);
                            }),
                        StatCard(
                            color: Colors.red,
                            icon: Icons.warning_amber_rounded,
                            label: 'Out Of Stock ',
                            value: controller
                                .dashboardStats()
                                .outOfStockProductsCount,
                            onTap: () {
                              Get.toNamed(Routes.OUT_OF_STOCK_PRODUCT,
                                  arguments: controller.storeID);
                            }),
                      ],
                    )
                  ],
                );
              }),
              SizedBox(
                height: Dimensions.height20,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(
                    Routes.ORDERS,
                    arguments: controller.storeID,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.black,
                              width: Dimensions.width10 / 10))),
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width10,
                      vertical: Dimensions.height10),
                  height: Dimensions.height45 + 5,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.history,
                            size: Dimensions.iconSize24,
                            color: const Color.fromARGB(255, 11, 72, 122),
                          ),
                          Text(
                            'Transaction History',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 11, 72, 122),
                                fontSize: Dimensions.font16),
                          )
                        ],
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: Dimensions.iconSize24,
                        color: const Color.fromARGB(255, 11, 72, 122),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '',
                    style: TextStyle(
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: (() {
                      Get.toNamed(Routes.NEW_PRODUCT,
                          arguments: controller.storeID);
                    }),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 11, 72, 122),
                          borderRadius: BorderRadius.circular(10)),
                      height: Dimensions.height20 * 2,
                      width: Dimensions.width30 * 5,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: Dimensions.height10),
                        child: Center(
                          child: Text(
                            ' +NEW ITEM',
                            style: TextStyle(
                                fontSize: Dimensions.font16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.height30 * 2,
              ),

              // ListView.separated(
              //     scrollDirection: Axis.vertical,
              //     physics: const ScrollPhysics(
              //       parent: NeverScrollableScrollPhysics(),
              //     ),
              //     shrinkWrap: true,
              //     separatorBuilder: (BuildContext context, int index) {
              //       return SizedBox(height: Dimensions.height10);
              //     },
              //     itemCount: 2, //controller.recentProducts.length,
              //     itemBuilder: ((BuildContext context, int index) {
              //       // var newDat = date.toDate();

              //       // var newDate = DateFormat.yMEd()
              //       //     .add_jm()
              //       //     .format(newDat);

              //       return Container(
              //         height: Dimensions.height20 * 5,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(10),
              //             color: Colors.black12),
              //         child: Container(
              //           padding: EdgeInsets.symmetric(
              //               horizontal: Dimensions.width10,
              //               vertical: Dimensions.height10),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Row(
              //                 mainAxisAlignment:
              //                     MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Text(
              //                     'Chicken Hard',
              //                     style: TextStyle(
              //                         fontSize: Dimensions.font16,
              //                         fontWeight: FontWeight.w500),
              //                   ),
              //                   // SizedBox(
              //                   //   width: Dimensions.width10,
              //                   // ),
              //                   // Text(newDate),
              //                   SizedBox(
              //                     width: Dimensions.width10,
              //                   ),
              //                   Icon(
              //                     Icons.warning_amber_rounded,
              //                     size: Dimensions.iconSize24,
              //                     color: 1 <= 20 && 1 > 0
              //                         ? Colors.yellow
              //                         : 0 == 0
              //                             ? Colors.red
              //                             : Colors.green,
              //                   )
              //                 ],
              //               ),
              //               SizedBox(
              //                 height: Dimensions.height20,
              //               ),
              //               Row(
              //                 mainAxisAlignment:
              //                     MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Text(
              //                     ' in Stock',
              //                     style: TextStyle(
              //                         fontSize: Dimensions.font16,
              //                         fontWeight: FontWeight.w500),
              //                   ),
              //                   GestureDetector(
              //                       onTap: (() {
              //                         controller.showProductActionModal();
              //                       }),
              //                       child: Icon(
              //                         Icons.more_horiz,
              //                         size: Dimensions.iconSize24,
              //                       ))
              //                 ],
              //               )
              //             ],
              //           ),
              //         ),
              //       );
              //     }))
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.SHOPPING, arguments: controller.storeID);
                },
                child: Container(
                  height: Dimensions.height30 * 2.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 11, 72, 122),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'SELL',
                      style: TextStyle(
                          fontSize: Dimensions.font26, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          )),
      // bottomNavigationBar: GestureDetector(
      //   onTap: () => Get.toNamed(Routes.SHOPPING),
      //   child: Container(
      //     height: Dimensions.height20 * 4,
      //     width: MediaQuery.of(context).size.width,
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.only(
      //           topLeft: Radius.circular(Dimensions.radius15),
      //           topRight: Radius.circular(Dimensions.radius15)),
      //       color: Color.fromARGB(255, 11, 72, 122),
      //     ),
      //     child: Center(
      //         child: Text(
      //       'Sell',
      //       style: TextStyle(
      //           fontSize: Dimensions.font26,
      //           fontWeight: FontWeight.w600,
      //           color: Colors.white),
      //     )),
      //   ),
      // ),
    );
  }
}
