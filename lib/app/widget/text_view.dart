import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  const TextView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
              style: TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: "Selamat datang di "),
                TextSpan(
                    text: "Baca Yuk! \n",
                    style: TextStyle(color: Colors.blueAccent)),
                TextSpan(text: "Nikmati dunia literasi digital"),
              ]),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Jelajahi keajaiban literasi digital dan Temukan \n cerita tak terbatas di ujung jari anda. Selamat \n menikmati petualangan membaca!",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}
