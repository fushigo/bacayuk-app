import 'dart:developer';

import 'package:bacayuk/app/data/constant/endpoint.dart';
import 'package:bacayuk/app/data/model/response_book.dart';
import 'package:bacayuk/app/data/provider/api_provider.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:bacayuk/app/widget/viewers/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class BookManagementController extends GetxController {
  final token = StorageProvider.read(StorageKey.token);
  final dataBook = RxList<BookData>();

  final loading = false.obs;
  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await getBuku();
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

  Future<void> getBuku() async {
    try {
      loading(true);
      final response = await ApiProvider.instance().get(Endpoint.book,
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        loading(false);
        final result = ResponseBook.fromJson(response.data!);
        if (result.total != 0) {
          dataBook.value = result.data!;
        }
      }
    } catch (e) {
      loading(false);
      log(e.toString());
    }
  }

  Future<void> deleteBook(bukuid) async {
    try {
      final response = await ApiProvider.instance().delete(Endpoint.book,
          queryParameters: {"id": bukuid},
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        getBuku();
        update();
        return SnackBarWidget.snackBarSuccess("Buku berhasil dihapus");
      } else {
        return SnackBarWidget.snackBarSuccess("Buku gagal dihapus");
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
