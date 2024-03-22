import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

class ImageConvert {
  static Future<String?> imageToBase64(String imagePath) async {
    try {
      File imageFile = File(imagePath);
      List<int> imageBytes = await imageFile.readAsBytes();

      String base64Image = base64Encode(imageBytes);
      return base64Image;
    } catch (e) {
      log("Error converting image to base64: $e");
      return null;
    }
  }

  static base64ToImage(String base64) async {
    try {
      while(base64.length % 4 != 0){
        base64 += '=';
      }
      Uint8List bytes = base64Decode(base64);
      return bytes;
    } catch(e) {
      log('Error ketika konversi base64 ke image: $e');
      return null;
    }
  }
}
