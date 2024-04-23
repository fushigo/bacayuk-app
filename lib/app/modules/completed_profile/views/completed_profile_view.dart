import 'dart:io';

import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/modules/completed_profile/controllers/completed_profile_controller.dart';
import 'package:bacayuk/app/widget/forms/completed_profile_form.dart';
import 'package:bacayuk/app/widget/viewers/primary_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CompletedProfileView extends GetView<CompletedProfileController> {
  const CompletedProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final heightBody =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final widthBody = MediaQuery.of(context).size.width;
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: widthBody * 0.8,
                child: FittedBox(
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
                          fontFamily: "Poppins",
                          fontSize: GlobalVariable.textmd),
                    )
                  ]),
                ),
              ),
              SizedBox(
                height: heightBody * 0.18,
                width: widthBody * 0.4,
                child: Obx(
                  () => InkWell(
                    onTap: () {
                      controller.getImage();
                    },
                    child: ClipOval(
                        child: FittedBox(
                      fit: BoxFit.fill,
                      child: controller.imagePath.value == ''
                          ? Image.asset(
                              "asset/image/person.png",
                            )
                          : Image.file(
                              File(controller.imagePath.value),
                            ),
                    )),
                  ),
                ),
              ),
              const CompletedProfileForm(),
              Obx(() => controller.loading.value
                  ? const CircularProgressIndicator()
                  : ButtonWidget(
                      text: "Confirm",
                      onPressed: () async {
                        await controller.sendProfile();
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
