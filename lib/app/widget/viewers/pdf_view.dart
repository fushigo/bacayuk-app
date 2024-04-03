import 'dart:convert';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

SfPdfViewer pdfViewer(String base64String) {
  while (base64String.length % 4 != 0) {
    base64String += '=';
  }

  return SfPdfViewer.memory(base64Decode(base64String));
}
