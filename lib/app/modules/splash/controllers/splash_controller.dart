import 'dart:developer';

import 'package:bacayuk/app/data/constant/endpoint.dart';
import 'package:bacayuk/app/data/provider/api_provider.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:bacayuk/app/widget/snackbar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  @override
  void onInit() {
    super.onInit();
    // checkInternetConnection();
  }

  void checkPermission() async {
    if (await Permission.accessMediaLocation.isDenied) {
      await permissionHandler(Permission.accessMediaLocation);
      log("AccessMediaLocation denied");
    } else if (await Permission.mediaLibrary.isDenied) {
      await permissionHandler(Permission.mediaLibrary);
      log("MediaLibrary denied");
    } else if (await Permission.storage.isDenied) {
      await permissionHandler(Permission.storage);
      log("Storage denied");
    } else if (await Permission.manageExternalStorage.isDenied) {
      await permissionHandler(Permission.manageExternalStorage);
      log("Storage denied");
    } else if (await Permission.photos.isDenied) {
      await permissionHandler(Permission.photos);
      log("Photos denied");
    }
  }

  Future<void> permissionHandler(Permission permission) async {
    final getPermission = await permission.request();

    if (getPermission.isDenied) {
      Get.close(10);
    }
  }

  Future<void> checkInternetConnection() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        // Jika tidak ada koneksi, tutup aplikasi
        log(connectivityResult.toString());
      } else {
        log(connectivityResult.toString());
      }
    } catch (error) {
      log("Error checking connectivity: $error");
      // Handle the error accordingly
    }
  }

  void checkSession() async {
    String token = StorageProvider.read(StorageKey.token);
    String status = StorageProvider.read(StorageKey.status);
    final profileStatus = StorageProvider.read(StorageKey.profileStatus);
    final emailStatus = StorageProvider.read(StorageKey.status);

    if (profileStatus == "uncomplete" || emailStatus == "unverify") {
      Get.offAllNamed(Routes.WELCOME);
    } else {
      if (status == "logged") {
        try {
          final response = await ApiProvider.instance()
              .get(Endpoint.validasi, queryParameters: {"session": token});

          if (response.statusCode == 200) {
            return Get.offAllNamed(Routes.HOME);
          } else {
            return Get.offAllNamed(Routes.LOGIN);
          }
        } catch (e) {
          return SnackBarWidget.snackBarError("Error : ${e.toString()}");
        }
      } else {
        return Get.offAllNamed(Routes.WELCOME);
      }
    }
  }
}
