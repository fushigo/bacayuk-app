import 'package:bacayuk/app/data/constant/endpoint.dart';
import 'package:bacayuk/app/data/provider/api_provider.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void checkSession() async {
    String token = StorageProvider.read(StorageKey.token);
    String status = StorageProvider.read(StorageKey.status);

    if (status == "logged") {
      try {
        final response = await ApiProvider.instance()
            .get(Endpoint.validasi, queryParameters: {"session": token});

        if (response.statusCode == 200) {
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.offAllNamed(Routes.LOGIN);
        }
      } catch (e) {
        Get.snackbar("Error", e.toString());
      }
    } else {
      Get.offAllNamed(Routes.WELCOME);
    }

    // log(token);
    // log("Status: $status");
    // if (status == "logged") {
    //   Get.offAllNamed(Routes.HOME);
    // } else {
    //   Get.offAllNamed(Routes.WELCOME);
    // }
  }
}
