import 'package:get/get.dart';
import 'package:inventory_1/app/modules/admin/stores/controllers/edit_store_controller.dart';

import '../controllers/stores_controller.dart';

class StoresBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditStoreController>(() => EditStoreController());

    Get.lazyPut<StoresController>(
      () => StoresController(),
    );
    // Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
