import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:bacayuk/app/widget/viewers/primary_button.dart';
import 'package:bacayuk/app/widget/viewers/widget_image_memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
                : Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: widthBody,
                            height: heightBody * 0.9,
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
                                          fontFamily:
                                              GlobalVariable.fontSignika,
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
                                                    controller.jmlhPeminjam
                                                            .value.isNotEmpty
                                                        ? controller
                                                            .jmlhPeminjam.value
                                                        : "0",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: GlobalVariable
                                                          .heading_2,
                                                      fontFamily: GlobalVariable
                                                          .fontPoppins,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Dipinjam",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize:
                                                          GlobalVariable.textmd,
                                                      fontFamily: GlobalVariable
                                                          .fontSignika,
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
                                                        ? controller
                                                            .jmlahDibaca.value
                                                        : "0",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: GlobalVariable
                                                          .heading_2,
                                                      fontFamily: GlobalVariable
                                                          .fontPoppins,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Dibaca",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize:
                                                          GlobalVariable.textmd,
                                                      fontFamily: GlobalVariable
                                                          .fontSignika,
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
                                                        ? controller
                                                            .jmlhKoleksi.value
                                                        : "0",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: GlobalVariable
                                                          .heading_2,
                                                      fontFamily: GlobalVariable
                                                          .fontPoppins,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Dikoleksi",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize:
                                                          GlobalVariable.textmd,
                                                      fontFamily: GlobalVariable
                                                          .fontSignika,
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
                                      unselectedLabelColor: Colors.black26,
                                      tabs: [
                                        Tab(
                                          child: Text(
                                            "Detail",
                                            style: TextStyle(
                                                fontFamily:
                                                    GlobalVariable.fontSignika,
                                                fontSize:
                                                    GlobalVariable.textlg),
                                          ),
                                        ),
                                        Tab(
                                          child: Text(
                                            "Episode",
                                            style: TextStyle(
                                                fontFamily:
                                                    GlobalVariable.fontSignika,
                                                fontSize:
                                                    GlobalVariable.textlg),
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
                                                () =>
                                                    controller.dataGenreBookId
                                                            .isEmpty
                                                        ? const SizedBox(
                                                            width: 1,
                                                          )
                                                        : Wrap(
                                                            direction:
                                                                Axis.horizontal,
                                                            alignment:
                                                                WrapAlignment
                                                                    .start,
                                                            spacing: 10,
                                                            runSpacing: 10,
                                                            children: controller
                                                                .dataGenreBookId
                                                                .map(
                                                                  (dataGenre) =>
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .grey
                                                                          .withOpacity(
                                                                              0.3),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    padding: const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            20,
                                                                        vertical:
                                                                            5),
                                                                    child: Text(
                                                                      dataGenre
                                                                          .genre!
                                                                          .nama!,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey,
                                                                          fontFamily: GlobalVariable
                                                                              .fontSignika,
                                                                          fontSize: GlobalVariable
                                                                              .textmd,
                                                                          fontWeight:
                                                                              FontWeight.bold),
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
                                                      controller.tahunTerbit
                                                              .value.isNotEmpty
                                                          ? "Tahun: ${controller.tahunTerbit.value}"
                                                          : "",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: GlobalVariable
                                                            .textbase,
                                                        fontFamily:
                                                            GlobalVariable
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
                                                          ? controller
                                                              .sinopsis.value
                                                          : "",
                                                      style: TextStyle(
                                                        fontSize: GlobalVariable
                                                            .textbase,
                                                        fontFamily:
                                                            GlobalVariable
                                                                .fontPoppins,
                                                      ),
                                                    ),
                                                  )),
                                              SizedBox(
                                                height: heightBody * 0.03,
                                              ),
                                              Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ButtonWidget(
                                                        text: "Mulai Baca",
                                                        onPressed: () {
                                                          controller
                                                              .validasiPeminjaman();
                                                        },
                                                        horizontal:
                                                            widthBody * 0.2,
                                                        vertical:
                                                            heightBody * 0.015),
                                                    SizedBox(
                                                      width: widthBody * 0.05,
                                                    ),
                                                    IconButton(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        color: Colors.white,
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    Colors.blue
                                                                        .shade900),
                                                        onPressed: () {
                                                          controller
                                                              .addKoleksi();
                                                        },
                                                        icon: const Icon(
                                                            Icons.bookmark_add))
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: widthBody,
                                          child: ListView.separated(
                                              scrollDirection: Axis.vertical,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    controller.fileId.value =
                                                        controller
                                                            .dataFileBookId[
                                                                index]
                                                            .fileID!;
                                                    controller
                                                        .validasiPeminjaman();
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10),
                                                    width: widthBody,
                                                    color: Colors.black12,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    height: 50,
                                                    child: Text(
                                                      controller
                                                          .dataFileBookId[index]
                                                          .nama!,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              GlobalVariable
                                                                  .fontPoppins,
                                                          fontSize:
                                                              GlobalVariable
                                                                  .textlg,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return const Divider();
                                              },
                                              itemCount: controller
                                                  .dataFileBookId.length),
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
                      Container(
                          width: widthBody,
                          height: heightBody * 0.6,
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              SizedBox(
                                  width: widthBody,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Ulasan Buku",
                                        style: TextStyle(
                                            fontFamily:
                                                GlobalVariable.fontPoppins,
                                            fontSize: GlobalVariable.heading_3),
                                      ),
                                      GestureDetector(
                                        onTap: () => Get.toNamed(Routes.ULASAN,
                                            parameters: {
                                              "bukuid":
                                                  controller.bookId.toString(),
                                              "judul":
                                                  controller.judulBuku.value
                                            }),
                                        child: Text(
                                            "Total ${controller.dataUlasan.length} komentar >",
                                            style: TextStyle(
                                                color: Colors.black26,
                                                fontFamily:
                                                    GlobalVariable.fontPoppins,
                                                fontSize:
                                                    GlobalVariable.textbase)),
                                      )
                                    ],
                                  )),
                              SizedBox(
                                  width: widthBody,
                                  height: heightBody * 0.5,
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: controller.dataUlasan.length < 5
                                        ? controller.dataUlasan.length
                                        : 5,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        width: widthBody,
                                        margin: const EdgeInsets.all(5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: widthBody,
                                              height: 70,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: controller
                                                                .dataUlasan[
                                                                    index]
                                                                .user!
                                                                .profile ==
                                                            null
                                                        ? const ClipOval(
                                                            child: CircleAvatar(
                                                              child: Icon(
                                                                  Icons.person),
                                                            ),
                                                          )
                                                        : ClipOval(
                                                            child: Image(
                                                                image: base64Image(controller
                                                                    .dataUlasan[
                                                                        index]
                                                                    .user!
                                                                    .profile!
                                                                    .gambar
                                                                    .toString())),
                                                          ),
                                                  ),
                                                  SizedBox(
                                                    width: widthBody * 0.03,
                                                  ),
                                                  SizedBox(
                                                    child: Text(
                                                      controller
                                                          .dataUlasan[index]
                                                          .user!
                                                          .username!,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              GlobalVariable
                                                                  .fontSignika,
                                                          fontSize:
                                                              GlobalVariable
                                                                  .heading_3,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: widthBody * 0.5,
                                              height: heightBody * 0.02,
                                              child: RatingBarIndicator(
                                                direction: Axis.horizontal,
                                                itemPadding:
                                                    const EdgeInsets.all(0),
                                                itemSize: 20,
                                                rating: controller
                                                    .dataUlasan[index].rating!
                                                    .toDouble(),
                                                itemBuilder: (context, index) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.blue.shade900,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: heightBody * 0.01,
                                            ),
                                            SizedBox(
                                              width: widthBody,
                                              child: Text(
                                                controller
                                                    .dataUlasan[index].ulasan!,
                                                maxLines: 10,
                                                style: TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontFamily: GlobalVariable
                                                        .fontPoppins,
                                                    fontSize:
                                                        GlobalVariable.textmd),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                  // child: ListView.separated(
                                  //     padding: const EdgeInsets.all(0),
                                  //     scrollDirection: Axis.vertical,
                                  //     itemBuilder: (context, index) {
                                  //       return ListTile(
                                  //         leading: controller.dataUlasan[index]
                                  //                     .user!.profile !=
                                  //                 null
                                  //             ? CircleAvatar(
                                  //                 child: Image(
                                  //                     image: base64Image(
                                  //                         controller
                                  //                             .dataUlasan[index]
                                  //                             .user!
                                  //                             .profile!
                                  //                             .gambar!)),
                                  //               )
                                  //             : const CircleAvatar(
                                  //                 child: Icon(Icons.person),
                                  //               ),
                                  //         title: Text(
                                  //           controller.dataUlasan[index].user!
                                  //               .username!,
                                  //           style: TextStyle(
                                  //               fontFamily:
                                  //                   GlobalVariable.fontSignika,
                                  //               fontSize:
                                  //                   GlobalVariable.heading_3,
                                  //               fontWeight: FontWeight.w500),
                                  //         ),
                                  //         subtitle: Text(
                                  //           controller.dataUlasan[index].ulasan!,
                                  //           maxLines: 10,
                                  //           style: TextStyle(
                                  //             overflow: TextOverflow.ellipsis,
                                  //             fontFamily:
                                  //                 GlobalVariable.fontPoppins,
                                  //             fontSize: GlobalVariable.textmd,
                                  //           ),
                                  //         ),
                                  //       );
                                  //     },
                                  //     separatorBuilder: (context, index) {
                                  //       return const Divider();
                                  //     },
                                  //     itemCount: controller.dataUlasan.length),
                                  ),
                            ],
                          ))
                    ],
                  ),
          ),
        )),
      ),
    );
  }
}
