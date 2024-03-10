import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import 'package:get/get.dart';

import '../controllers/boarding_controller.dart';

class BoardingView extends GetView<BoardingController> {
  const BoardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: OnBoardingSlider(
          centerBackground: true,
          pageBackgroundColor: Colors.white,
          headerBackgroundColor: Colors.white,
          finishButtonText: "Start Now",
          onFinish: () => Get.offAllNamed(Routes.HOME),
          finishButtonStyle:
              FinishButtonStyle(backgroundColor: Colors.blue.shade900),
          skipTextButton: Text(
            "Skip",
            style: TextStyle(
                fontFamily: GlobalVariable.fontPoppins,
                fontSize: GlobalVariable.textlg),
          ),
          background: [
            Image.asset(
              "asset/image/slider_1.png",
              width: 300,
              height: 320,
              alignment: Alignment.center,
            ),
            Image.asset(
              "asset/image/slider_2.png",
              width: 300,
              height: 320,
              alignment: Alignment.center,
            ),
            Image.asset(
              "asset/image/slider_3.png",
              width: 300,
              height: 320,
              alignment: Alignment.center,
            ),
          ],
          totalPage: 3,
          speed: 1.8,
          pageBodies: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 480,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                            fontFamily: GlobalVariable.fontPoppins,
                            fontSize: GlobalVariable.heading_2,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                        children: const [
                          TextSpan(
                              text:
                                  "Memulai petualangan literasi \n digital bersama "),
                          TextSpan(
                              text: "Baca Yuk!",
                              style: TextStyle(color: Colors.blueAccent))
                        ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Temukan beragam fitur yang akan mempermudah awal perjalananmu dalam literasi digital. Kami hadir untuk membuat pengalaman membaca menjadi lebih menyenangkan",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: GlobalVariable.fontPoppins,
                        fontSize: GlobalVariable.textmd),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 480,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                            fontFamily: GlobalVariable.fontPoppins,
                            fontSize: GlobalVariable.heading_2,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                        children: const [
                          TextSpan(text: "Kemudahan dalam melakukan \n"),
                          TextSpan(
                              text: "pencarian ",
                              style: TextStyle(color: Colors.blueAccent)),
                          TextSpan(
                            text: "buku perpustakaan",
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Kami hadir dengan fitur khusus yang membantu proses pencarian buku perpustakaan melalui sistem pencarian. Dengan adanya fitur ini anda dapat mencari berbagai macam jenis kategori koleksi buku dengan cepat dan mudah",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: GlobalVariable.fontPoppins,
                        fontSize: GlobalVariable.textmd),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 480,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                            fontFamily: GlobalVariable.fontPoppins,
                            fontSize: GlobalVariable.heading_2,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                        children: const [
                          TextSpan(
                              text:
                                  "Baca di Mana Saja, Kapan Saja \n dengan "),
                          TextSpan(
                              text: "Baca Yuk!",
                              style: TextStyle(color: Colors.blueAccent))
                        ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Fitur baca online yang memungkinkan Anda menikmati buku tanpa perlu repot meminjam buku fisik di perpustakaan.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: GlobalVariable.fontPoppins,
                        fontSize: GlobalVariable.textmd),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
