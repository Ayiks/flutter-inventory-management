import 'package:get/get.dart';
import 'package:inventory_1/app/modules/admin/dashboard/controllers/dashboard_controller.dart';

import '../controllers/user_profile_controller.dart';

class UserProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProfileController>(
      () => UserProfileController(),
    );

    Get.lazyPut<DashboardController>(() => DashboardController(), fenix: true);
  }
}
