import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/modules/otp/controllers/otp_controller.dart';
import 'package:bacayuk/app/widget/forms/otp_form.dart';
import 'package:bacayuk/app/widget/viewers/primary_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final widthBody = MediaQuery.of(context).size.width;
    final heightBody =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    GlobalOrientation.orientationPotrait();
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          width: widthBody,
          height: heightBody,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: heightBody * 0.25,
                width: widthBody * 0.7,
                decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(20)),
                child: LottieBuilder.asset("asset/json/otp.json"),
              ),
              SizedBox(
                width: widthBody * 0.7,
                child: FittedBox(
                  child: Column(
                    children: [
                      Text(
                        "Verify Code",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: GlobalVariable.heading_1,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Please enter code we just sent to email",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: GlobalVariable.textmd),
                      ),
                      Text(
                        controller.email.toString(),
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                            color: Colors.blue.shade900),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OtpForm(
                      widthContent: widthBody * 0.18,
                      heightContent: heightBody * 0.08,
                      textEditingController: controller.otentication1,
                      first: true,
                      last: false,
                    ),
                    OtpForm(
                      widthContent: widthBody * 0.18,
                      heightContent: heightBody * 0.08,
                      textEditingController: controller.otentication2,
                      first: false,
                      last: false,
                    ),
                    OtpForm(
                      widthContent: widthBody * 0.18,
                      heightContent: heightBody * 0.08,
                      textEditingController: controller.otentication3,
                      first: false,
                      last: false,
                    ),
                    OtpForm(
                      widthContent: widthBody * 0.18,
                      heightContent: heightBody * 0.08,
                      textEditingController: controller.otentication4,
                      first: false,
                      last: true,
                    )
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    Text(
                      "Didn't receive OTP?",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: GlobalVariable.textmd),
                    ),
                    Obx(() => InkWell(
                          onTap: controller.isTimerRunning.value
                              ? null
                              : () {
                                  controller.resendotp();
                                  controller.resetTimer();
                                },
                          child: Obx(() => Text(
                                controller.isTimerRunning.value
                                    ? "Resend code after ${controller.seconds}"
                                    : "Resend code",
                                style: TextStyle(
                                    color: controller.isTimerRunning.value
                                        ? Colors.grey
                                        : Colors.blue.shade900,
                                    fontFamily: "Poppins",
                                    fontSize: GlobalVariable.textmd),
                              )),
                        ))
                  ],
                ),
              ),
              Obx(() => controller.loading.value
                  ? const CircularProgressIndicator()
                  : ButtonWidget(
                      text: "Verify",
                      onPressed: () {
                        controller.verify();
                      },
                      horizontal: widthBody * 0.3,
                      vertical: heightBody * 0.015,
                    ))
            ],
          ),
        ),
      ),
    ));
  }
}
