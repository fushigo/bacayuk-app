import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/widget/pdf_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/book_viewer_controller.dart';

class BookViewerView extends GetView<BookViewerController> {
  const BookViewerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GlobalOrientation.orientationPotrait();
    final widthBody = MediaQuery.of(context).size.width;
    final heightBody = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return Scaffold(
        body: SafeArea(
          child: Container(
              width: widthBody,
              height: heightBody,
              child: Center(
                child: Obx(() => controller.loading.value
                    ? const CircularProgressIndicator()
                    : pdfViewer(controller.pdfbase64.value)),
              )),
        ));
  }
}
