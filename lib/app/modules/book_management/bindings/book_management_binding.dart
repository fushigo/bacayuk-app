import 'package:get/get.dart';

import '../controllers/book_management_controller.dart';

class BookManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookManagementController>(
      () => BookManagementController(),
    );
  }
}
