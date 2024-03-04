import 'package:flutter/services.dart';

class GlobalVariable {
  static double heading_1 = 26;
  static double heading_2 = 24;
  static double heading_3 = 20;
  static double textbase = 12;
  static double textmd = 14;
  static double textlg = 16;
  static String fontPoppins = "Poppins";
}

class GlobalOrientation {
  static void orientationPotrait() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}
