import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/completed_profile_controller.dart';

class CompletedProfileView extends GetView<CompletedProfileController> {
  const CompletedProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              child: Column(children: [
                Text(
                  "Completed Your Profile",
                  style: TextStyle(fontFamily: "Poppins"),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Don’t worry, only you can see your personal \n data. No one else will be able to see it.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: "Poppins", fontSize: 16),
                )
              ]),
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset("asset/image/person.png"),
            )
          ],
        ),
      ),
    ));
  }
}
