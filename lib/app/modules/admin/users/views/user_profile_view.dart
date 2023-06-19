import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/modules/admin/users/controllers/user_profile_controller.dart';
import 'package:inventory_1/app/routes/app_pages.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

class UserProfileView extends GetView<UserProfileController> {
  const UserProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Accounts',
          style: TextStyle(fontSize: Dimensions.font20),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Dimensions.height10, horizontal: Dimensions.width10),
          child: Column(
            children: [
              // Container(
              //   color: Colors.white,
              //   height: Dimensions.height20 * 10,
              //   width: double.infinity,
              //   child: Stack(
              //     children: [
              //       Center(
              //         child: CircleAvatar(
              //           backgroundImage: AssetImage('assets/Profile_avatar.png'),
              //           radius: Dimensions.radius20 * 4,
              //         ),
              //       ),
              //       Positioned(
              //           bottom: Dimensions.height20,
              //           left: Dimensions.width20 * 5,
              //           right: Dimensions.width20,
              //           child: GestureDetector(
              //             onTap: () {},
              //             child: Icon(
              //               Icons.photo_camera,
              //               size: Dimensions.radius30 + 5,
              //             ),
              //           ))
              //     ],
              //   ),
              // ),
              SizedBox(
                height: Dimensions.height45,
              ),
              Obx(
                () => Container(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.person),
                        title: Row(
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                  fontSize: Dimensions.font16,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: Dimensions.width20,
                            ),
                            Text(
                              controller.userProfile().name,
                              style: TextStyle(
                                  fontSize: Dimensions.font16,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.email),
                        title: Row(
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: Dimensions.font16,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: Dimensions.width20,
                            ),
                            Text(
                              controller.userProfile().email, // TODO:
                              style: TextStyle(
                                  fontSize: Dimensions.font16,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.numbers),
                        title: Row(
                          children: [
                            Text(
                              'Phone Number',
                              style: TextStyle(
                                  fontSize: Dimensions.font16,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: Dimensions.width20,
                            ),
                            Text(
                              controller.userProfile().phoneNumber, // TODO:
                              style: TextStyle(
                                  fontSize: Dimensions.font16,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.work),
                        title: Row(
                          children: [
                            Text(
                              'Company',
                              style: TextStyle(
                                  fontSize: Dimensions.font16,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: Dimensions.width20,
                            ),
                            // Text(
                            //   controller.userProfile().company[0],
                            //   style: TextStyle(
                            //       fontSize: Dimensions.font16,
                            //       fontWeight: FontWeight.w400),
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height20 * 2,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.ALL_USERS);
                },
                child: Container(
                  height: Dimensions.height20 * 4,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width10,
                        vertical: Dimensions.height10),
                    child: Row(children: [
                      Icon(
                        Icons.people,
                        size: Dimensions.iconSize24,
                        color: const Color.fromARGB(255, 4, 36, 61),
                      ),
                      SizedBox(
                        width: Dimensions.height10,
                      ),
                      Text(
                        'Manage Employees',
                        style: TextStyle(
                            fontSize: Dimensions.font16,
                            fontWeight: FontWeight.w400),
                      ),
                    ]),
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              GestureDetector(
                onTap: controller.handleSignOut,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius15 - 5)),
                  width: Dimensions.width20 * 5,
                  height: Dimensions.height20 * 2,
                  child: Center(
                    child: Text(
                      'Logout',
                      style: TextStyle(
                          fontSize: Dimensions.font20,
                          fontWeight: FontWeight.w600,
                          color: Colors.red),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
