import 'package:get/get.dart';
import 'package:inventory_1/app/modules/admin/dashboard/controllers/dashboard_controller.dart';
import 'package:inventory_1/app/modules/admin/stores/controllers/edit_store_controller.dart';

import '../controllers/stores_controller.dart';

class StoresBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditStoreController>(() => EditStoreController(), fenix: true);
    Get.lazyPut<DashboardController>(() => DashboardController(), fenix: true);

    Get.lazyPut<StoresController>(
      () => StoresController(),
    );
  }
}
