import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/modules/register/controllers/register_controller.dart';
import 'package:bacayuk/app/widget/forms/register_form.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:bacayuk/app/widget/viewers/primary_button.dart';
import 'package:bacayuk/app/widget/viewers/third_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final widthBody = MediaQuery.of(context).size.width;
    final heightBody = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    GlobalOrientation.orientationPotrait();
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: widthBody,
          height: heightBody,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Create Account",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                          fontSize: GlobalVariable.heading_1),
                    ),
                    const Text(
                      "Fill your information below or register \n with your social account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Poppins", fontWeight: FontWeight.w200),
                    )
                  ],
                ),
              ),
              const RegisterForm(),
              SizedBox(
                child: Column(
                  children: [
                    Obx(() => controller.loading.value ? const CircularProgressIndicator() : ButtonWidget(
                      onPressed: () {
                        controller.register();
                      },
                      text: "Sign Up",
                      horizontal: 110,
                      vertical: 12.00,
                    ),),
                    Container(
                        margin: const EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: GlobalVariable.textmd),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Get.offAllNamed(Routes.LOGIN);
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontFamily: "Poppins",
                                    fontSize: GlobalVariable.textmd),
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 2,
                    width: 70,
                    color: Colors.grey,
                  ),
                  Text(
                    "Or signup with",
                    style: TextStyle(
                        fontSize: GlobalVariable.textbase,
                        color: Colors.grey,
                        fontFamily: "Poppins"),
                  ),
                  Container(
                    height: 2,
                    width: 70,
                    color: Colors.grey,
                  )
                ],
              ),
              const SizedBox(
                child: ThirdAuth(),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
