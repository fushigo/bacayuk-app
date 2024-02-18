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
          backgroundColor: Colors.blue,
          padding:
              EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical)),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontFamily: "Poppins", fontSize: 14),
      ),
    );
  }
}
