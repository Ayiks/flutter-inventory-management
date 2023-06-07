import 'package:get/get.dart';
import 'package:inventory_1/app/modules/admin/users/controllers/edit_user_controller.dart';

class EditUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditUserController>(
      () => EditUserController(),
    );
  }
}
