import 'dart:developer';

import 'package:bacayuk/app/data/constant/endpoint.dart';
import 'package:bacayuk/app/data/model/response_koleksi_userid.dart';
import 'package:bacayuk/app/data/provider/api_provider.dart';
import 'package:bacayuk/app/data/provider/jwt_convert.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

class CollectionController extends GetxController {
  final token = StorageProvider.read(StorageKey.token);

  final dataKoleksi = RxList<DataKoleksiUserId>();

  final count = 0.obs;
  final loading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getKoleksi();
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

  Future<void> getKoleksi() async {
    try {
      final decodedToken = await JwtConverter.jwtDecode(token);
      final userId = decodedToken["id"].toString();
      final response = await ApiProvider.instance().get(Endpoint.koleksi,
          queryParameters: {"userid": userId},
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        final koleksi = ResponseKoleksiUserid.fromJson(response.data!);
        if (koleksi.total != 0) {
          dataKoleksi.value = koleksi.data!;
        }
      }
    } catch (e) {
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
            "Anda akan menghapus buku ${dataKoleksi[index].buku!.judul} dari daftar koleksi pribadi.",
        onConfirmBtnTap: () async {
          final response = await ApiProvider.instance().delete(Endpoint.koleksi,
              queryParameters: {"id": dataKoleksi[index].koleksiID},
              options: Options(headers: {"authorization": "Bearer $token"}));

          if (response.statusCode == 200) {
            QuickAlert.show(
                context: Get.context!,
                type: QuickAlertType.success,
                autoCloseDuration: const Duration(seconds: 3),
                title: "Berhasil Dihapus!",
                text: "Buku berhasil dihapus dari daftar koleksi pribadi.");
            await getKoleksi();
            update();
          }
        },
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
