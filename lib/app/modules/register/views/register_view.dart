import 'package:bacayuk/app/widget/register_form.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:bacayuk/app/widget/primary_button.dart';
import 'package:bacayuk/app/widget/third_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Create Account",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                          fontSize: 24),
                    ),
                    Text(
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
                    ButtonWidget(
                      onPressed: () {
                        controller.register();
                      },
                      text: "Sign Up",
                      horizontal: 150,
                      vertical: 12.00,
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(
                                  fontFamily: "Poppins", fontSize: 14),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Get.offAllNamed(Routes.LOGIN);
                              },
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontFamily: "Poppins",
                                    fontSize: 14),
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
                  const Text(
                    "Or signup with",
                    style: TextStyle(
                        fontSize: 12,
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
