import 'dart:developer';
import 'dart:io';

import 'package:bacayuk/app/data/constant/endpoint.dart';
import 'package:bacayuk/app/data/provider/api_provider.dart';
import 'package:bacayuk/app/data/provider/image_convert.dart';
import 'package:bacayuk/app/data/provider/jwt_convert.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:bacayuk/app/widget/viewers/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CompletedProfileController extends GetxController {
  //TODO: Implement CompletedProfileController

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController namalengkapController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController tanggallahirController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  Dio dio = Dio();

  var imagePath = ''.obs;
  var imageSize = ''.obs;

  final date = "".obs;

  String profilePict = 'nopicture';

  String selectedItem = "Other";

  final count = 0.obs;
  final loading = false.obs;

  void increment() => count.value++;

  Future<void> getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      imagePath.value = image.path;
      imageSize.value =
          "${((File(imagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)}Mb";
      return SnackBarWidget.snackBarSuccess(
          "Profile picture changed successfully");
    } else {
      return SnackBarWidget.snackBarInfo("Cancel profile image selection");
    }
  }

  void check() {
    log("Value: $selectedItem");
  }

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2300)
    );

    if(picked != null) {
      tanggallahirController.text = picked.toString().split(" ")[0];
    }
  }

  sendProfile() async {
    if (namalengkapController.text.isEmpty ||
        namalengkapController.text.trim() == "") {
      return SnackBarWidget.snackBarInfo("Fullname cannot be empty");
    } else if (bioController.text.isEmpty || bioController.text.trim() == "") {
      return SnackBarWidget.snackBarInfo("Brithday cannot be empty");
    } else if (alamatController.text.isEmpty ||
        alamatController.text.trim() == "") {
      return SnackBarWidget.snackBarInfo("Address cannot be empty");
    }

    if (imagePath.value.isNotEmpty ||
        imagePath.value.trim() != "" ||
        imagePath.value != "") {
      profilePict = (await ImageConvert.imageToBase64(imagePath.value))!;
    } else {}

    try {
      loading(true);
      final token = StorageProvider.read(StorageKey.token);
      log("token: $token");
      final decodedToken = await JwtConverter.jwtDecode(token);
      String userId = decodedToken["id"].toString();

      final responseUser = await ApiProvider.instance().patch(Endpoint.user,
          data: ({
            "namaLengkap": namalengkapController.text.toString(),
            "alamat": alamatController.text.toString()
          }),
          queryParameters: {"uid": userId},
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (responseUser.statusCode == 200) {
        final responseProfile =
            await ApiProvider.instance().post(Endpoint.profile,
                data: ({
                  "jenisKelamin": selectedItem.toLowerCase(),
                  "tanggalLahir": tanggallahirController.text.toString(),
                  "gambar": profilePict,
                  "bio": bioController.text.toString()
                }),
                queryParameters: {"uid": userId},
                options: Options(headers: {"authorization": "Bearer $token"}));

        if (responseProfile.statusCode == 201) {
          loading(false);
          await StorageProvider.write(StorageKey.profileStatus, "completed");
          Get.offAllNamed(Routes.BOARDING);
        } else {
          loading(false);
          SnackBarWidget.snackBarError(
              "Something went wrong. Please try again");
        }
      }
    } on DioException catch (e) {
      loading(false);
      log(e.requestOptions.headers.toString());
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
