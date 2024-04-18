import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/modules/book/controllers/book_controller.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:bacayuk/app/widget/viewers/widget_image_memory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final widthBody = MediaQuery.of(context).size.width;
    final heightBody = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
          child: SizedBox(
              width: widthBody,
              height: heightBody,
              child: Obx(() => controller.loading.value == false &&
                      controller.dataGenreBuku.isNotEmpty
                  ? Stack(
                      children: [
                        SizedBox(
                          width: widthBody,
                          height: heightBody * 0.15,
                          child: Column(
                            children: [
                              TabBar(
                                  tabAlignment: TabAlignment.center,
                                  onTap: (index) {
                                    controller.onTabBook(index);
                                  },
                                  indicator: const BoxDecoration(),
                                  dividerHeight: 0,
                                  controller:
                                      controller.tabKategoriController.value,
                                  isScrollable: true,
                                  tabs: controller.dataKategoriBuku
                                      .map((kategori) => Tab(
                                            text: kategori.namaKategori,
                                          ))
                                      .toList()),
                              TabBar(
                                  controller:
                                      controller.tabGenreController.value,
                                  isScrollable: true,
                                  onTap: (index) {
                                    controller.onTabGenre(index);
                                  },
                                  tabs: controller.dataGenreBuku
                                      .map((genre) => Tab(
                                            text: genre.nama,
                                          ))
                                      .toList())
                            ],
                          ),
                        ),
                        Positioned(
                          top: heightBody * 0.12,
                          child: SizedBox(
                              width: widthBody,
                              height: heightBody,
                              child: Obx(
                                () => RefreshIndicator(
                                  onRefresh: () async {
                                    controller.syncBookData();
                                    controller.update();
                                  },
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: controller.dataCount.value,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () => Get.toNamed(
                                            Routes.BOOK_DETAIL,
                                            parameters: {
                                              "id": controller
                                                  .dataBukuKategori[index]
                                                  .bukuID
                                                  .toString()
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
                                                      image: base64Image(
                                                          controller
                                                              .dataBukuKategori[
                                                                  index]
                                                              .cover!))),
                                              Container(
                                                  width: widthBody * 0.68,
                                                  // color: Colors.red,
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        controller
                                                            .dataBukuKategori[
                                                                index]
                                                            .judul
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                            fontSize:
                                                                GlobalVariable
                                                                    .textlg,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                GlobalVariable
                                                                    .fontPoppins),
                                                      ),
                                                      Text(
                                                        controller
                                                            .dataBukuKategori[
                                                                index]
                                                            .sinopsis
                                                            .toString(),
                                                        maxLines: 4,
                                                        style: TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            fontSize:
                                                                GlobalVariable
                                                                    .textbase,
                                                            fontFamily:
                                                                GlobalVariable
                                                                    .fontPoppins),
                                                      )
                                                    ],
                                                  ))
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )),
                        )
                      ],
                    )
                  : const Center(child: CircularProgressIndicator()))),
        ),
        floatingActionButton: Obx(
          () => controller.role.value == "admin" ||
                  controller.role.value == "petugas"
              ? FloatingActionButton.small(
                  child: const Icon(Icons.settings),
                  onPressed: () => Get.toNamed(Routes.BOOK_MANAGEMENT),
                )
              : Container(),
        ));
  }
}
