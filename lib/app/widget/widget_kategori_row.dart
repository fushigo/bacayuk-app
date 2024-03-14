import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class WidgetKategoriRow extends GetView<HomeController> {
  const WidgetKategoriRow(
      {super.key, required this.widthBody, required this.heightBody});

  final double widthBody;
  final double heightBody;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthBody,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Kategori Buku",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontFamily: GlobalVariable.fontSignika,
                fontSize: GlobalVariable.heading_3),
          ),
          SizedBox(
            height: heightBody * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: InkWell(
                  child: Column(
                    children: [
                      SizedBox(
                          width: widthBody * 0.15,
                          height: heightBody * 0.06,
                          child: FittedBox(
                            child: Image.asset(
                              "asset/image/comic_ic.png",
                            ),
                          )),
                      Text(
                        "Komik",
                        style: TextStyle(
                            fontFamily: GlobalVariable.fontSignika,
                            fontSize: GlobalVariable.textlg),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: InkWell(
                  child: Column(
                    children: [
                      SizedBox(
                          width: widthBody * 0.15,
                          height: heightBody * 0.06,
                          child: FittedBox(
                            child: Image.asset(
                              "asset/image/novel_ic.png",
                            ),
                          )),
                      Text(
                        "Novel",
                        style: TextStyle(
                            fontFamily: GlobalVariable.fontSignika,
                            fontSize: GlobalVariable.textlg),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: InkWell(
                  child: Column(
                    children: [
                      SizedBox(
                          width: widthBody * 0.15,
                          height: heightBody * 0.06,
                          child: Column(
                            children: [
                              Image.asset(
                                "asset/image/pendidikan_ic.png",
                              ),
                            ],
                          )),
                      Text(
                        "Pendidikan",
                        style: TextStyle(
                            fontFamily: GlobalVariable.fontSignika,
                            fontSize: GlobalVariable.textlg),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
