import 'dart:developer';

import 'package:bacayuk/app/data/constant/endpoint.dart';
import 'package:bacayuk/app/data/model/response_book_id.dart';
import 'package:bacayuk/app/data/provider/api_provider.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

class BookDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement BookDetailController
  final bookId = Get.parameters["id"];

  final TextEditingController tanggalPengembalian = TextEditingController();

  //BookData
  final judulBuku = "".obs;
  final cover = "".obs;
  final sinopsis = "".obs;
  final penulis = "".obs;
  final penerbit = "".obs;
  final tahunTerbit = "".obs;

  //Utils
  final jmlhPeminjam = "".obs;
  final jmlhKoleksi = "".obs;
  final jmlahDibaca = "".obs;

  final dataGenreBookId = RxList<GenreRelasi>();
  final dataUlasanBookId = RxList<UlasanBuku>();

  final loading = false.obs;
  final token = StorageProvider.read(StorageKey.token);
  late TabController tabController;
  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    await getBookByID();
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

  void readingBook() async {
    QuickAlert.show(
      context: Get.context!,
      type: QuickAlertType.custom,
      barrierDismissible: true,
      confirmBtnText: "Confirm",
      widget: TextFormField(
        controller: tanggalPengembalian,
        decoration: const InputDecoration(
          alignLabelWithHint: true,
          hintText: 'Date',
          prefixIcon: Icon(
            Icons.calendar_today,
          ),
        ),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.phone,
        readOnly: true,
        onTap: () {
          selectDate();
        },
      ),
      onConfirmBtnTap: () {
        
      },
      title: "Return Data",
      text: "Please choose a time to return the book",
    );
  }

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2300));

    if (picked != null) {
      tanggalPengembalian.text = picked.toString().split(" ")[0];
    }
  }

  Future<void> getBookByID() async {
    try {
      loading(true);
      final response = await ApiProvider.instance().get(Endpoint.book,
          queryParameters: {"id": int.parse(bookId!)},
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        loading(false);
        final responseBookById = ResponseBookId.fromJson(response.data);

        cover.value = responseBookById.data!.cover!;
        judulBuku.value = responseBookById.data!.judul!;
        sinopsis.value = responseBookById.data!.sinopsis!;
        penulis.value = responseBookById.data!.penulis!;
        penerbit.value = responseBookById.data!.penerbit!;
        tahunTerbit.value = responseBookById.data!.tahunTerbit!.toString();
        jmlhPeminjam.value = responseBookById.jmlhPeminjaman.toString();
        jmlhKoleksi.value = responseBookById.jmlahKoleksi.toString();
        jmlahDibaca.value = responseBookById.jmlahDibaca.toString();

        if (responseBookById.data!.genreRelasi!.isNotEmpty) {
          dataGenreBookId.value = responseBookById.data!.genreRelasi!;
        } else if (responseBookById.data!.ulasanBuku!.isNotEmpty) {
          dataUlasanBookId.value = responseBookById.data!.ulasanBuku!;
        }
      }
    } catch (e) {
      loading(false);
      log(e.toString());
    }
  }
}
