import 'dart:developer';

import 'package:bacayuk/app/data/provider/jwt_convert.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LayoutController extends GetxController {
  final count = 0.obs;
  var tabIndex = 0.obs;

  final token = StorageProvider.read(StorageKey.token);
  final role = "".obs;
  final Rx<PageController> pageController =
      Rx<PageController>(PageController(initialPage: 0));

  @override
  void onInit() async {
    super.onInit();
    await getRole();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void changeTabIndex(int index) {
    tabIndex.value = index;
    pageController.value.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  Future<void> getRole() async {
    try {
      final jwtDecoded = await JwtConverter.jwtDecode(token);
      log("Data user: ${jwtDecoded.toString()}");
      role.value = jwtDecoded["role"];
    } catch (e) {
      log(e.toString());
    }
  }
}
