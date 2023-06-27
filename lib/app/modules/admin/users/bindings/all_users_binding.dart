import 'package:get/get.dart';
import 'package:inventory_1/app/modules/admin/dashboard/controllers/dashboard_controller.dart';
import 'package:inventory_1/app/modules/admin/users/controllers/edit_user_controller.dart';

import '../controllers/all_users_controller.dart';

class AllUsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditUserController>(() => EditUserController(), fenix: true);

    Get.lazyPut<AllUsersController>(
      () => AllUsersController(),
    );
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
