import 'dart:convert';
import 'dart:developer';
import 'dart:io';

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
}
