import 'package:bacayuk/app/modules/book/controllers/book_controller.dart';
import 'package:bacayuk/app/modules/collection/controllers/collection_controller.dart';
import 'package:bacayuk/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:bacayuk/app/modules/history/controllers/history_controller.dart';
import 'package:bacayuk/app/modules/home/controllers/home_controller.dart';
import 'package:bacayuk/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../controllers/layout_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayoutController>(
      () => LayoutController(),
    );
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<BookController>(() => BookController());
    Get.lazyPut<CollectionController>(() => CollectionController());
    Get.lazyPut<HistoryController>(() => HistoryController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
