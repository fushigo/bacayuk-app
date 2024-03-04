import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/modules/otp/controllers/otp_controller.dart';
import 'package:bacayuk/app/widget/otp_form.dart';
import 'package:bacayuk/app/widget/primary_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GlobalOrientation.orientationPotrait();
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 150,
                width: 160,
                decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(20)),
                child: LottieBuilder.asset("asset/json/otp.json"),
              ),
              SizedBox(
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
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: GlobalVariable.textlg),
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
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OtpForm(
                      textEditingController: controller.otentication1,
                      first: true,
                      last: false,
                    ),
                    OtpForm(
                      textEditingController: controller.otentication2,
                      first: false,
                      last: false,
                    ),
                    OtpForm(
                      textEditingController: controller.otentication3,
                      first: false,
                      last: false,
                    ),
                    OtpForm(
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
              ButtonWidget(
                  text: "Verify",
                  onPressed: () {
                    controller.verify();
                  },
                  horizontal: 110,
                  vertical: 12.00)
            ],
          ),
        ),
      ),
    ));
  }
}
