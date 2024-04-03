import 'dart:convert';

import 'package:flutter/material.dart';

ImageProvider base64Image(String base64String){
  while (base64String.length % 4 != 0){
    base64String += '=';
  }

  return MemoryImage(base64Decode(base64String));
}