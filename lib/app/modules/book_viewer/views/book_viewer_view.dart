import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/widget/viewers/pdf_view.dart';
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
      alignment: Alignment.center,
      width: widthBody,
      height: heightBody,
      child: Column(
        children: [
          SizedBox(
            width: widthBody,
            height: heightBody * 0.9,
            child: Obx(() => controller.loading.value
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )
                : pdfViewer(controller.pdfbase64.value)),
          ),
          Container(
            width: widthBody,
            height: heightBody * 0.1,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.white12,
                spreadRadius: 1,
                blurRadius: 30,
                offset: Offset(0, 3),
              ),
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () {
                        controller.prevButton();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Previous',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: GlobalVariable.fontSignika),
                      )),
                ),
                SizedBox(
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () {
                        controller.nextButton();
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: GlobalVariable.fontSignika),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    )));
  }
}
