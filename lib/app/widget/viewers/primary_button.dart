import 'package:auto_size_text/auto_size_text.dart';
import 'package:bacayuk/app/data/constant/global.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.horizontal,
      required this.vertical});

  final double horizontal;
  final double vertical;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade900,
          padding:
              EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical)),
      onPressed: onPressed,
      child: AutoSizeText(
        text,
        minFontSize: GlobalVariable.textbase,
        style: TextStyle(
            color: Colors.white,
            fontFamily: GlobalVariable.fontPoppins,
            fontSize: GlobalVariable.textlg),
      ),
    );
  }
}
