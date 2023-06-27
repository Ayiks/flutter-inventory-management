import 'package:get/get.dart';
import 'package:inventory_1/app/modules/admin/users/controllers/user_profile_controller.dart';
// import 'package:inventory_1/app/modules/sales_person/first_page/controllers/first_page_controller.dart';
import 'package:inventory_1/app/modules/sales_person/shopping/controllers/checkout_controller.dart';

import '../controllers/shopping_controller.dart';

class ShoppingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutController>(
      () => CheckoutController(),
    );
    Get.lazyPut<ShoppingController>(
      () => ShoppingController(),
    );
    Get.lazyPut<UserProfileController>(() => UserProfileController());
    // Get.lazyPut<FirstPageController>(() => FirstPageController());
  }
}
