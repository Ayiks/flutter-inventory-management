import 'package:get/get.dart';

import '../controllers/forgor_password_controller.dart';

class ForgorPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgorPasswordController>(
      () => ForgorPasswordController(),
    );
  }
}
