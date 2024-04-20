import 'dart:developer';

import 'package:bacayuk/app/data/constant/endpoint.dart';
import 'package:bacayuk/app/data/model/response_book_id.dart';
import 'package:bacayuk/app/data/model/response_file_id.dart';
import 'package:bacayuk/app/data/model/response_history_id.dart';
import 'package:bacayuk/app/data/provider/api_provider.dart';
import 'package:bacayuk/app/data/provider/jwt_convert.dart';
import 'package:bacayuk/app/data/provider/storage_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

class BookViewerController extends GetxController {
  final count = 0.obs;
  final pdfbase64 = "".obs;
  final fileId = Get.parameters["fileid"];
  final bookId = Get.parameters["id"];
  final fileIdDynamic = 0.obs;
  final token = StorageProvider.read(StorageKey.token);
  late var fileData = RxList<File>();

  final loading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getPdf();
    await getBookFile();
    await createHistory();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() async {
    await updateHistory();
    super.onClose();
  }

  void increment() => count.value++;

  void nextButton() async {
    log("Next Press");
    if (fileIdDynamic.value >= fileData.length - 1) {
      QuickAlert.show(
          context: Get.context!,
          type: QuickAlertType.error,
          title: "Terjadi error",
          text: "Sudah tidak ada file berikutnya!");
    } else {
      fileIdDynamic.value += 1;
      await getDynamicFileData();
    }
  }

  Future<void> getBookFile() async {
    try {
      final response = await ApiProvider.instance().get(Endpoint.book,
          queryParameters: {"id": int.parse(bookId!)},
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        loading(false);
        final result = ResponseBookId.fromJson(response.data);
        fileData.value = result.data!.file!;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void prevButton() async {
    log("prev button");
    if (fileIdDynamic.value <= 0) {
      QuickAlert.show(
          context: Get.context!,
          type: QuickAlertType.error,
          title: "Terjadi error",
          text: "Sudah tidak ada file berikutnya!");
    } else {
      fileIdDynamic.value -= 1;
      await getDynamicFileData();
    }
  }

  Future<void> getDynamicFileData() async {
    loading(true);
    log(fileData[0].fileID.toString());
    log(fileIdDynamic.value.toString());
    try {
      final response = await ApiProvider.instance().get(Endpoint.file,
          queryParameters: {
            "id": fileData[fileIdDynamic.value].fileID.toString()
          },
          options: Options(headers: {"authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        final result = ResponseFileId.fromJson(response.data);
        pdfbase64.value = result.data!.file!;
        loading(false);
        log(response.toString());
      }
    } catch (e) {
      loading(false);
      log(e.toString());
    }
    loading(false);
  }

  Future<void> getPdf() async {
    try {
      loading(true);
      final token = StorageProvider.read(StorageKey.token);
      final response = await ApiProvider.instance().get(Endpoint.file,
          queryParameters: {"id": fileId.toString()},
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200 && response.data != null) {
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

  Future<void> createHistory() async {
    try {
      final decodedToken = await JwtConverter.jwtDecode(token);
      final userId = decodedToken["id"].toString();

      final checkHistory = await ApiProvider.instance().get(Endpoint.history,
          queryParameters: {"userid": userId},
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (checkHistory.statusCode == 200) {
        final dataHistory = ResponseHistoryId.fromJson(checkHistory.data!);

        if (dataHistory.total != 0) {
          final history = await ApiProvider.instance().patch(Endpoint.history,
              data: ({"status": "reading"}),
              queryParameters: {"userid": userId, "bukuid": bookId},
              options: Options(headers: {"authorization": "Bearer $token"}));

          if (history.statusCode == 200) {
            log("Success updating history");
          }
        } else {
          final history = await ApiProvider.instance().post(Endpoint.history,
              data: ({"userid": userId, "bukuid": bookId}),
              options: Options(headers: {"authorization": "Bearer $token"}));

          if (history.statusCode == 201) {
            log("Success adding history");
          }
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateHistory() async {
    try {
      final decodedToken = await JwtConverter.jwtDecode(token);
      final userId = decodedToken["id"].toString();

      final history = await ApiProvider.instance().patch(Endpoint.history,
          data: ({"status": "pause"}),
          queryParameters: {"userid": userId, "bukuid": bookId},
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (history.statusCode == 200) {
        log("Success updating history");
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
