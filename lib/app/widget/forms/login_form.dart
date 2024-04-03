import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: TextFormField(
                maxLines: 1,
                maxLength: 30,
                cursorColor: Colors.blueAccent,
                controller: controller.emailController,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    counterText: "",
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue.shade700, width: 1)),
                    hintText: "example@gmail.com",
                    labelText: "Email",
                    floatingLabelStyle:
                        const TextStyle(color: Colors.blueAccent),
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Poppins",
                        fontSize: GlobalVariable.textmd),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey))),
              ),
            ),
            Obx(
              () => SizedBox(
                height: 45,
                child: TextFormField(
                  maxLength: 50,
                  maxLines: 1,
                  obscureText: controller.obsecureText.value,
                  cursorColor: Colors.blueAccent,
                  controller: controller.passwordController,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      counterText: "",
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.obsecureText.value =
                              !controller.obsecureText.value;
                        },
                        icon: Icon(
                          controller.obsecureText.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue.shade700, width: 1)),
                      hintText: "example123",
                      labelText: "Password",
                      floatingLabelStyle:
                          const TextStyle(color: Colors.blueAccent),
                      hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontFamily: "Poppins",
                          fontSize: 14),
                      border: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.grey))),
                ),
              ),
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
