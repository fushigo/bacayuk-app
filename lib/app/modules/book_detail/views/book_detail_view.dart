import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/widget/viewers/primary_button.dart';
import 'package:bacayuk/app/widget/viewers/widget_image_memory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/book_detail_controller.dart';

class BookDetailView extends GetView<BookDetailController> {
  const BookDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthBody = MediaQuery.of(context).size.width;
    final heightBody = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => Get.back(),
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      body: Container(
        width: widthBody,
        height: heightBody,
        alignment: Alignment.center,
        child: SingleChildScrollView(
            child: Obx(
          () => Container(
            alignment: Alignment.center,
            width: widthBody,
            child: controller.loading.value
                ? const Center(child: CircularProgressIndicator())
                : Stack(
                    children: [
                      Container(
                        width: widthBody,
                        height: heightBody,
                        alignment: Alignment.topCenter,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                                width: widthBody,
                                height: heightBody * 0.4,
                                color: Colors.blue,
                                child: Obx(
                                  () => FittedBox(
                                      fit: BoxFit.fill,
                                      child: controller.cover.value.isEmpty
                                          ? Image.asset(
                                              "asset/image/banner_2.png")
                                          : Image(
                                              image: base64Image(
                                                  controller.cover.value))),
                                )),
                            Container(
                                width: widthBody,
                                padding: EdgeInsets.symmetric(
                                    horizontal: widthBody * 0.05,
                                    vertical: heightBody * 0.015),
                                height: heightBody * 0.1,
                                color: Colors.black26,
                                child: Obx(
                                  () => Text(
                                    controller.judulBuku.value.isNotEmpty
                                        ? controller.judulBuku.value
                                        : "",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: GlobalVariable.fontSignika,
                                      fontSize: GlobalVariable.heading_3,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Positioned(
                        top: heightBody * 0.36,
                        child: Container(
                          width: widthBody,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  width: widthBody,
                                  child: Obx(
                                    () => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Flexible(
                                          fit: FlexFit.tight,
                                          child: Column(
                                            children: [
                                              Text(
                                                controller.jmlhPeminjam.value
                                                        .isNotEmpty
                                                    ? controller
                                                        .jmlhPeminjam.value
                                                    : "0",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      GlobalVariable.heading_2,
                                                  fontFamily:
                                                      GlobalVariable.fontPoppins,
                                                ),
                                              ),
                                              Text(
                                                "Dipinjam",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: GlobalVariable.textmd,
                                                  fontFamily:
                                                      GlobalVariable.fontSignika,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          fit: FlexFit.tight,
                                          child: Column(
                                            children: [
                                              Text(
                                                controller.jmlahDibaca.value
                                                        .isNotEmpty
                                                    ? controller.jmlahDibaca.value
                                                    : "0",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      GlobalVariable.heading_2,
                                                  fontFamily:
                                                      GlobalVariable.fontPoppins,
                                                ),
                                              ),
                                              Text(
                                                "Dibaca",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: GlobalVariable.textmd,
                                                  fontFamily:
                                                      GlobalVariable.fontSignika,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          fit: FlexFit.tight,
                                          child: Column(
                                            children: [
                                              Text(
                                                controller.jmlhKoleksi.value
                                                        .isNotEmpty
                                                    ? controller.jmlhKoleksi.value
                                                    : "0",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      GlobalVariable.heading_2,
                                                  fontFamily:
                                                      GlobalVariable.fontPoppins,
                                                ),
                                              ),
                                              Text(
                                                "Dikoleksi",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: GlobalVariable.textmd,
                                                  fontFamily:
                                                      GlobalVariable.fontSignika,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              Container(
                                width: widthBody,
                                height: heightBody * 0.01,
                                color: Colors.grey.shade300,
                              ),
                              Container(
                                width: widthBody,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                child: TabBar(
                                  controller: controller.tabController,
                                  tabs: [
                                    Tab(
                                      child: Text(
                                        "Detail",
                                        style: TextStyle(
                                            fontFamily:
                                                GlobalVariable.fontSignika,
                                            fontSize: GlobalVariable.textlg),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        "Episode",
                                        style: TextStyle(
                                            fontFamily:
                                                GlobalVariable.fontSignika,
                                            fontSize: GlobalVariable.textlg),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: widthBody,
                                height: heightBody,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: TabBarView(
                                  controller: controller.tabController,
                                  children: [
                                    Container(
                                      width: widthBody,
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Obx(
                                            () => controller
                                                    .dataGenreBookId.isEmpty
                                                ? const SizedBox(
                                                    width: 1,
                                                  )
                                                : Wrap(
                                                    direction: Axis.horizontal,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    spacing: 10,
                                                    runSpacing: 10,
                                                    children: controller
                                                        .dataGenreBookId
                                                        .map(
                                                          (dataGenre) =>
                                                              Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.3),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                            ),
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        20,
                                                                    vertical: 5),
                                                            child: Text(
                                                              dataGenre
                                                                  .genre!.nama!,
                                                              style: TextStyle(
                                                                  color:
                                                                      Colors.grey,
                                                                  fontFamily:
                                                                      GlobalVariable
                                                                          .fontSignika,
                                                                  fontSize:
                                                                      GlobalVariable
                                                                          .textmd,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        )
                                                        .toList()),
                                          ),
                                          SizedBox(
                                            height: heightBody * 0.03,
                                          ),
                                          SizedBox(
                                              width: widthBody,
                                              height: heightBody * 0.04,
                                              child: Obx(
                                                () => Text(
                                                  controller.tahunTerbit.value
                                                          .isNotEmpty
                                                      ? "Tahun: ${controller.tahunTerbit.value}"
                                                      : "",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        GlobalVariable.textbase,
                                                    fontFamily: GlobalVariable
                                                        .fontPoppins,
                                                  ),
                                                ),
                                              )),
                                          SizedBox(
                                              width: widthBody,
                                              height: heightBody * 0.1,
                                              child: Obx(
                                                () => Text(
                                                  controller.sinopsis.value
                                                          .isNotEmpty
                                                      ? controller.sinopsis.value
                                                      : "",
                                                  style: TextStyle(
                                                    fontSize:
                                                        GlobalVariable.textbase,
                                                    fontFamily: GlobalVariable
                                                        .fontPoppins,
                                                  ),
                                                ),
                                              )),
                                          SizedBox(
                                            height: heightBody * 0.03,
                                          ),
                                          Center(
                                            child: ButtonWidget(
                                                text: "Mulai Baca",
                                                onPressed: () {
                                                  controller.validasiPeminjaman();
                                                },
                                                horizontal: widthBody * 0.3,
                                                vertical: heightBody * 0.015),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      color: Colors.red,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        )),
      ),
    );
  }
}
