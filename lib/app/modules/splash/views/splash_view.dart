import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:bacayuk/app/modules/welcome/views/welcome_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FlutterSplashScreen.scale(
        onEnd: () {
          controller.checkSession();
        },
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade900,
              Colors.blue.shade700,
            ]),
        childWidget: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 700,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("asset/image/lg_bacayuk_white.png"),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Bersama Bacayuk memudahkan akses dalam mencari pengetahuan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  "v 1.0.0",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                  ),
                ),
              )
            ],
          ),
        ),
        duration: const Duration(milliseconds: 3000),
        animationDuration: const Duration(milliseconds: 1000),
        onAnimationEnd: () => debugPrint("On Scale End"),
      )),
    );
  }
}
