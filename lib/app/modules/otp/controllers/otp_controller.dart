import 'package:bacayuk/app/data/constant/endpoint.dart';
import 'package:bacayuk/app/data/model/response_otp.dart';
import 'package:bacayuk/app/data/provider/api_provider.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  //TODO: Implement OtpController

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
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  verify() async {
    String paylaoad =
        "${otentication1.text.toString()}${otentication2.text.toString()}${otentication3.text.toString()}${otentication4.text.toString()}";
    try{
      final response  = await ApiProvider.instance().post(Endpoint.otp,
      data: ({
        "token": StorageProvider.read(StorageKey.authtoken),
        "code": int.parse(paylaoad)
      }));
      if(response.statusCode == 200){
        ResponseOtp responseOtp = ResponseOtp.fromJson(response.data);
        await StorageProvider.write(StorageKey.token, responseOtp.token!);
        await StorageProvider.write(StorageKey.status, "logged");
        Get.offAllNamed(Routes.HOME);
      }else{
        Get.snackbar("Sorry", "Verifikasi gagal");
      }
    }catch(e){
      Get.snackbar("Eror", "${e}");
    }
  }
}
