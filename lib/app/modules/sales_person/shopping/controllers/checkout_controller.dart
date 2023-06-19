import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/basket/basket_model.dart';
import 'package:inventory_1/app/data/models/order/order.dart';
import 'package:inventory_1/app/data/models/product/product.dart';
import 'package:inventory_1/app/modules/sales_person/first_page/controllers/first_page_controller.dart';
import 'package:inventory_1/app/utils/helpers.dart';

class CheckoutController extends GetxController {
  RxMap<String, BasketItem> basket = RxMap({});
  final FirstPageController _firstPageController =
      Get.find<FirstPageController>();

  String storeID = "";
  String salesName = "";
  @override
  void onInit() {
    super.onInit();
    storeID = _firstPageController.userCompanyId;
    salesName = _firstPageController.userName;
  }

  void confirmOrder() {
    // STEP 1: save the order to firebase.
    saveOrder();

    // STEP 2: adjust the product collection to reduce the quanitySold
  }

  int get itemsInBasketCount => basket.keys.length;

  double getProductUnitValue(Product product) {
    return product.unit == "kilos" ? 0.5 : 1;
  }

  double getBasketItemQuantity(Product product) {
    return basket[product.id]?.quantity ?? 0;
  }

  double getBasketItemQuantitys(Product product) {
    return basket[product.id]?.product.price ?? 0;
  }

  double getSubTotal(Product product) {
    return (basket[product.id]?.product.price ?? 0) *
        getProductUnitValue(product);
  }

  double getGrandQuantity() {
    double quantity = 0.0;
    basket.forEach(
      (_, basketItem) {
        quantity += basketItem.quantity;
      },
    );
    return quantity;
  }

  double getGrandTotal() {
    double total = 0.0;
    basket.forEach(
      (_, basketItem) {
        total += basketItem.quantity * basketItem.product.price;
      },
    );
    return total;
  }

  decreaseBasketQuantity(Product product) {
    double basketQuantity = getBasketItemQuantity(product);
    double productUnitValue = getProductUnitValue(product);

    if (basketQuantity > 1) {
      basketQuantity -= productUnitValue;
      basket[product.id] =
          BasketItem(product: product, quantity: basketQuantity);
    } else {
      basket.remove(product.id);
    }
  }

  increaseBasketQuantity(Product product) {
    double basketQuantity = getBasketItemQuantity(product);
    double productUnitValue = getProductUnitValue(product);

    if (basketQuantity < (product.quantity)) {
      basketQuantity += productUnitValue;
      basket[product.id] =
          BasketItem(product: product, quantity: basketQuantity);
    } else {
      showSnackBar(
          message: "There are only ${product.quantity} pcs of products");
    }
  }

  void saveOrder() {
    if (basket.isEmpty) {
      Get.snackbar(
        "Empty Cart",
        "Can't proceed with empty cart",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      OrderDTO orderDTO = OrderDTO(
        orderDetails: basket,
        orderQuantity: getGrandQuantity(),
        total: getGrandTotal(),
      );
      FirebaseFirestore.instance.collection('orders').add({
        ...orderDTO.toJson(),
        "salesAgent": salesName,
        "storeId": storeID,
      });

      adjustProductInventory();

      completeCheckout();
    }
  }

  void adjustProductInventory() {
    basket.forEach((productId, basketItem) async {
      await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .update({
        "quantity": (basketItem.product.quantity - basketItem.quantity)
      });
    });
  }

  void completeCheckout() {
    basket.clear();
    Get.back();
    Get.snackbar("success", "Sales confirmed succesfully");
  }
}
