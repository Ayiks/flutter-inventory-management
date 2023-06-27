import 'package:get/get.dart';
// import 'package:inventory_1/app/modules/sales_person/first_page/controllers/first_page_controller.dart';

import '../controllers/checkout_controller.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutController>(
      () => CheckoutController(),
    );

    // Get.lazyPut<FirstPageController>(() => FirstPageController());
  }
}
