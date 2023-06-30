import 'package:get/get.dart';
import 'package:inventory_1/app/modules/admin/dashboard/controllers/dashboard_controller.dart';

import '../controllers/first_page_controller.dart';

class FirstPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirstPageController>(
      () => FirstPageController(),
    );
    // Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
