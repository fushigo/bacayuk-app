import 'dart:async';

import 'package:bacayuk/app/data/constant/endpoint.dart';
import 'package:bacayuk/app/data/model/response_generate_otp.dart';
import 'package:bacayuk/app/data/model/response_otp.dart';
import 'package:bacayuk/app/data/provider/api_provider.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:bacayuk/app/widget/viewers/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  //TODO: Implement OtpController

  late Timer _timer;
  final _start = 60.obs;
  var isTimerRunning = false.obs;
  final loading = false.obs;

  final String email = Get.parameters['email'] ?? "No have email";
  final TextEditingController otentication1 = TextEditingController();
  final TextEditingController otentication2 = TextEditingController();
  final TextEditingController otentication3 = TextEditingController();
  final TextEditingController otentication4 = TextEditingController();

  final maxValue = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  void increment() => count.value++;

  void startTimer() {
    isTimerRunning.value = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start.value == 0) {
        timer.cancel();
        isTimerRunning.value = false;
      } else {
        _start.value--;
      }
    });
  }

  RxInt get seconds => _start;

  void resetTimer() {
    _start.value = 60;
    startTimer();
  }

  Future<void> resendotp() async {
    try {
      final response = await ApiProvider.instance()
          .get(Endpoint.otp, queryParameters: {"email": email});

      if (response.statusCode == 200) {
        final result = ResponseGenerateOtp.fromJson(response.data);
        await StorageProvider.write(StorageKey.authtoken, result.token!);
        SnackBarWidget.snackBarSuccess(
            "Verification code has been sent to your email");
      }
    } catch (e) {
      SnackBarWidget.snackBarError("Something went wrong. ${e.toString()}");
    }
  }

  Future<void> verify() async {
    String paylaoad =
        "${otentication1.text.toString()}${otentication2.text.toString()}${otentication3.text.toString()}${otentication4.text.toString()}";
    try {
      loading(true);
      final response = await ApiProvider.instance().post(Endpoint.otp,
          data: ({
            "token": StorageProvider.read(StorageKey.authtoken),
            "code": int.parse(paylaoad)
          }));
      if (response.statusCode == 200) {
        loading(false);
        ResponseOtp responseOtp = ResponseOtp.fromJson(response.data);
        await StorageProvider.write(StorageKey.token, responseOtp.token!);
        await StorageProvider.write(StorageKey.status, "logged");
        Get.offAllNamed(Routes.COMPLETED_PROFILE);
      } else {
        loading(false);
        SnackBarWidget.snackBarError(
            "Something went wrong. Email verification has failed");
      }
    } catch (e) {
      loading(false);
      SnackBarWidget.snackBarError("Something went wrong. ${e.toString()}");
    }
  }
}
