import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/modules/home/controllers/home_controller.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:bacayuk/app/widget/viewers/widget_image_memory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridBookPopular extends GetView<HomeController> {
  const GridBookPopular(this.widthBody, this.heightBody, {super.key});

  final double widthBody;
  final double heightBody;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 4 / 8,
      children: controller.dataBookPopular.take(6)
          .map((data) => SizedBox(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => Get.toNamed(Routes.BOOK_DETAIL, parameters: {
                        "id": data.bukuID.toString(),
                      }),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: data.cover != null
                              ? Image(
                                  image: base64Image(data.cover),
                                  height: heightBody * 0.18,
                                  width: widthBody * 0.5,
                                  fit: BoxFit.fill,
                                )
                              : Image.asset(
                                  "asset/image/banner_1.png",
                                  height: heightBody * 0.18,
                                  width: widthBody * 0.5,
                                  fit: BoxFit.fill,
                                )),
                    ),
                    SizedBox(
                      height: heightBody * 0.01,
                    ),
                    Text(
                      data.judul!,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: GlobalVariable.textlg,
                          fontFamily: GlobalVariable.fontSignika),
                    )
                  ],
                ),
              ))
          .toList(),
    );
  }
}
