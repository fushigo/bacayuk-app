import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:bacayuk/app/widget/viewers/widget_image_memory.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/book_search_controller.dart';

class BookSearchView extends GetView<BookSearchController> {
  const BookSearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final widthBody = MediaQuery.of(context).size.width;
    final heightBody = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: widthBody,
        height: heightBody,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              width: widthBody,
              height: heightBody * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: widthBody * 0.7,
                    alignment: Alignment.center,
                    child: TextFormField(
                      onChanged: (value) {
                        controller.searchBook();
                      },
                      controller: controller.searchController,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: heightBody * 0.03),
                          hintText: "Judul atau sinopsis",
                          hintStyle: TextStyle(
                              fontFamily: GlobalVariable.fontPoppins,
                              color: Colors.black26),
                          filled: true,
                          fillColor: Colors.black12,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(10.0), // Radius border
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(Icons.search)),
                    ),
                  ),
                  InkWell(
                    child: Text(
                      "Batalkan",
                      style: TextStyle(
                          fontFamily: GlobalVariable.fontPoppins,
                          fontSize: GlobalVariable.textlg,
                          color: Colors.black38),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: heightBody * 0.01,
            ),
            SizedBox(
                width: widthBody,
                height: heightBody * 0.85,
                child: Obx(
                  () => controller.loading.value == false
                      ? ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: controller.dataBook.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () =>
                                  Get.toNamed(Routes.BOOK_DETAIL, parameters: {
                                "id":
                                    controller.dataBook[index].bukuID.toString()
                              }),
                              child: Container(
                                width: widthBody,
                                height: 150,
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                // color: Colors.blue,
                                child: Row(
                                  children: [
                                    SizedBox(
                                        child: Image(
                                            width: 105,
                                            height: 200,
                                            fit: BoxFit.fill,
                                            image: base64Image(controller
                                                .dataBook[index].cover!))),
                                    Container(
                                        width: widthBody * 0.6,
                                        // color: Colors.red,
                                        padding: const EdgeInsets.all(5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.dataBook[index].judul
                                                  .toString(),
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize:
                                                      GlobalVariable.textlg,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: GlobalVariable
                                                      .fontPoppins),
                                            ),
                                            Text(
                                              controller
                                                  .dataBook[index].sinopsis
                                                  .toString(),
                                              maxLines: 4,
                                              style: TextStyle(
                                                  overflow: TextOverflow.clip,
                                                  fontSize:
                                                      GlobalVariable.textbase,
                                                  fontFamily: GlobalVariable
                                                      .fontPoppins),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                ))
          ],
        ),
      ),
    ));
  }
}
