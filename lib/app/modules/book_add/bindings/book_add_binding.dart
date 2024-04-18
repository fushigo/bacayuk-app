import 'package:get/get.dart';

import '../controllers/book_add_controller.dart';

class BookAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookAddController>(
      () => BookAddController(),
    );
  }
}
