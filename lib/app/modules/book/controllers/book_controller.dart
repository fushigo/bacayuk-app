import 'dart:developer';

import 'package:bacayuk/app/data/constant/endpoint.dart';
import 'package:bacayuk/app/data/model/response_genre.dart';
import 'package:bacayuk/app/data/provider/api_provider.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookController extends GetxController
    with GetTickerProviderStateMixin {
  //TODO: Implement BookController

  final token = StorageProvider.read(StorageKey.token);
  final dataGenreBuku = RxList<DataGenre>();
  late TabController tabController;
  // late TabController tabGenreController;
  late Rx<TabController> tabGenreController;
  late TabController tabBukuController;

  final tabGenreLength = 1.obs;

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    tabGenreController = Rx<TabController>(TabController(length: 1, vsync: this, initialIndex: 0));
    await getGenreBuku();
  }

  @override
  void onReady() {
    super.onReady();
    // tabGenreController = TabController(
    //     length: tabGenreLength.value, vsync: this, initialIndex: 0);
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> getGenreBuku() async {
    try {
      final genres = await ApiProvider.instance().get(Endpoint.genre,
          options: Options(headers: {"authorization": "Bearer $token"}));
      if (genres.statusCode == 200) {
        final genreData = ResponseGenre.fromJson(genres.data);
        tabGenreLength.value = genreData.data!.length;
        dataGenreBuku.value = genreData.data!;
        tabGenreController = Rx<TabController>(TabController(length: genreData.data!.length, vsync: this, initialIndex: 0));
        log(genreData.data.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
