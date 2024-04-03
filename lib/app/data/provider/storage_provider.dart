import 'package:get_storage/get_storage.dart';

class StorageProvider {
  static write(key, String value) async {
    await GetStorage().write(key, value);
  }

  static String read(key) {
    try {
      return GetStorage().read(key);
    } catch (e) {
      return "";
    }
  }

  static void clearAll() {
    GetStorage().erase();
  }
}

class StorageKey {
  static const String status = "status";
  static const String authtoken = "authtoken";
  static const String token = "token";
  static const String profileStatus = "profileStatus";
  static const String userId = "userId";
  static const String pinjamtoken = "pinjamtoken";
}

// class StorageProvider {
//   static final _box = GetStorage();

//   static Future<void> write(String key, String value) async {
//     await _box.write(key, value);
//   }

//   static String read(String key) {
//     return _box.read(key) ?? "";
//   }

//   static void clearAll() {
//     _box.erase();
//   }
// }

// class StorageKey {
//   static const String status = "status";
//   static const String authtoken = "authtoken";
//   static const String token = "token";
// }
