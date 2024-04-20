import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/modules/otp/controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpForm extends GetView<OtpController> {
  const OtpForm(
      {super.key,
      required this.textEditingController,
      required this.first,
      required this.last, required this.widthContent, required this.heightContent});

  final bool first;
  final bool last;
  final double widthContent;
  final double heightContent;

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightContent,
      width: widthContent,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        cursorHeight: 30,
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(
              borderSide: const BorderSide(width: 2),
              borderRadius: BorderRadius.circular(10)),
        ),
        autofocus: true,
        maxLength: 1,
        keyboardType: TextInputType.number,
        style: TextStyle(
            fontFamily: "Poppins",
            fontSize: GlobalVariable.heading_2,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
        controller: textEditingController,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
          if (value.length == 1 && last == true) {
            controller.maxValue.value = !controller.maxValue.value;
          }
        },
      ),
    );
  }
}
