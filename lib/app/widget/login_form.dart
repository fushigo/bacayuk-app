import 'package:bacayuk/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
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
                  "Email",
                  textAlign: TextAlign.start,
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
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    "Forgot password?",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Colors.blue.shade800, fontFamily: "Poppins"),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
