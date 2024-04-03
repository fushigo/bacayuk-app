import 'package:auto_size_text/auto_size_text.dart';
import 'package:bacayuk/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/constant/global.dart';

class WidgetProfile extends GetView<HomeController> {
  const WidgetProfile(
      {super.key, required this.widthBody, required this.heightBody});

  final widthBody;
  final heightBody;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthBody,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: widthBody * 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ]),
                  width: widthBody * 0.17,
                  height: heightBody * 0.08,
                  child: Obx(() => ClipOval(
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: controller.profileImage.value != null
                        ? Image.memory(controller.profileImage.value!)
                          : Image.asset("asset/image/person.png"),
                        ),
                      )),
                ),
                Obx(
                  () => SizedBox(
                    width: widthBody * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          controller.bio.value.isNotEmpty
                              ? controller.bio.value
                              : "Stay trending!",
                          minFontSize: GlobalVariable.textbase,
                          maxFontSize: GlobalVariable.textlg,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: GlobalVariable.fontPoppins,
                            fontSize: GlobalVariable.textmd,
                          ),
                        ),
                        AutoSizeText(
                          controller.username.value != ""
                              ? controller.username.value
                              : "Fushigo Sama",
                          minFontSize: GlobalVariable.textbase,
                          maxFontSize: GlobalVariable.textlg,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: GlobalVariable.fontPoppins,
                            fontWeight: FontWeight.w400,
                            fontSize: GlobalVariable.textlg,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: widthBody * 0.16,
            height: heightBody * 0.05,
            child: FittedBox(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () {
                    // Tambahkan fungsi ketika tombol ditekan
                  },
                  icon: const Icon(Icons.search),
                  iconSize: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
