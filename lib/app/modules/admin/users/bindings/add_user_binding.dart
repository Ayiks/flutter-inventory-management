import 'package:get/get.dart';
import 'package:inventory_1/app/modules/admin/dashboard/controllers/dashboard_controller.dart';

import '../controllers/add_user_controller.dart';

class AddUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddUserController>(
      () => AddUserController(),
    );
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
