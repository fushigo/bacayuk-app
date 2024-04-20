import 'dart:developer';
import 'dart:io';

import 'package:bacayuk/app/data/constant/endpoint.dart';
import 'package:bacayuk/app/data/provider/api_provider.dart';
import 'package:bacayuk/app/data/provider/image_convert.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:bacayuk/app/widget/viewers/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BookAddController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController judulController = TextEditingController();
  final TextEditingController sinopsisController = TextEditingController();
  final TextEditingController penulisController = TextEditingController();
  final TextEditingController tahunTerbitController = TextEditingController();
  final TextEditingController penerbitController = TextEditingController();

  var imagePath = ''.obs;
  var imageSize = ''.obs;
  String profilePict = 'nopicture';

  final loading = false.obs;

  final token = StorageProvider.read(StorageKey.token);
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

  Future<void> createBook() async {
    if (judulController.text.isEmpty || judulController.text.trim() == "") {
      return SnackBarWidget.snackBarInfo("Judul buku tidak boleh kosong");
    } else if (sinopsisController.text.isEmpty ||
        sinopsisController.text.trim() == "") {
      return SnackBarWidget.snackBarInfo("Sinopsis buku tidak boleh kosong");
    } else if (penulisController.text.isEmpty ||
        penulisController.text.trim() == "") {
      return SnackBarWidget.snackBarInfo("Penulis buku tidak boleh kosong");
    } else if (penerbitController.text.isEmpty ||
        penerbitController.text.trim() == "") {
      return SnackBarWidget.snackBarInfo("Penerbit buku tidak boleh kosong");
    } else if (tahunTerbitController.text.isEmpty ||
        tahunTerbitController.text.trim() == "") {
      return SnackBarWidget.snackBarInfo(
          "Tahun terbit buku tidak boleh kosong");
    }

    if (imagePath.value.isNotEmpty ||
        imagePath.value.trim() != "" ||
        imagePath.value != "") {
      profilePict = (await ImageConvert.imageToBase64(imagePath.value))!;
    } else {
      return SnackBarWidget.snackBarInfo(
          "Cover terbit buku tidak boleh kosong");
    }

    try {
      loading(true);
      final response = await ApiProvider.instance().post(Endpoint.book,
          data: ({
            "judul": judulController.text.toString(),
            "sinopsis": sinopsisController.text.toString(),
            "penulis": penulisController.text.toString(),
            "penerbit": penerbitController.text.toString(),
            "cover": profilePict,
            "tahunTerbit": tahunTerbitController.text.toString(),
          }),
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 201) {
        loading(false);
        SnackBarWidget.snackBarSuccess("Berhasil menambahkan buku baru!");
        Get.offAllNamed(Routes.BOOK_MANAGEMENT);
      }
    } catch (e) {
      loading(false);
      log(e.toString());
    }
  }
}
