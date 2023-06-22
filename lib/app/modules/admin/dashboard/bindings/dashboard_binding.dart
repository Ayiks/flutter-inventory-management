import 'package:get/get.dart';
import 'package:inventory_1/app/modules/admin/stores/controllers/stores_controller.dart';
import 'package:inventory_1/app/modules/sales_person/first_page/controllers/first_page_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );

    Get.lazyPut<StoresController>(() => StoresController());
    // Get.lazyPut<FirstPageController>(() => FirstPageController());
  }
}
