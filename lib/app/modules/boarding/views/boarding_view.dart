import 'package:bacayuk/app/data/constant/global.dart';
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
        alignment: Alignment.center,
        child: Center(
          child: OnBoardingSlider(
            centerBackground: true,
            pageBackgroundColor: Colors.white,
            headerBackgroundColor: Colors.white,
            finishButtonText: "Start now",
            finishButtonStyle:
                FinishButtonStyle(backgroundColor: Colors.blue.shade900),
            skipTextButton: const Text("Skip"),
            background: [
              Image.asset(
                "asset/image/slider_1.png",
                width: 430,
                height: 450,
                alignment: Alignment.center,
              ),
              Image.asset(
                "asset/image/slider_2.png",
                width: 430,
                height: 450,
                alignment: Alignment.center,
              ),
              Image.asset(
                "asset/image/slider_3.png",
                width: 430,
                height: 450,
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
                child: const Column(
                  children: <Widget>[
                    SizedBox(
                      height: 480,
                    ),
                    Text("Description")
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Column(
                  children: <Widget>[
                    SizedBox(
                      height: 480,
                    ),
                    Text("Description")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
