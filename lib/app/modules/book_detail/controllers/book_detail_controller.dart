import 'dart:developer';

import 'package:bacayuk/app/data/constant/endpoint.dart';
import 'package:bacayuk/app/data/model/response_book_id.dart';
import 'package:bacayuk/app/data/model/response_ulasan_bookid.dart';
import 'package:bacayuk/app/data/model/response_validasi_koleksi_user.dart';
import 'package:bacayuk/app/data/provider/api_provider.dart';
import 'package:bacayuk/app/data/provider/jwt_convert.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

class BookDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final bookId = Get.parameters["id"];
  final fileId = 0.obs;

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
  final dataFileBookId = RxList<File>();
  final dataUlasan = RxList<DataUlasanBookId>();

  final loading = false.obs;
  final token = StorageProvider.read(StorageKey.token);
  late TabController tabController;
  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    await getBookByID();
    await getUlasan();
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
        dataGenreBookId.value = responseBookById.data!.genreRelasi!;
        dataFileBookId.value = responseBookById.data!.file!;
        // if (responseBookById.data!.genreRelasi!.isNotEmpty) {
        //   dataGenreBookId.value = responseBookById.data!.genreRelasi!;
        // } else if (responseBookById.data!.ulasanBuku!.isNotEmpty) {
        //   dataUlasanBookId.value = responseBookById.data!.ulasanBuku!;
        // } else if (responseBookById.data!.file!.isNotEmpty) {
        //   dataFileBookId.value = responseBookById.data!.file!;
        // }
      }
    } catch (e) {
      loading(false);
      log(e.toString());
    }
  }

  Future<void> getUlasan() async {
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

  void validasiPeminjaman() async {
    try {
      final decodedToken = await JwtConverter.jwtDecode(token);
      final userId = decodedToken["id"].toString();
      final dataPeminjaman = await ApiProvider.instance().get(
          "${Endpoint.peminjaman}/validasi",
          queryParameters: {"userid": userId, "bukuid": bookId},
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (dataPeminjaman.statusCode == 200) {
        Get.toNamed(Routes.BOOK_VIEWER, parameters: {
          "fileid": fileId.value != 0
              ? fileId.value.toString()
              : dataFileBookId[0].fileID.toString(),
          "id": bookId.toString()
        });
      } else {
        log("alert");
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
            peminjaman();
          },
          title: "Return Data",
          text: "Please choose a time to return the book",
        );
      }
    } on DioException catch (e) {
      if (e.message != null) {
        log("a ${e.message.toString()}");
      }
    } catch (e) {
      log("b ${e.toString()}");
    }
  }

  Future<void> peminjaman() async {
    try {
      final jwtDecoded = await JwtConverter.jwtDecode(token);
      final userId = jwtDecoded["id"];
      final response = await ApiProvider.instance().post(Endpoint.peminjaman,
          data: ({
            "tanggalPengembalian": tanggalPengembalian.text.toString(),
          }),
          queryParameters: {"uid": userId.toString(), "bukuid": bookId},
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 201) {
        log(dataFileBookId[0].fileID.toString());
        Get.toNamed(Routes.BOOK_VIEWER, parameters: {
          "fileid": dataFileBookId[0].fileID.toString(),
          "id": bookId.toString()
        });
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> addKoleksi() async {
    try {
      final jwtDecoded = await JwtConverter.jwtDecode(token);
      final userId = jwtDecoded["id"];

      final validasiKoleksi = await ApiProvider.instance().get(
          "${Endpoint.koleksi}/validasi",
          queryParameters: {"userid": userId, "bukuid": bookId});

      if (validasiKoleksi.statusCode == 200) {
        final result =
            ResponseValidasiKoleksiUser.fromJson(validasiKoleksi.data!);

        if (result.data != null) {
          QuickAlert.show(
              context: Get.context!,
              type: QuickAlertType.info,
              autoCloseDuration: const Duration(seconds: 3),
              title: "Operasi Gagal!",
              text: "Buku sudah berada di dalam daftar koleksi pribadi.");
        } else {
          log("masokk");
          final response = await ApiProvider.instance().post(Endpoint.koleksi,
              data: ({"userid": userId, "bukuid": bookId}),
              options: Options(headers: {"authorization": "Bearer $token"}));

          if (response.statusCode == 201) {
            QuickAlert.show(
                context: Get.context!,
                type: QuickAlertType.success,
                autoCloseDuration: const Duration(seconds: 3),
                title: "Operasi Berhasil!",
                text: "Buku berhasil ditambahkan ke daftar koleksi pribadi.");
          }
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
