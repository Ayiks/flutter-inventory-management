import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/basket/basket_model.dart';
import 'package:inventory_1/app/data/models/order/order.dart';
import 'package:inventory_1/app/utils/dimmension.dart';
import 'package:inventory_1/app/utils/helpers.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../controllers/orders_controller.dart';

class TodayOrders extends GetView<OrdersController> {
  TodayOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Today\'s History',
          style: TextStyle(fontSize: Dimensions.font20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width10, vertical: Dimensions.height20),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height10,
            ),
            Obx(
              () => Expanded(
                child: controller.todayOrders.isNotEmpty
                    ? ListView.separated(
                        itemCount: controller.todayOrders.length,
                        itemBuilder: (context, index) {
                          Order order = controller.todayOrders[index];

                          return Container(
                            height: Dimensions.height20 * 10,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radius15 - 5)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: Dimensions.height20,
                                    right: Dimensions.width10,
                                    left: Dimensions.width20,
                                  ),
                                  child: Container(
                                      height: Dimensions.height20 * 2,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width:
                                                      Dimensions.width10 / 10,
                                                  color: Colors.grey))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Item(s)',
                                            style: TextStyle(
                                                fontSize: Dimensions.font16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                showBarModalBottomSheet(
                                                    context: context,
                                                    builder: (context) {
                                                      return ListView.builder(
                                                          itemCount: order
                                                              .orderDetails
                                                              .length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            MapEntry<String,
                                                                    BasketItem>
                                                                entry = order
                                                                    .orderDetails
                                                                    .entries
                                                                    .elementAt(
                                                                        index);

                                                            return ListTile(
                                                              title: Text(
                                                                entry
                                                                    .value
                                                                    .product
                                                                    .name,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        Dimensions
                                                                            .font16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              subtitle: Text(
                                                                'Quantity: ${entry.value.quantity}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        Dimensions
                                                                            .font16),
                                                              ),
                                                              trailing: Text(
                                                                'GHC ${entry.value.product.price}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        Dimensions
                                                                            .font16),
                                                              ),
                                                            );
                                                          });
                                                    });
                                              },
                                              child: Text(
                                                'View details',
                                                style: TextStyle(
                                                    fontSize: Dimensions.font16,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color.fromARGB(
                                                        255, 10, 86, 148)),
                                              ))
                                        ],
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: Dimensions.height20,
                                      right: Dimensions.width10,
                                      left: Dimensions.width20),
                                  child: Container(
                                      height: Dimensions.height20,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width:
                                                      Dimensions.width10 / 10,
                                                  color: Colors.grey))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Quantity Sold',
                                            style: TextStyle(
                                                fontSize: Dimensions.font16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            '${order.orderQuantity}',
                                            style: TextStyle(
                                                fontSize: Dimensions.font16),
                                          ),
                                        ],
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: Dimensions.height20,
                                      right: Dimensions.width10,
                                      left: Dimensions.width20),
                                  child: Container(
                                      height: Dimensions.height20,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width:
                                                      Dimensions.width10 / 10,
                                                  color: Colors.grey))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Total Amount',
                                            style: TextStyle(
                                                fontSize: Dimensions.font16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            'GHC ${order.total}',
                                            style: TextStyle(
                                                fontSize: Dimensions.font16),
                                          ),
                                        ],
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: Dimensions.height20,
                                      right: Dimensions.width10,
                                      left: Dimensions.width20),
                                  child: Container(
                                    height: Dimensions.height20,
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Date',
                                          style: TextStyle(
                                              fontSize: Dimensions.font16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          parseTimestamp(order.createdAt),
                                          style: TextStyle(
                                              fontSize: Dimensions.font16),
                                        ),
                                      ],
                                    ),
                                    // decoration: BoxDecoration(
                                    //     border: Border(
                                    //         bottom: BorderSide(
                                    //             width: Dimensions.width10 / 10,
                                    //             color: Colors.grey)))
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: ((context, index) {
                          return SizedBox(
                            height: Dimensions.height10,
                          );
                        }),
                      )
                    : const Center(
                        child: Text("No sales made today"),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
