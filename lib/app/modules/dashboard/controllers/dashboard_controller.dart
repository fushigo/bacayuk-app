import 'dart:developer';

import 'package:bacayuk/app/data/constant/endpoint.dart';
import 'package:bacayuk/app/data/model/response_book.dart';
import 'package:bacayuk/app/data/model/response_user_all.dart';
import 'package:bacayuk/app/data/model/response_user_id.dart';
import 'package:bacayuk/app/data/provider/api_provider.dart';
import 'package:bacayuk/app/data/provider/jwt_convert.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final dataUserProfile = Rx<DataUser>(DataUser());
  final dataUserAll = RxList<DataUserAll>();
  final dataBookAll = RxList<BookData>();
  final loading = false.obs;

  final token = StorageProvider.read(StorageKey.token);
  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await getUserProfile();
    await getAllData();
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

  Future<void> getUserProfile() async {
    try {
      loading(true);
      final decodedToken = await JwtConverter.jwtDecode(token);
      final userId = decodedToken["id"].toString();
      final response = await ApiProvider.instance().get(Endpoint.user,
          queryParameters: {
            "uid": userId,
          },
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        loading(false);
        final result = ResponseUserId.fromJson(response.data);
        if (result.data != null) {
          dataUserProfile.value = result.data!;
          final date = DateTime.parse('2023-03-20');
          log(date.toString());
        }
      }
    } catch (e) {
      loading(false);
      log(e.toString());
    }
  }

  Future<void> getAllData() async {
    try {
      loading(true);
      final responseUserAll = await ApiProvider.instance().get(Endpoint.user,
          options: Options(headers: {"authorization": "Bearer $token"}));
      final responseBukuAll = await ApiProvider.instance().get(Endpoint.book,
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (responseUserAll.statusCode == 200 &&
          responseBukuAll.statusCode == 200) {
        loading(false);
        final resultUser = ResponseUserAll.fromJson(responseUserAll.data);
        final resultBuku = ResponseBook.fromJson(responseBukuAll.data);
        if (resultUser.data != null && resultBuku.data != null) {
          dataUserAll.value = resultUser.data!;
          dataBookAll.value = resultBuku.data!;
        }
      }
    } catch (e) {
      loading(false);
      log(e.toString());
    }
  }
}
