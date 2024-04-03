import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:bacayuk/app/widget/viewers/widget_image_memory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetListBookTerbaru extends GetView {
  const WidgetListBookTerbaru(this.controller, this.widthBody, this.heightBody, {super.key});

  @override
  final controller;
  final double widthBody;
  final double heightBody;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:
        controller.dataBookTerbaru.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () => Get.toNamed(Routes.BOOK_DETAIL, parameters: {
                "id": controller.dataBookTerbaru[index].bukuID.toString(),
              }),
              child: Container(
                width: widthBody * 0.35,
                margin: const EdgeInsets.symmetric(
                    horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(10)),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius:
                        BorderRadius.circular(10),
                        child: Image(
                          image: base64Image(controller
                              .dataBookTerbaru[index]
                              .cover!),
                          height: heightBody * 0.25,
                          fit: BoxFit.fill,
                        )),
                    SizedBox(
                      height: heightBody * 0.01,
                    ),
                    Text(
                      controller
                          .dataBookTerbaru[index].judul
                          .toString(),
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      style: TextStyle(
                          overflow:
                          TextOverflow.ellipsis,
                          fontSize:
                          GlobalVariable.textlg,
                          fontFamily: GlobalVariable
                              .fontSignika),
                    )
                  ],
                ),
              ));
        });
  }
}
