import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/basket/basket_model.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Confirmation',
          style: TextStyle(fontSize: Dimensions.font20),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () {
          return ListView.separated(
            itemCount: controller.basket.length,
            itemBuilder: (context, index) {
              String key = controller.basket.keys.elementAt(index);
              BasketItem basketItem = controller.basket[key]!;
              double subTotal = basketItem.product.price * basketItem.quantity;

              return Container(
                height: Dimensions.height20 * 4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: Dimensions.width10 / 10,
                            color: Colors.grey))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${basketItem.product.name} ${basketItem.product.type}',
                              style: TextStyle(
                                  fontSize: Dimensions.font16,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            Text(
                              'GHC $subTotal',
                              style: TextStyle(
                                  fontSize: Dimensions.font16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '${basketItem.quantity}',
                            style: TextStyle(
                                fontSize: Dimensions.font16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: Dimensions.width10,
                                right: Dimensions.width10),
                            height: Dimensions.height10 * 4,
                            width: Dimensions.width20 * 5,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radius15 - 5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () =>
                                      controller.decreaseBasketQuantity(
                                          basketItem.product),
                                  child: Icon(
                                    Icons.remove,
                                    size: Dimensions.iconSize24,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () =>
                                      controller.increaseBasketQuantity(
                                          basketItem.product),
                                  child: Icon(
                                    Icons.add,
                                    size: Dimensions.iconSize24,
                                  ),
                                )
                                // IconButton(
                                //   icon: Icon(
                                //     Icons.remove,
                                //     size: Dimensions.iconSize16,
                                //   ),
                                //   onPressed: () =>
                                //       controller.decreaseBasketQuantity(
                                //           basketItem.product),
                                // ),
                                // IconButton(
                                //   icon: Icon(
                                //     Icons.add,
                                //     size: Dimensions.iconSize16,
                                //   ),
                                //   onPressed: () =>
                                //       controller.increaseBasketQuantity(
                                //           basketItem.product),
                                // ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: ((context, index) {
              return SizedBox(
                height: Dimensions.height10,
              );
            }),
          );
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(width: Dimensions.width10 / 10))),
        height: Dimensions.height20 * 4,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width10, vertical: Dimensions.height10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      'GHC ${controller.getGrandTotal()}',
                      style: TextStyle(
                          fontSize: Dimensions.font16,
                          fontWeight: FontWeight.w600),
                    );
                  })
                ],
              ),
              GestureDetector(
                onTap: () async {
                  controller.confirmOrder();
                },
                child: Container(
                  height: Dimensions.height20 * 2.5,
                  width: Dimensions.width20 * 8,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 13, 71, 118),
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius15 - 5)),
                  child: Center(
                      child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.width10),
                    child: Text(
                      'CONFIRM SALES',
                      style: TextStyle(
                          fontSize: Dimensions.font16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
