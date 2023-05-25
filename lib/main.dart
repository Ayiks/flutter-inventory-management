import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/widgets/buttons.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

//put button
  Get.lazyPut(() => SubmitButtonController(), fenix: true);

  runApp(
    GetMaterialApp(
        title: "ED Cold Store",
        initialRoute: AppPages.INITIAL,
        debugShowCheckedModeBanner: false,
        getPages: AppPages.routes,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              titleTextStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
          primarySwatch: Colors.blue,
        )),
  );
}
