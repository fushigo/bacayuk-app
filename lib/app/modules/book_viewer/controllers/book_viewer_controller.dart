import 'dart:developer';

import 'package:bacayuk/app/data/constant/endpoint.dart';
import 'package:bacayuk/app/data/model/response_file_id.dart';
import 'package:bacayuk/app/data/provider/api_provider.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class BookViewerController extends GetxController {
  //TODO: Implement BookViewerController

  final count = 0.obs;
  final pdfbase64 = "".obs;
  final fileId = Get.parameters["fileid"];

  final loading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getPdf();
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

  Future<void> getPdf() async {
    try {
      loading(true);
      final token = StorageProvider.read(StorageKey.token);
      final response = await ApiProvider.instance().get(Endpoint.file,
          queryParameters: {"id": fileId.toString()},
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        final result = ResponseFileId.fromJson(response.data);
        pdfbase64.value = result.data!.file!;
        loading(false);
        log(response.toString());
      }
    } catch (e) {
      loading(false);
      log('Error: ${e.toString()}');
    }
  }
}
