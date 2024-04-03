import 'package:get/get.dart';

import '../controllers/book_viewer_controller.dart';

class BookViewerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookViewerController>(
      () => BookViewerController(),
    );
  }
}
