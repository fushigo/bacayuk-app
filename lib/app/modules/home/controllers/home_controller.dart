import 'dart:developer';
import 'dart:typed_data';

import 'package:bacayuk/app/data/constant/endpoint.dart';
import 'package:bacayuk/app/data/model/response_book_popular.dart';
import 'package:bacayuk/app/data/model/response_book_terbaru.dart';
import 'package:bacayuk/app/data/model/response_user_id.dart';
import 'package:bacayuk/app/data/provider/api_provider.dart';
import 'package:bacayuk/app/data/provider/image_convert.dart';
import 'package:bacayuk/app/data/provider/jwt_convert.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:bacayuk/app/widget/viewers/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final token = StorageProvider.read(StorageKey.token);
  final count = 0.obs;
  final loading = false.obs;
  final username = "".obs;
  final bio = "".obs;
  final imageBase64 = "".obs;
  late Rx<Uint8List?> profileImage = Rx<Uint8List?>(null);
  final dataBookPopular = RxList<DataBookPopular>();
  final dataBookTerbaru = RxList<DataBookTerbaru>();

  @override
  void onInit() async {
    super.onInit();
    log("UserToken: $token");
    await getUserData();
    await getPopularBooks();
    await getTerbaruBook();
  }

  Future<void> getUserData() async {
    try {
      loading(true);
      final decodedToken = await JwtConverter.jwtDecode(token);
      String userId = decodedToken["id"].toString();
      final responseUser = await ApiProvider.instance().get(Endpoint.user,
          queryParameters: {"uid": userId},
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (responseUser.statusCode == 200) {
        loading(false);
        final result = ResponseUserId.fromJson(responseUser.data);
        username.value = result.data!.username!;
        bio.value = result.data!.profile!.bio!;
        if (result.data!.profile!.gambar != null) {
          imageBase64.value = result.data!.profile!.gambar!;
          await setProfile();
        }
      } else {
        loading(false);
        SnackBarWidget.snackBarError(
            "Something went wrong, when collecting user data");
      }
    } catch (e) {
      loading(false);
      log(e.toString());
    }
  }

  Future<void> setProfile() async {
    Uint8List based64Decoded =
        await ImageConvert.base64ToImage(imageBase64.value);
    profileImage.value = based64Decoded;
  }

  Future<void> getPopularBooks() async {
    try {
      loading(true);
      final response = await ApiProvider.instance().get(
        Endpoint.bookPopular,
        options: Options(headers: {"authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200) {
        loading(false);
        // final List<dynamic> result = response.data["data"];
        final responseBookPopular = ResponseBookPopular.fromJson(response.data);
        dataBookPopular.value = responseBookPopular.data!;
      } else {
        loading(false);
        SnackBarWidget.snackBarError(
            "Something went wrong, when collecting data");
      }
    } catch (e) {
      loading(false);
      log(e.toString());
    }
  }

  Future<void> getTerbaruBook() async {
    try {
      loading(true);
      final response = await ApiProvider.instance().get(
          "${Endpoint.book}/terbaru",
          options: Options(headers: {"authorization": "Bearer $token"}));

      if(response.statusCode == 200 && response.data != null){
        loading(false);
        final responseBookTerbaru = ResponseBookTerbaru.fromJson(response.data);
        dataBookTerbaru.value = responseBookTerbaru.data!;
      }
    } catch (e) {
      loading(false);
      log(e.toString());
    }
  }

  void increment() => count.value++;
}
