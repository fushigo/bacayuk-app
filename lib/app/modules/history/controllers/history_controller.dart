import 'dart:developer';

import 'package:bacayuk/app/data/constant/endpoint.dart';
import 'package:bacayuk/app/data/model/response_history_id.dart';
import 'package:bacayuk/app/data/model/response_peminjaman_userid.dart';
import 'package:bacayuk/app/data/provider/api_provider.dart';
import 'package:bacayuk/app/data/provider/jwt_convert.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

class HistoryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final loading = false.obs;

  final dataPeminjaman = RxList<DataPeminjamanUserid>();
  final dataHistory = RxList<DataHistoryId>();

  late Rx<TabController> tabController;

  final token = StorageProvider.read(StorageKey.token);

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    tabController = Rx<TabController>(
        TabController(length: 2, vsync: this, initialIndex: 0));
    await getPeminjaman();
    await getHistory();
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

  Future<void> getPeminjaman() async {
    try {
      loading(true);
      final decodedToken = await JwtConverter.jwtDecode(token);
      final userId = decodedToken["id"].toString();
      final response = await ApiProvider.instance().get(Endpoint.peminjaman,
          queryParameters: {"userid": userId},
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        loading(false);
        final result = ResponsePeminjamanUserid.fromJson(response.data!);
        if (result.total != 0) {
          dataPeminjaman.value = result.data!;
        }
      }
    } catch (e) {
      loading(false);
      log(e.toString());
    }
  }

  Future<void> getHistory() async {
    try {
      loading(true);
      final decodedToken = await JwtConverter.jwtDecode(token);
      final userId = decodedToken["id"].toString();
      final response = await ApiProvider.instance().get(Endpoint.history,
          queryParameters: {"userid": userId},
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        loading(false);
        final result = ResponseHistoryId.fromJson(response.data!);

        if (result.total != 0) {
          dataHistory.value = result.data!;
        }
      }
    } catch (e) {
      loading(false);
      log(e.toString());
    }
  }

  Future<void> deleteKoleksi(index) async {
    try {
      QuickAlert.show(
        context: Get.context!,
        type: QuickAlertType.confirm,
        showCancelBtn: true,
        showConfirmBtn: true,
        title: "Apakah anda yakin?",
        text:
            "Anda akan menghapus buku ${dataHistory[index].buku!.judul} dari daftar history.",
        onConfirmBtnTap: () async {
          final response = await ApiProvider.instance().delete(Endpoint.koleksi,
              queryParameters: {"id": dataHistory[index].historyBacaID},
              options: Options(headers: {"authorization": "Bearer $token"}));

          if (response.statusCode == 200) {
            QuickAlert.show(
                context: Get.context!,
                type: QuickAlertType.success,
                autoCloseDuration: const Duration(seconds: 3),
                title: "Berhasil Dihapus!",
                text: "Buku berhasil dihapus dari daftar history baca.");
            await getHistory();
            update();
          }
        },
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
