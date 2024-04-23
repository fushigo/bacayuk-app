import 'package:bacayuk/app/data/constant/endpoint.dart';
import 'package:bacayuk/app/data/model/response_register.dart';
import 'package:bacayuk/app/data/provider/api_provider.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:bacayuk/app/widget/viewers/snackbar.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final loading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final obsecureText = true.obs;
  final checkBoxValue = false.obs;

  final count = 0.obs;

  void onToggle() {
    checkBoxValue.value = !checkBoxValue.value;
    update();
  }

  void increment() => count.value++;

  Future<void> register() async {
    if (usernameController.text.isEmpty ||
        usernameController.text.trim() == "" ||
        usernameController.text.length < 5) {
      return SnackBarWidget.snackBarInfo(
          "Username cannot be empty & must have 5 characters");
    } else if (!GetUtils.isEmail(emailController.text)) {
      return SnackBarWidget.snackBarInfo("Invalid email format");
    } else if (passwordController.text.isEmpty ||
        passwordController.text.trim() == "" ||
        passwordController.text.length < 8) {
      return SnackBarWidget.snackBarInfo(
          "Password cannot be empty & must have 8 characters");
    } else if (checkBoxValue.value != true) {
      return SnackBarWidget.snackBarInfo(
          "Please Agree with Terms & Conditions");
    }

    try {
      loading(true);
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();

      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.register,
            data: ({
              "username": usernameController.text.toString(),
              "email": emailController.text.toString(),
              "password": passwordController.text.toString()
            }));

        if (response.statusCode == 200) {
          loading(false);
          final result = ResponseRegister.fromJson(response.data);
          await StorageProvider.write(StorageKey.authtoken, result.token!);
          await StorageProvider.write(StorageKey.status, "unverify");
          await StorageProvider.write(StorageKey.profileStatus, "uncomplete");
          Get.toNamed(Routes.OTP,
              parameters: {'email': emailController.text.toString()});
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
