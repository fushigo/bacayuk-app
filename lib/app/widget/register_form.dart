import 'package:bacayuk/app/modules/register/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class RegisterForm extends GetView<RegisterController> {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Username",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: "Poppins"
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 45,
                  child: TextFormField(
                    cursorColor: Colors.blueAccent,
                    controller: controller.usernameController,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blue.shade700, width: 1)),
                        hintText: "John Doe",
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: "Poppins",
                            fontSize: 14),
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey))),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Email",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: "Poppins"
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 45,
                  child: TextFormField(
                    cursorColor: Colors.blueAccent,
                    controller: controller.emailController,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blue.shade700, width: 1)),
                        hintText: "example@gmail.com",
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: "Poppins",
                            fontSize: 14),
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey))),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Password",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: "Poppins"
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 45,
                  child: TextFormField(
                    obscureText: true,
                    cursorColor: Colors.blueAccent,
                    controller: controller.passwordController,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blue.shade700, width: 1)),
                        hintText: "example123",
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: "Poppins",
                            fontSize: 14),
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey))),
                  ),
                ),
              ],
            ),
            Obx(() => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                        checkColor: Colors.white,
                        activeColor: Colors.blue.shade900,
                        value: controller.checkBoxValue.value,
                        onChanged: (value) {
                          value ?? true ? controller.checkBoxValue.value = true : controller.checkBoxValue.value = false;
                        },
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: [
                          const TextSpan(text: "Agree with "),
                          TextSpan(text: "Terms & Condition", style: TextStyle(
                            color: Colors.blue.shade900,
                            fontFamily: "Poppins"
                          ))
                        ]
                      ),
                    )
                  ],
                ) 
            )
            ),
          ],
        ),
      ),
    );
  }
}
