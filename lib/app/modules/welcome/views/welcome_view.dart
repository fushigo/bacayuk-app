import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/modules/welcome/controllers/welcome_controller.dart';
import 'package:bacayuk/app/widget/viewers/text_view.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:bacayuk/app/widget/viewers/inline_text.dart';
import 'package:bacayuk/app/widget/viewers/primary_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightBody = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final widthBody = MediaQuery.of(context).size.width;
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
                    width: widthBody,
                    height: heightBody * 0.3,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextView(widthContent: widthBody * 0.85, heightContent: heightBody * 0.2,)
              ],
            ),
            Column(
              children: [
                ButtonWidget(
                  text: "Getting Started",
                  horizontal: widthBody * 0.2,
                  vertical: heightBody * 0.015,
                  onPressed: () => Get.toNamed(Routes.REGISTER),
                ),
                const SizedBox(
                  height: 30,
                ),
                InlineTextWidget(
                  text: "Already have an account?",
                  onPressed: () => Get.toNamed(Routes.LOGIN),
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
