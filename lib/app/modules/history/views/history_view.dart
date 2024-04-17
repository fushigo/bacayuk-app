import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:bacayuk/app/widget/viewers/widget_image_memory.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final widthBody = MediaQuery.of(context).size.width;
    final heightBody = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'History',
            style: TextStyle(
                fontFamily: GlobalVariable.fontSignika,
                fontSize: GlobalVariable.heading_1),
          ),
          centerTitle: false,
        ),
        body: SafeArea(
            child: Obx(
          () => controller.loading.value == false
              ? Container(
                  width: widthBody,
                  height: heightBody,
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      TabBar(
                        controller: controller.tabController.value,
                        tabs: const [
                          Tab(
                            text: "Peminjaman",
                          ),
                          Tab(
                            text: "History Baca",
                          )
                        ],
                      ),
                      SizedBox(
                        height: heightBody * 0.02,
                      ),
                      SizedBox(
                        width: widthBody,
                        height: heightBody * 0.75,
                        child: TabBarView(
                          controller: controller.tabController.value,
                          children: [
                            SizedBox(
                              width: widthBody,
                              child: RefreshIndicator(
                                onRefresh: () async {
                                  controller.getPeminjaman();
                                  controller.update();
                                },
                                child: GridView.builder(
                                  itemCount: controller.dataPeminjaman.length,
                                  scrollDirection: Axis.vertical,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          childAspectRatio: 3 / 6,
                                          crossAxisSpacing: 3,
                                          mainAxisSpacing: 3),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () => Get.toNamed(
                                          Routes.BOOK_DETAIL,
                                          parameters: {
                                            "id": controller
                                                .dataPeminjaman[index].bukuID
                                                .toString(),
                                          }),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: 200,
                                            height: 200,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image(
                                                  image: base64Image(controller
                                                      .dataPeminjaman[index]
                                                      .buku!
                                                      .cover!)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: heightBody * 0.01,
                                          ),
                                          Text(
                                            controller.dataPeminjaman[index]
                                                .buku!.judul!,
                                            textAlign: TextAlign.start,
                                            maxLines: 2,
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontFamily:
                                                    GlobalVariable.fontSignika,
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    GlobalVariable.textlg),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: widthBody,
                              child: RefreshIndicator(
                                onRefresh: () async {
                                  controller.getHistory();
                                  controller.update();
                                },
                                child: GridView.builder(
                                  itemCount: controller.dataHistory.length,
                                  scrollDirection: Axis.vertical,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          childAspectRatio: 3 / 6,
                                          crossAxisSpacing: 3,
                                          mainAxisSpacing: 3),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () => Get.toNamed(
                                          Routes.BOOK_DETAIL,
                                          parameters: {
                                            "id": controller
                                                .dataHistory[index].bukuID
                                                .toString(),
                                          }),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: 200,
                                            height: 200,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image(
                                                  image: base64Image(controller
                                                      .dataHistory[index]
                                                      .buku!
                                                      .cover!)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: heightBody * 0.01,
                                          ),
                                          Text(
                                            controller.dataHistory[index].buku!
                                                .judul!,
                                            textAlign: TextAlign.start,
                                            maxLines: 2,
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontFamily:
                                                    GlobalVariable.fontSignika,
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    GlobalVariable.textlg),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ))
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        )));
  }
}
