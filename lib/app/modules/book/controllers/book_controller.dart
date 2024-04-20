import 'dart:developer';

import 'package:bacayuk/app/data/constant/endpoint.dart';
import 'package:bacayuk/app/data/model/response_book.dart';
import 'package:bacayuk/app/data/model/response_book_kategori.dart';
import 'package:bacayuk/app/data/model/response_genre.dart';
import 'package:bacayuk/app/data/model/response_kategori.dart';
import 'package:bacayuk/app/data/provider/api_provider.dart';
import 'package:bacayuk/app/data/provider/jwt_convert.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookController extends GetxController with GetTickerProviderStateMixin {
  final token = StorageProvider.read(StorageKey.token);
  final dataGenreBuku = RxList<DataGenre>();
  final dataKategoriBuku = RxList<KategoriData>();
  // final dataBuku = RxList<BookData>();
  final dataBukuKategori = RxList<DataBookKategori>();
  final syncDataBuku = RxList<BookData>();

  late Rx<TabController> tabKategoriController;
  // late TabController tabGenreController;
  late Rx<TabController> tabGenreController;
  late TabController tabBukuController;

  final tabBarKategoriIndex = 0.obs;
  final tabBarGenreIndex = 0.obs;
  final dataCount = 0.obs;

  final role = "".obs;

  final tabKategoriLength = 1.obs;
  final tabGenreLength = 1.obs;

  final loading = false.obs;
  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    tabKategoriController = Rx<TabController>(
        TabController(length: 3, vsync: this, initialIndex: 0));
    tabGenreController = Rx<TabController>(
        TabController(length: 1, vsync: this, initialIndex: 0));
    await getRole();
    await getGenreBuku();
    await getKategoriBuku();
    await syncBookData();
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

  Future<void> getKategoriBuku() async {
    try {
      loading(true);
      final kategori = await ApiProvider.instance().get(Endpoint.kategori,
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (kategori.statusCode == 200 && kategori.data != null) {
        loading(false);
        final kategoriData = ResponseKategori.fromJson(kategori.data);
        tabKategoriLength.value = kategoriData.data!.length;
        dataKategoriBuku.value = kategoriData.data!;
        tabKategoriController = Rx<TabController>(TabController(
            length: kategoriData.data!.length, vsync: this, initialIndex: 0));
      }
    } catch (e) {
      loading(false);
      log(e.toString());
    }
  }

  Future<void> getGenreBuku() async {
    try {
      loading(true);
      final genres = await ApiProvider.instance().get(Endpoint.genre,
          options: Options(headers: {"authorization": "Bearer $token"}));
      if (genres.statusCode == 200 && genres.data != null) {
        loading(false);
        final genreData = ResponseGenre.fromJson(genres.data);
        dataGenreBuku.value = genreData.data!;
        tabGenreLength.value = dataGenreBuku.length;
        tabGenreController = Rx<TabController>(TabController(
            length: genreData.data!.length, vsync: this, initialIndex: 0));
      }
    } catch (e) {
      loading(false);
      log(e.toString());
    }
  }

  // Future<void> getBuku() async {
  //   try {
  //     final buku = await ApiProvider.instance().get(Endpoint.book,
  //         options: Options(headers: {"authorization": "Bearer $token"}));

  //     if (buku.statusCode == 200 && buku.data != null) {
  //       final result = ResponseBook.fromJson(buku.data);
  //       dataBuku.value = result.data!;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  Future<void> syncBookData() async {
    try {
      loading(true);
      final dataBukuByKategori =
          await ApiProvider.instance().get("${Endpoint.book}/kategori",
              queryParameters: {
                "kategori": dataKategoriBuku[tabBarKategoriIndex.value]
                    .namaKategori
                    .toString(),
                "genre": dataGenreBuku[tabBarGenreIndex.value].nama.toString()
              },
              options: Options(headers: {"authorization": "Bearer $token"}));

      if (dataBukuByKategori.statusCode == 200 &&
          dataBukuByKategori.data != null) {
        loading(false);
        final result = ResponseBookKategori.fromJson(dataBukuByKategori.data!);
        log(result.total.toString());
        dataBukuKategori.value = result.data!;
        dataCount.value = dataBukuKategori.length;
      }
      // if (tabBarBookIndex.value == 0) {
      //   syncDataBuku.value = dataBuku
      //       .where((book) => book.kategoriBukuRelasi!.any(
      //           (kategori) => kategori.kategoriBuku?.namaKategori == "Komik"))
      //       .toList();
      // } else if (tabBarBookIndex.value == 1) {
      //   syncDataBuku.value = dataBuku
      //       .where((book) => book.kategoriBukuRelasi!.any(
      //           (kategori) => kategori.kategoriBuku?.namaKategori == "Novel"))
      //       .toList();
      // } else if (tabBarBookIndex.value == 2) {
      //   syncDataBuku.value = dataBuku
      //       .where((book) => book.kategoriBukuRelasi!.any((kategori) =>
      //           kategori.kategoriBuku?.namaKategori == "Pendidikan"))
      //       .toList();
      // }
    } catch (e) {
      log(e.toString());
    }
  }

  void onTabBook(index) async {
    tabBarKategoriIndex.value = index;
    await syncBookData();
    log("Tab Kategori Index: ${tabBarKategoriIndex.value.toString()}");
  }

  void onTabGenre(index) async {
    tabBarGenreIndex.value = index;
    await syncBookData();
    log("Tab Genre Index: ${tabBarGenreIndex.value.toString()}");
  }

  Future<void> getRole() async {
    try {
      final jwtDecoded = await JwtConverter.jwtDecode(token);
      log("Data user: ${jwtDecoded.toString()}");
      role.value = jwtDecoded["role"];
    } catch (e) {
      log(e.toString());
    }
  }
}
