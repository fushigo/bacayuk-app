import 'package:bacayuk/app/data/constant/endpoint.dart';
import 'package:bacayuk/app/data/model/response_login.dart';
import 'package:bacayuk/app/data/provider/api_provider.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:bacayuk/app/widget/viewers/snackbar.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final obsecureText = true.obs;
  final loading = false.obs;

  final count = 0.obs;
  void increment() => count.value++;

  login() async {
    if (emailController.text.isEmpty || emailController.text.trim() == "") {
      return SnackBarWidget.snackBarInfo("Email cannot be empty");
    } else if (!GetUtils.isEmail(emailController.text)) {
      return SnackBarWidget.snackBarInfo("Invalid email format");
    } else if (passwordController.text.isEmpty ||
        passwordController.text.trim() == "") {
      return SnackBarWidget.snackBarInfo("Password cannot be empty");
    }
    try {
      loading(true);
      final profileStatus = StorageProvider.read(StorageKey.profileStatus);
      final emailStatus = StorageProvider.read(StorageKey.status);

      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();

      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.login,
            data: ({
              "email": emailController.text.toString(),
              "password": passwordController.text.toString()
            }));

        if (response.statusCode == 200) {
          loading(false);
          if (profileStatus == "uncomplete") {
            return Get.toNamed(Routes.COMPLETED_PROFILE);
          } else if (emailStatus == "unverify") {
            return Get.toNamed(Routes.OTP,
                parameters: {"email": emailController.text.toString()});
          }else{
            final result = ResponseLogin.fromJson(response.data);
            await StorageProvider.write(StorageKey.status, "logged");
            await StorageProvider.write(StorageKey.token, result.token!);
            Get.offAllNamed(Routes.LAYOUT);
          }
        } else {
          loading(false);
          SnackBarWidget.snackBarError(
              "Something went wrong. Please check your credentials and try again");
        }
      }
    } on dio.DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          final errorResponse = e.response?.data['message'] ??
              "Please check your credentials and try again";
          SnackBarWidget.snackBarError("Something went wrong. $errorResponse");
        }
      } else {
        SnackBarWidget.snackBarError(
            "Something went wrong. ${e.message ?? ""}");
      }
    } catch (e) {
      loading(false);
      SnackBarWidget.snackBarError("Something went wrong. ${e.toString()}");
    }
  }
}
