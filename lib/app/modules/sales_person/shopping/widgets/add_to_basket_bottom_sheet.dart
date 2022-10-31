import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: unused_import
import 'package:inventory_1/app/data/models/basket/basket_model.dart';
import 'package:inventory_1/app/data/models/product/product.dart';
import 'package:inventory_1/app/modules/sales_person/shopping/controllers/checkout_controller.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

class AddToBasketBottomSheet extends GetView<CheckoutController> {
  final Product product;

  const AddToBasketBottomSheet({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var quantity = controller.basket[product.id]?.quantity ?? 0;
        var subTotal = (quantity * product.price);
        print(subTotal);
        return Container(
          color: Colors.white,
          height: Dimensions.height30 * 8,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width20,
              vertical: Dimensions.height20,
            ),
            child: Column(
              children: [
                Container(
                  height: Dimensions.height20 * 4,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: Dimensions.width10 / 10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${product.name} ${product.type ?? ''}',
                        style: TextStyle(
                            fontSize: Dimensions.font16,
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          Text(
                            controller
                                .getBasketItemQuantity(product)
                                .toString(),
                            style: TextStyle(
                                fontSize: Dimensions.font16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radius15 - 5)),
                            child: Row(
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.remove,
                                      size: Dimensions.iconSize24,
                                    ),
                                    onPressed: () => controller
                                        .decreaseBasketQuantity(product)),
                                IconButton(
                                    icon: Icon(
                                      Icons.add,
                                      size: Dimensions.iconSize24,
                                    ),
                                    onPressed: () => controller
                                        .increaseBasketQuantity(product)),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Container(
                  height: Dimensions.height20 * 4,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: Dimensions.width10 / 10))),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: Dimensions.height20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(fontSize: Dimensions.font16),
                            ),
                            SizedBox(
                              width: Dimensions.width10,
                            ),
                            Text(
                              'GHC $subTotal',
                              style: TextStyle(
                                  fontSize: Dimensions.font16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                            height: Dimensions.height20 * 2,
                            width: Dimensions.width30 * 5,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radius15 - 5)),
                            child: Center(
                              child: Text(
                                'ADD TO ORDER',
                                style: TextStyle(
                                  fontSize: Dimensions.font16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
