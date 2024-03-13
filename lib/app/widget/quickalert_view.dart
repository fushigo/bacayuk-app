import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_options.dart';
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
}
