import 'dart:developer';

import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void checkSession() {
    String token = StorageProvider.read(StorageKey.token);
    String status = StorageProvider.read(StorageKey.status);
    log(token);
    log("Status: $status");
    if (status == "logged") {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.WELCOME);
    }
  }
}
