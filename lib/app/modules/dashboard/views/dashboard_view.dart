import 'package:bacayuk/app/data/constant/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final widthBody = MediaQuery.of(context).size.width;
    final heightBody = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return Scaffold(
        body: SafeArea(
      child: Container(
          width: widthBody,
          height: heightBody,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          color: Colors.grey.shade100,
          child: Obx(() => controller.loading.value == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(
                        width: widthBody,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome Back ${controller.dataUserProfile.value.username.toString()}!",
                              style: TextStyle(
                                  fontFamily: GlobalVariable.fontPoppins,
                                  fontSize: GlobalVariable.heading_3,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: heightBody * 0.01,
                            ),
                            RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        fontFamily: GlobalVariable.fontPoppins,
                                        color: Colors.black54,
                                        fontSize: GlobalVariable.textmd),
                                    children: [
                                  const TextSpan(
                                      text: "Anda sedang membuka dashboard "),
                                  TextSpan(
                                      text: controller
                                          .dataUserProfile.value.role
                                          .toString(),
                                      style:
                                          const TextStyle(color: Colors.blue))
                                ]))
                          ],
                        ),
                      ),
                      Container(
                        width: widthBody,
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                  offset: Offset(1, 1))
                            ]),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            SizedBox(
                              width: widthBody * 0.65,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Pengguna",
                                    style: TextStyle(
                                        fontFamily: GlobalVariable.fontPoppins,
                                        fontSize: GlobalVariable.textlg,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: heightBody * 0.01,
                                  ),
                                  Text(
                                    controller.dataUserAll.isNotEmpty
                                        ? controller.dataUserAll.length
                                            .toString()
                                        : "0",
                                    style: TextStyle(
                                        fontFamily: GlobalVariable.fontPoppins,
                                        fontSize: GlobalVariable.heading_2),
                                  ),
                                  SizedBox(
                                    height: heightBody * 0.01,
                                  ),
                                  Text(
                                    "Jumlah seluruh pengguna aplikasi",
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontFamily: GlobalVariable.fontPoppins,
                                        overflow: TextOverflow.ellipsis),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: widthBody * 0.2,
                              child: const Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.black38,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: heightBody * 0.01),
                      Container(
                        width: widthBody,
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                  offset: Offset(1, 1))
                            ]),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            SizedBox(
                              width: widthBody * 0.65,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Koleksi Buku",
                                    style: TextStyle(
                                        fontFamily: GlobalVariable.fontPoppins,
                                        fontSize: GlobalVariable.textlg,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: heightBody * 0.01,
                                  ),
                                  Text(
                                    controller.dataUserAll.isNotEmpty
                                        ? controller.dataUserAll.length
                                            .toString()
                                        : "0",
                                    style: TextStyle(
                                        fontFamily: GlobalVariable.fontPoppins,
                                        fontSize: GlobalVariable.heading_2),
                                  ),
                                  SizedBox(
                                    height: heightBody * 0.01,
                                  ),
                                  Text(
                                    "Jumlah seluruh koleksi buku",
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontFamily: GlobalVariable.fontPoppins,
                                        overflow: TextOverflow.ellipsis),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: widthBody * 0.2,
                              child: const Icon(
                                Icons.book,
                                size: 50,
                                color: Colors.black38,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))),
    ));
  }
}
