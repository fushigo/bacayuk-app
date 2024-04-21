import 'dart:developer';

import 'package:bacayuk/app/data/constant/endpoint.dart';
import 'package:bacayuk/app/data/model/response_user_id.dart';
import 'package:bacayuk/app/data/provider/api_provider.dart';
import 'package:bacayuk/app/data/provider/jwt_convert.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final token = StorageProvider.read(StorageKey.token);

  final dataUserProfile = Rx<DataUser>(DataUser());
  final loading = false.obs;
  final count = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserProfile();
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
          final date = DateTime.parse('2023-3-20');
          log(date.toString());
        }
      }
    } catch (e) {
      loading(false);
      log(e.toString());
    }
  }
}
