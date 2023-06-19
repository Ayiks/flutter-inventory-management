import 'package:get/get.dart';
import 'package:inventory_1/app/modules/admin/dashboard/controllers/dashboard_controller.dart';

import '../controllers/orders_controller.dart';

class OrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdersController>(
      () => OrdersController(),
    );
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
