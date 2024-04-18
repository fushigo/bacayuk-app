import 'package:get/get.dart';

import '../controllers/book_edit_controller.dart';

class BookEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookEditController>(
      () => BookEditController(),
    );
  }
}
