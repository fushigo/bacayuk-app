import 'dart:io';

import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/widget/completed_profile_form.dart';
import 'package:bacayuk/app/widget/primary_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/completed_profile_controller.dart';

class CompletedProfileView extends GetView<CompletedProfileController> {
  const CompletedProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Column(children: [
                  Text(
                    "Completed Your Profile",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: GlobalVariable.heading_1),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Don’t worry, only you can see your personal \n data. No one else will be able to see it.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Poppins", fontSize: GlobalVariable.textmd),
                  )
                ]),
              ),
              SizedBox(
                height: 170,
                width: 170,
                child: Obx(
                  () => InkWell(
                    onTap: () {
                      controller.getImage();
                    },
                    child: ClipOval(
                      child: Container(
                        color: Colors.grey, // Warna latar belakang avatar
                        child: controller.imagePath.value == ''
                            ? Image.asset(
                                "asset/image/person.png",
                                fit: BoxFit.cover,
                                width: 150,
                                height: 150,
                              )
                            : Image.file(
                                File(controller.imagePath.value),
                                fit: BoxFit.cover,
                                width: 150,
                                height: 150,
                              ),
                      ),
                    ),
                  ),
                ),
              ),
              const CompletedProfileForm(),
              ButtonWidget(
                  text: "Confirm",
                  onPressed: () {
                    controller.sendProfile();
                  },
                  horizontal: 150,
                  vertical: 12.00)
            ],
          ),
        ),
      ),
    ));
  }
}
