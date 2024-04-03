import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class QuickAlertWidget {
  static loadingAlert(RxBool loading) {
    QuickAlert.show(
      context: Get.context!,
      disableBackBtn: true,
      type: QuickAlertType.loading,
      autoCloseDuration: loading.value == true
          ? const Duration(days: 1)
          : const Duration(milliseconds: 1),
      title: "Loading data...",
    );
  }

  static inputAlert(String title, String text) {
    QuickAlert.show(
      context: Get.context!,
      type: QuickAlertType.custom,
      barrierDismissible: true,
      confirmBtnText: "Confirm",
      widget: TextFormField(
        decoration: const InputDecoration(
          alignLabelWithHint: true,
          hintText: 'Date',
          prefixIcon: Icon(
            Icons.calendar_today,
          ),
        ),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.phone,
        readOnly: true,
        onTap: () {
          
        },
      ),
      title: title,
      text: text,
    );
  }
}
