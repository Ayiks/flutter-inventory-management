import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/user_profile/user_profile.dart';
import 'package:inventory_1/app/modules/admin/users/widgets/confirm_user_delete_alert.dart';
import 'package:inventory_1/app/routes/app_pages.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

import '../controllers/all_users_controller.dart';

class AllUsersView extends GetView<AllUsersController> {
  AllUsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Users',
          style: TextStyle(fontSize: Dimensions.font20),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.separated(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width10, vertical: Dimensions.height20),
          itemCount: controller.allUsers.length,
          itemBuilder: ((context, index) {
            UserProfile user = controller.allUsers[index];
            return Container(
              height: Dimensions.height20 * 3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: Dimensions.width10 / 10,
                          color: Colors.black26))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      user.name,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: Dimensions.font16,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      user.phoneNumber,
                      style: TextStyle(fontSize: Dimensions.font16),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: (() {
                              controller.goToEditUser(userProfile: user);
                            }),
                            icon: Icon(
                              Icons.edit,
                              size: Dimensions.iconSize24,
                              color: Color.fromARGB(255, 4, 57, 100),
                            )),
                        IconButton(
                            onPressed: (() {
                              Get.dialog(
                                  ConfirmUserDeleteDialog(userProfile: user));
                            }),
                            icon: Icon(
                              Icons.delete_rounded,
                              size: Dimensions.iconSize24,
                              color: Colors.red,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
          separatorBuilder: ((context, index) {
            return SizedBox(height: Dimensions.height10);
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 8, 51, 87),
        onPressed: () {
          Get.toNamed(Routes.ADD_USER);
        },
        child: Icon(
          Icons.add,
          size: Dimensions.iconSize24,
        ),
      ),
    );
  }
}
