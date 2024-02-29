import 'package:flutter/material.dart';

class ThirdAuth extends StatelessWidget {
  const ThirdAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 204, 204, 204),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(0, 4))
              ],
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset("asset/image/facebook.png"),
            // const Text(
            //   "Facebook",
            //   style: TextStyle(fontFamily: "Poppins"),
            // )
          ]),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 204, 204, 204),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(0, 4))
              ],
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset("asset/image/google.png"),
            // const Text(
            //   "Facebook",
            //   style: TextStyle(fontFamily: "Poppins"),
            // )
          ]),
        )
      ],
    );
  }
}
