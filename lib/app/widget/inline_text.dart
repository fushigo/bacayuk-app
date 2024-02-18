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
          style: const TextStyle(
            color: Colors.black,
            fontFamily: "Poppins",
            fontSize: 14,
          ),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              textButton,
              style: const TextStyle(
                  color: Colors.blueAccent,
                  fontFamily: "Poppins",
                  fontSize: 14),
            ))
      ],
    );
  }
}
