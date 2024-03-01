import 'package:bacayuk/app/data/constant/endpoint.dart';
import 'package:bacayuk/app/data/model/response_login.dart';
import 'package:bacayuk/app/data/provider/api_provider.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:bacayuk/app/widget/snackbar.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final loading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final obsecureText = true.obs;

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

  login() async {
    if (emailController.text.isEmpty ||
        emailController.text.trim() == "") {
      return SnackBarWidget.snackBarInfo("Email cannot be empty");
    } else if (!GetUtils.isEmail(emailController.text)) {
      return SnackBarWidget.snackBarInfo("Invalid email format");
    } else if (passwordController.text.isEmpty ||
        passwordController.text.trim() == "") {
      return SnackBarWidget.snackBarInfo("Password cannot be empty");
    }

    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();

      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.login,
            data: ({
              "email": emailController.text.toString(),
              "password": passwordController.text.toString()
            }));

        if (response.statusCode == 200) {
          final result = ResponseLogin.fromJson(response.data);
          await StorageProvider.write(StorageKey.status, "logged");
          await StorageProvider.write(StorageKey.token, result.token!);
          Get.offAllNamed(Routes.HOME);
        } else {
          SnackBarWidget.snackBarError(
              "Something went wrong. Please check your credentials and try again");
        }
      }
      loading(false);
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
