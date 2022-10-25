import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/modules/dashboard/widgets/card_dash.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

import 'package:inventory_1/app/modules/dashboard/controllers/dashboard_controller.dart';

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
                  controller.gotoAccountPage();
                },
              ),
            )
          ],
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width20, vertical: Dimensions.height20),
            child: ListView(
              shrinkWrap: true,
              children: [
                Text(
                  'Stats',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: Dimensions.font26),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    spacing: Dimensions.width20,
                    runSpacing: Dimensions.width20,
                    children: [
                      StatCard(
                          color: Colors.blue,
                          icon: Icons.desk_rounded,
                          label: 'Daily Sales',
                          value: controller.dailySales,
                          onTap: () {}),
                      StatCard(
                          icon: Icons.desk_rounded,
                          label: 'Total Stock ',
                          value: controller.totalProductCount,
                          onTap: () {}),
                      StatCard(
                          icon: Icons.desk_rounded,
                          label: 'Low on Stock ',
                          value: controller.lowOnStockProductsCount,
                          onTap: () {}),
                      StatCard(
                          icon: Icons.desk_rounded,
                          label: 'Out Of Stock ',
                          value: controller.outOfStockProductsCount,
                          onTap: () {}),
                    ]),
                SizedBox(
                  height: Dimensions.height20,
                ),
                GestureDetector(
                  onTap: () {
                    controller.gotoTransactionHistory();
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
                              color: Color.fromARGB(255, 11, 72, 122),
                            ),
                            Text(
                              'Transaction History',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 11, 72, 122),
                                  fontSize: Dimensions.font16),
                            )
                          ],
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: Dimensions.iconSize24,
                          color: Color.fromARGB(255, 11, 72, 122),
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
                      'Recent',
                      style: TextStyle(
                          fontSize: Dimensions.font20,
                          fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: (() {
                        controller.gotoCreateNewItem();
                      }),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 11, 72, 122),
                            borderRadius: BorderRadius.circular(10)),
                        height: Dimensions.height20 * 2,
                        width: Dimensions.width30 * 5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Dimensions.height10),
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
                  height: Dimensions.height15,
                ),
                ListView.separated(
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(
                      parent: NeverScrollableScrollPhysics(),
                    ),
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: Dimensions.height10);
                    },
                    itemCount: 2, //controller.recentProducts.length,
                    itemBuilder: ((BuildContext context, int index) {
                      // var newDat = date.toDate();

                      // var newDate = DateFormat.yMEd()
                      //     .add_jm()
                      //     .format(newDat);

                      return Container(
                        height: Dimensions.height20 * 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black12),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width10,
                              vertical: Dimensions.height10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Chicken Hard',
                                    style: TextStyle(
                                        fontSize: Dimensions.font16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  // SizedBox(
                                  //   width: Dimensions.width10,
                                  // ),
                                  // Text(newDate),
                                  SizedBox(
                                    width: Dimensions.width10,
                                  ),
                                  Icon(
                                    Icons.warning_amber_rounded,
                                    size: Dimensions.iconSize24,
                                    color: 1 <= 20 && 1 > 0
                                        ? Colors.yellow
                                        : 0 == 0
                                            ? Colors.red
                                            : Colors.green,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: Dimensions.height20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    ' in Stock',
                                    style: TextStyle(
                                        fontSize: Dimensions.font16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  GestureDetector(
                                      onTap: (() {
                                        controller.showProductActionModal();
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
                    }))
              ],
            )));
  }
}
