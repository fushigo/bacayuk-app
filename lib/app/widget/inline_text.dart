import 'package:bacayuk/app/data/constant/global.dart';
import 'package:flutter/material.dart';

class InlineTextWidget extends StatelessWidget {
  const InlineTextWidget(
      {super.key,
      required this.text,
      required this.textButton,
      required this.onPressed});

  final String text;
  final String textButton;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Poppins",
            fontSize: GlobalVariable.textmd,
          ),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              textButton,
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontFamily: "Poppins",
                  fontSize: GlobalVariable.textmd),
            ))
      ],
    );
  }
}
