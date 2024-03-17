import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/modules/home/controllers/home_controller.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:bacayuk/app/widget/widget_carousel.dart';
import 'package:bacayuk/app/widget/widget_image_memory.dart';
import 'package:bacayuk/app/widget/widget_kategori_row.dart';
import 'package:bacayuk/app/widget/widget_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

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
                                  ? Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: GridView.count(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        childAspectRatio: 4 / 7,
                                        children: List.generate(
                                            6,
                                            (index) => SizedBox(
                                                  child: Column(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Container(
                                                          height: 170,
                                                          width:
                                                              widthBody * 0.5,
                                                          color: Colors
                                                              .grey, // Placeholder color
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            heightBody * 0.02,
                                                      ),
                                                      Container(
                                                        height: 16,
                                                        width: widthBody * 0.5,
                                                        color: Colors
                                                            .grey, // Placeholder color
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                      ),
                                    )
                                  : GridView.count(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      childAspectRatio: 4 / 7,
                                      children: controller.dataBookPopular
                                          .map((data) => SizedBox(
                                                child: Column(
                                                  children: [
                                                    InkWell(
                                                      onTap: () => Get.toNamed(Routes.BOOK_DETAIL, parameters: {
                                                        "id": data.bukuID.toString(),
                                                      }),
                                                      child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child: data.cover !=
                                                                  null
                                                              ? Image(
                                                                  image: base64Image(
                                                                      data.cover),
                                                                  height: heightBody * 0.18,
                                                                  width:
                                                                      widthBody *
                                                                          0.5,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                )
                                                              : Image.asset(
                                                                  "asset/image/banner_1.png",
                                                                  height: heightBody * 0.18,
                                                                  width:
                                                                      widthBody *
                                                                          0.5,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                )),
                                                    ),
                                                    SizedBox(
                                                      height: heightBody * 0.02,
                                                    ),
                                                    Text(
                                                      data.judul!,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontSize:
                                                              GlobalVariable
                                                                  .textlg,
                                                          fontFamily:
                                                              GlobalVariable
                                                                  .fontSignika),
                                                    )
                                                  ],
                                                ),
                                              ))
                                          .toList(),
                                    ),
                            )),
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
