import 'dart:developer';

import 'package:bacayuk/app/data/constant/endpoint.dart';
import 'package:bacayuk/app/data/model/response_ulasan_bookid.dart';
import 'package:bacayuk/app/data/provider/api_provider.dart';
import 'package:bacayuk/app/data/provider/jwt_convert.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:bacayuk/app/widget/viewers/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UlasanController extends GetxController {
  final dataUlasan = RxList<DataUlasanBookId>();

  final TextEditingController ulasanController = TextEditingController();

  final bookId = Get.parameters["bukuid"];
  final judulBuku = Get.parameters["judul"];
  final token = StorageProvider.read(StorageKey.token);
  final ratingValue = 1.obs;

  final loading = false.obs;
  final loadingButton = false.obs;
  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await getUlasanBuku();
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

  Future<void> getUlasanBuku() async {
    try {
      loading(true);
      final response = await ApiProvider.instance().get(Endpoint.ulasan,
          queryParameters: {"bukuid": bookId},
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        loading(false);
        final result = ResponseUlasanBookid.fromJson(response.data!);
        if (result.total != 0) {
          dataUlasan.value = result.data!;
        }
      }
    } catch (e) {
      loading(false);
      log(e.toString());
    }
  }

  Future<void> createUlasanBuku() async {
    if (ulasanController.text.isEmpty || ulasanController.text.trim() == "") {
      return SnackBarWidget.snackBarInfo("Ulasan tidak boleh kosong");
    }

    try {
      loadingButton(true);
      final decodedToken = await JwtConverter.jwtDecode(token);
      final userId = decodedToken["id"].toString();
      final response = await ApiProvider.instance().post(Endpoint.ulasan,
          data: ({
            "userid": userId,
            "bukuid": bookId,
            "rating": ratingValue.toString(),
            "ulasan": ulasanController.text.toString()
          }),
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 201) {
        loadingButton(false);
        SnackBarWidget.snackBarSuccess("Komentar berhasil ditambahkan!");
        await getUlasanBuku();
        update();
      }
    } catch (e) {
      loadingButton(false);
      log(e.toString());
    }
  }

  void getRating(double value) {
    ratingValue.value = value.toInt();
    log(ratingValue.value.toString());
  }
}
