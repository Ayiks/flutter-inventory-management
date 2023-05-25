import 'package:get/get.dart';

import '../controllers/create_stores_controller.dart';

class CreateStoresBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateStoresController>(
      () => CreateStoresController(),
    );
  }
}
