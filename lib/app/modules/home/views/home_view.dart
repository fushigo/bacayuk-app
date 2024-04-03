import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/modules/home/controllers/home_controller.dart';
import 'package:bacayuk/app/widget/layouts/grid_book_popular.dart';
import 'package:bacayuk/app/widget/layouts/list_book_terbaru.dart';
import 'package:bacayuk/app/widget/shimmer.dart';
import 'package:bacayuk/app/widget/viewers/widget_carousel.dart';
import 'package:bacayuk/app/widget/layouts/widget_kategori_row.dart';
import 'package:bacayuk/app/widget/layouts/widget_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthBody = MediaQuery.of(context).size.width;
    final heightBody = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    GlobalOrientation.orientationPotrait();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: widthBody,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                WidgetProfile(widthBody: widthBody, heightBody: heightBody),
                SizedBox(height: heightBody * 0.03),
                WidgetCarousel(widthBody: widthBody, heightBody: heightBody),
                SizedBox(height: heightBody * 0.03),
                WidgetKategoriRow(widthBody: widthBody, heightBody: heightBody),
                SizedBox(height: heightBody * 0.03),
                SizedBox(
                  width: widthBody,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rekomendasi",
                        style: TextStyle(
                            fontFamily: GlobalVariable.fontSignika,
                            fontSize: GlobalVariable.heading_3),
                      ),
                      SizedBox(height: heightBody * 0.02),
                      SizedBox(
                        width: widthBody,
                        child: Obx(() => SizedBox(
                            child: controller.dataBookPopular.isEmpty
                                ? ShimmerWidget(widthBody, heightBody)
                                : GridBookPopular(widthBody, heightBody))),
                      ),
                      Text(
                        "Update Terbaru",
                        style: TextStyle(
                            fontFamily: GlobalVariable.fontSignika,
                            fontSize: GlobalVariable.heading_3),
                      ),
                      SizedBox(height: heightBody * 0.03),
                      SizedBox(
                          width: widthBody,
                          height: heightBody * 0.32,
                          child: Obx(() => controller.dataBookTerbaru.isEmpty
                              ? ShimmerWidget(widthBody, heightBody)
                              : WidgetListBookTerbaru(
                                  controller, widthBody, heightBody)))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
