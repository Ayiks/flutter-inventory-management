import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/basket/basket_model.dart';
import 'package:inventory_1/app/data/models/order/order.dart';
import 'package:inventory_1/app/utils/dimmension.dart';
import 'package:inventory_1/app/utils/helpers.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../controllers/orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
  OrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transaction History',
          style: TextStyle(fontSize: Dimensions.font20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width10, vertical: Dimensions.height20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextFormField(
                    onTap: () {
                      controller.openDatePicker(setFromDate: true);
                    },
                    keyboardType: TextInputType.none,
                    showCursor: false,
                    controller: controller.filterFromDateTextEditingController,
                    textCapitalization: TextCapitalization.sentences,
                    maxLines: 1,
                    decoration: InputDecoration(
                        label: const Text('Set Date From'),
                        labelStyle: TextStyle(fontSize: Dimensions.font16),
                        hintText: 'Set Date From',
                        hintStyle: TextStyle(fontSize: Dimensions.font16),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: Dimensions.width10 / 10))),
                  ),
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Expanded(
                  child: TextFormField(
                    onTap: () {
                      controller.openDatePicker(setFromDate: false);
                    },
                    keyboardType: TextInputType.none,
                    showCursor: false,
                    controller: controller.filterToDateTextEditingController,
                    textCapitalization: TextCapitalization.sentences,
                    maxLines: 1,
                    decoration: InputDecoration(
                      label: const Text('Set Date To'),
                      labelStyle: TextStyle(fontSize: Dimensions.font16),
                      hintText: 'Set Date To',
                      hintStyle: TextStyle(fontSize: Dimensions.font16),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: Dimensions.width10 / 10,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: TextButton(
                  onPressed: controller.filterOrders,
                  child: const Text("Search"),
                ))
              ],
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            Obx(
              () => Expanded(
                child: controller.filteredOrders.isNotEmpty
                    ? ListView.separated(
                        itemCount: controller.filteredOrders.length,
                        itemBuilder: (context, index) {
                          Order order = controller.filteredOrders[index];

                          return Container(
                            padding:
                                EdgeInsets.only(bottom: Dimensions.height10),
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
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: Dimensions.width10 / 10,
                                                color: Colors.grey))),
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
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: Dimensions.height20,
                                      right: Dimensions.width10,
                                      left: Dimensions.width20),
                                  child: SizedBox(
                                    height: Dimensions.height20,
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Sales Person',
                                          style: TextStyle(
                                              fontSize: Dimensions.font16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          '${order.salesAgent}',
                                          style: TextStyle(
                                              fontSize: Dimensions.font16),
                                        ),
                                      ],
                                    ),
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
                        child: Text(
                            "No orders were made within the specified date range"),
                      ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(width: Dimensions.width10 / 10))),
        height: Dimensions.height20 * 4,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width10, vertical: Dimensions.height10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Total Cost',
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Obx(() {
                    return Text(
                      'GHC ${controller.totalSale}',
                      style: TextStyle(
                          fontSize: Dimensions.font16,
                          fontWeight: FontWeight.w600),
                    );
                  })
                ],
              ),
              Column(
                children: [
                  Text(
                    'Total Quatity',
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Obx(() {
                    return Text(
                      ' ${controller.totalSaleQuantity}',
                      style: TextStyle(
                          fontSize: Dimensions.font16,
                          fontWeight: FontWeight.w600),
                    );
                  })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
