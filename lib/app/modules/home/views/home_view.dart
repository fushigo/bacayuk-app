import 'dart:developer';

import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/modules/home/controllers/home_controller.dart';
import 'package:bacayuk/app/widget/widget_carousel.dart';
import 'package:bacayuk/app/widget/widget_kategori_row.dart';
import 'package:bacayuk/app/widget/widget_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
                        child: FutureBuilder<List<dynamic>?>(
                          future: controller.getPopularBooks(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else {
                              if (snapshot.hasData && snapshot.data != null) {
                                List<dynamic> books = snapshot.data!;
                                return GridView.count(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  childAspectRatio: 3 / 6,
                                  children: books.take(6).map((item) {
                                    return Obx(() => Skeletonizer(
                                      enabled: controller.loading.value,
                                      child: SizedBox(
                                        child: Column(
                                          children: [
                                            InkWell(
                                              child: ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                child: Image.asset(
                                                  "asset/image/banner_1.png",
                                                  height: 170,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: heightBody * 0.02,
                                            ),
                                            Text(
                                              item["Judul"],
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  overflow: TextOverflow.ellipsis,
                                                  fontSize: GlobalVariable.textlg,
                                                  fontFamily:
                                                  GlobalVariable.fontSignika),
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                                  }).toList(),
                                );
                              } else {
                                return Text("No book found");
                              }
                            }
                          },
                        ),
                      )
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
