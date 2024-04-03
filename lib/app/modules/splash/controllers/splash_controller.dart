import 'dart:developer';
import 'dart:io';

import 'package:bacayuk/app/data/constant/endpoint.dart';
import 'package:bacayuk/app/data/provider/api_provider.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:bacayuk/app/widget/viewers/snackbar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};

  @override
  void onInit(){
    super.onInit();
    checkSession();
  }

  Future<void> checkPermission() async {
    var deviceData = <String, dynamic>{};
    if (Platform.isAndroid) {
      try {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        _deviceData = deviceData;
        await checkAndroidPermissions();
      } on PlatformException {
        deviceData = <String, dynamic>{
          'Error:': 'Failed to get platform version.'
        };
      }
    }

    // for (var property in _deviceData.keys) {
    //   log("${_deviceData[property]}");
    // }
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'systemFeatures': build.systemFeatures,
      'displaySizeInches':
          ((build.displayMetrics.sizeInches * 10).roundToDouble() / 10),
      'displayWidthPixels': build.displayMetrics.widthPx,
      'displayWidthInches': build.displayMetrics.widthInches,
      'displayHeightPixels': build.displayMetrics.heightPx,
      'displayHeightInches': build.displayMetrics.heightInches,
      'displayXDpi': build.displayMetrics.xDpi,
      'displayYDpi': build.displayMetrics.yDpi,
      'serialNumber': build.serialNumber,
    };
  }

  Future<void> checkAndroidPermissions() async {
    if (int.parse(_deviceData["version.release"]) < 13) {
      if (await Permission.storage.isDenied) {
        await permissionHandler(Permission.storage, "Storage denied");
      }
    } else {
      if (await Permission.photos.isDenied) {
        await permissionHandler(Permission.photos, "Photos denied");
        await permissionHandler(Permission.videos, "Videos denied");
      }
    }
  }

  Future<void> permissionHandler(
      Permission permission, String logMessage) async {
    if (await permission.request().isGranted) {
    } else {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      log(logMessage);
    }
  }

  Future<void> checkInternetConnection() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        SnackBarWidget.snackBarError("Lost internet connection");
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
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
            return Get.offAllNamed(Routes.LAYOUT);
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
