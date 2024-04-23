import 'package:get/get.dart';

import '../controllers/book_search_controller.dart';

class BookSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookSearchController>(
      () => BookSearchController(),
    );
  }
}
