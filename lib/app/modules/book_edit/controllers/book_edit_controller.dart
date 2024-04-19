import 'dart:developer';
import 'dart:io';

import 'package:bacayuk/app/data/constant/endpoint.dart';
import 'package:bacayuk/app/data/model/response_book_id.dart';
import 'package:bacayuk/app/data/provider/api_provider.dart';
import 'package:bacayuk/app/data/provider/image_convert.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:bacayuk/app/widget/viewers/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BookEditController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement BookEditController

  late final tabbarController =
      Rx<TabController>(TabController(length: 2, vsync: this, initialIndex: 0));

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController judulController = TextEditingController();
  final TextEditingController sinopsisController = TextEditingController();
  final TextEditingController penulisController = TextEditingController();
  final TextEditingController tahunTerbitController = TextEditingController();
  final TextEditingController penerbitController = TextEditingController();

  final GlobalKey<FormState> formKeyFile = GlobalKey<FormState>();
  final TextEditingController namaFileController = TextEditingController();
  final TextEditingController filePickNameController = TextEditingController();

  var dataFile = RxList<File>();

  final bookId = Get.parameters["id"];
  var imagePath = ''.obs;
  var imageSize = ''.obs;
  final profilePict = "".obs;

  final filePath = ''.obs;
  final filePick = "".obs;

  final loading = false.obs;
  final loadingButton = false.obs;

  final token = StorageProvider.read(StorageKey.token);

  final fileLoading = false.obs;
  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await getBookData();
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

  Future<void> getBookData() async {
    try {
      loading(true);
      final response = await ApiProvider.instance().get(Endpoint.book,
          queryParameters: {"id": int.parse(bookId!)},
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        loading(false);
        final result = ResponseBookId.fromJson(response.data);

        if (result.data != null) {
          judulController.value = TextEditingValue(text: result.data!.judul!);
          sinopsisController.value =
              TextEditingValue(text: result.data!.sinopsis!);
          penulisController.value =
              TextEditingValue(text: result.data!.penulis!);
          penerbitController.value =
              TextEditingValue(text: result.data!.penerbit!);
          tahunTerbitController.value =
              TextEditingValue(text: result.data!.tahunTerbit.toString());
          profilePict.value = result.data!.cover!;
          dataFile.value = result.data!.file!;
        }
      }
    } catch (e) {
      loading(false);
      log(e.toString());
    }
  }

  Future<void> getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      imagePath.value = image.path;
      imageSize.value =
          "${((File(imagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)}Mb";
      return SnackBarWidget.snackBarSuccess("Cover changed successfully");
    } else {
      return SnackBarWidget.snackBarInfo("Cancel cover image selection");
    }
  }

  Future<void> updateBook() async {
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
      profilePict.value = (await ImageConvert.imageToBase64(imagePath.value))!;
    } else if (imagePath.value == "" && profilePict.value == "") {
      return SnackBarWidget.snackBarInfo("Cover buku tidak boleh kosong");
    }

    try {
      loadingButton(true);
      final response = await ApiProvider.instance().patch(Endpoint.book,
          data: ({
            "judul": judulController.text.toString(),
            "sinopsis": sinopsisController.text.toString(),
            "penulis": penulisController.text.toString(),
            "penerbit": penerbitController.text.toString(),
            "cover": profilePict.value.toString(),
            "tahunTerbit": tahunTerbitController.text.toString(),
          }),
          queryParameters: {"id": bookId},
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        loadingButton(false);
        SnackBarWidget.snackBarSuccess("Berhasil mengubah buku!");
        await getBookData();
        update();
      }
    } catch (e) {
      loadingButton(false);
      log(e.toString());
    }
  }

  Future<void> pickFile() async {
    try {
      final fileResult = await FilePicker.platform.pickFiles(
          allowedExtensions: ["pdf"],
          type: FileType.custom,
          allowCompression: true,
          allowMultiple: false);

      if (fileResult != null) {
        final file = fileResult.files.first;
        log("Path file: ${file.path}");
        filePath.value = file.path!;
        filePickNameController.value = TextEditingValue(text: file.name);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> sendFile() async {
    if (namaFileController.text.isEmpty ||
        namaFileController.text.trim() == "") {
      return SnackBarWidget.snackBarInfo("Nama file tidak boleh kosong");
    }

    if (filePath.value.isNotEmpty ||
        filePath.value.trim() != "" ||
        filePath.value != "") {
      filePick.value = (await ImageConvert.imageToBase64(filePath.value))!;
    } else if (filePath.value == "" && filePick.value == "") {
      return SnackBarWidget.snackBarInfo("File buku tidak boleh kosong");
    }

    try {
      fileLoading(true);
      final response = await ApiProvider.instance().post(Endpoint.file,
          data: ({
            "nama": namaFileController.text.toString(),
            "file": filePick.value.toString()
          }),
          queryParameters: {"bukuid": bookId},
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 201) {
        await getBookData();
        update();
        fileLoading(false);
      }
    } catch (e) {
      fileLoading(false);
      log(e.toString());
    }
  }

  Future<void> deleteFile(fileid) async {
    log(fileid.toString());
    try {
      fileLoading(true);
      final response = await ApiProvider.instance().delete(Endpoint.file,
          queryParameters: {"id": fileid},
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        await getBookData();
        update();
        fileLoading(false);
      }
    } catch (e) {
      fileLoading(false);
      log(e.toString());
    }
  }
}
