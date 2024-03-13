import 'package:bacayuk/app/modules/splash/bindings/splash_binding.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      initialBinding: SplashBinding(),
      title: "Bacayuk",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
