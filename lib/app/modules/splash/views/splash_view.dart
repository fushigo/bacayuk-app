import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/modules/splash/controllers/splash_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GlobalOrientation.orientationPotrait();
    return Scaffold(
      body: Center(
          child: FlutterSplashScreen.scale(
        onEnd: () async {
          // controller.checkInternetConnection();
          await controller.checkPermission();
          await controller.checkInternetConnection();
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 600,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("asset/image/lg_bacayuk_white.png"),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Bersama Bacayuk memudahkan akses dalam mencari pengetahuan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: GlobalVariable.textmd,
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
