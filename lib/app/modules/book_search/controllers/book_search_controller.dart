import 'dart:developer';

import 'package:bacayuk/app/data/constant/endpoint.dart';
import 'package:bacayuk/app/data/model/response_book.dart';
import 'package:bacayuk/app/data/provider/api_provider.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookSearchController extends GetxController {
  final TextEditingController searchController = TextEditingController();

  final token = StorageProvider.read(StorageKey.token);
  final dataBook = RxList<BookData>();

  final loading = false.obs;
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

  Future<void> searchBook() async {
    try {
      loading(true);
      final response = await ApiProvider.instance().get(Endpoint.book,
          queryParameters: {"search": searchController.text.toString()},
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        loading(false);
        final result = ResponseBook.fromJson(response.data);

        if (result.total != 0) {
          dataBook.value = result.data!;
          loading(false);
          update();
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
