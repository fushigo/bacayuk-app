import 'package:bacayuk/app/data/constant/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SnackBarWidget {
  static void snackBarSuccess(String message) {
    showTopSnackBar(
      Overlay.of(Get.overlayContext!),
      CustomSnackBar.success(
        textStyle: TextStyle(
            fontFamily: "Poppins",
            fontSize: GlobalVariable.textlg,
            color: Colors.white),
        message: message,
      ),
    );
  }

  static void snackBarInfo(String message) {
    showTopSnackBar(
      Overlay.of(Get.overlayContext!),
      CustomSnackBar.info(
        textStyle: TextStyle(
            fontFamily: "Poppins",
            fontSize: GlobalVariable.textlg,
            color: Colors.white),
        message: message,
      ),
    );
  }

  static void snackBarError(String message) {
    showTopSnackBar(
      Overlay.of(Get.overlayContext!),
      CustomSnackBar.error(
        textStyle: TextStyle(
            fontFamily: "Poppins",
            fontSize: GlobalVariable.textlg,
            color: Colors.white),
        message: message,
      ),
    );
  }
}
