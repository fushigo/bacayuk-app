import 'package:bacayuk/app/data/constant/global.dart';
import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  TextView(
      {super.key, required this.widthContent, required this.heightContent});
  final widthContent;
  final heightContent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthContent,
      height: heightContent,
      child: FittedBox(
        child: Column(
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: TextStyle(
                      fontFamily: "Poppins",
                      color: Colors.black,
                      fontSize: GlobalVariable.heading_3,
                      fontWeight: FontWeight.bold),
                  children: const [
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
            Text(
              "Jelajahi keajaiban literasi digital dan Temukan \n cerita tak terbatas di ujung jari anda. Selamat \n menikmati petualangan membaca!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: GlobalVariable.textbase,
                  fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}
