import 'dart:developer';

import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:bacayuk/app/widget/viewers/widget_image_memory.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/collection_controller.dart';

class CollectionView extends GetView<CollectionController> {
  const CollectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final widthBody = MediaQuery.of(context).size.width;
    final heightBody = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Koleksi Pribadi',
            style: TextStyle(
                fontFamily: GlobalVariable.fontSignika,
                fontSize: GlobalVariable.heading_1),
          ),
          centerTitle: false,
        ),
        body: SafeArea(
          child: RefreshIndicator(
              onRefresh: () async {
                log("message");
                controller.getKoleksi();
                controller.update();
              },
              child: Obx(
                () => controller.loading.value == false &&
                        controller.dataKoleksi.isNotEmpty
                    ? Container(
                        width: widthBody,
                        height: heightBody,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 3 / 6,
                                  crossAxisSpacing: 3,
                                  mainAxisSpacing: 3),
                          scrollDirection: Axis.vertical,
                          itemCount: controller.dataKoleksi.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onLongPress: () {
                                controller.deleteKoleksi(index);
                              },
                              onTap: () =>
                                  Get.toNamed(Routes.BOOK_DETAIL, parameters: {
                                "id": controller.dataKoleksi[index].bukuID
                                    .toString(),
                              }),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    height: 200,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(
                                        image: base64Image(controller
                                            .dataKoleksi[index].buku!.cover!),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: heightBody * 0.01,
                                  ),
                                  Text(
                                    controller.dataKoleksi[index].buku!.judul!,
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: GlobalVariable.fontSignika,
                                        fontWeight: FontWeight.w500,
                                        fontSize: GlobalVariable.textlg),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              )),
        ));
  }
}
