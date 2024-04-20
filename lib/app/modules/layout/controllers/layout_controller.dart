import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LayoutController extends GetxController {
  final count = 0.obs;
  var tabIndex = 0.obs;

  final Rx<PageController> pageController =
      Rx<PageController>(PageController(initialPage: 0));

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

  void increment() => count.value++;

  void changeTabIndex(int index) {
    tabIndex.value = index;
    pageController.value.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }
}
