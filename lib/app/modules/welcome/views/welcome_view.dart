import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/modules/welcome/controllers/welcome_controller.dart';
import 'package:bacayuk/app/widget/text_view.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:bacayuk/app/widget/inline_text.dart';
import 'package:bacayuk/app/widget/primary_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalOrientation.orientationPotrait();
    return Scaffold(
      body: SafeArea(
          child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                SizedBox(
                  child: LottieBuilder.asset(
                    "asset/json/welcome.json",
                    width: 300,
                    height: 300,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextView()
              ],
            ),
            Column(
              children: [
                ButtonWidget(
                  text: "Getting Started",
                  horizontal: 80.00,
                  vertical: 13.00,
                  onPressed: () => Get.offAllNamed(Routes.REGISTER),
                ),
                const SizedBox(
                  height: 30,
                ),
                InlineTextWidget(
                  text: "Already have an account?",
                  onPressed: () => Get.offAllNamed(Routes.LOGIN),
                  textButton: "Sign In",
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
