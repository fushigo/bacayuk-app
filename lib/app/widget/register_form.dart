import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/modules/register/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class RegisterForm extends GetView<RegisterController> {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
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
                maxLength: 16,
                cursorColor: Colors.blueAccent,
                controller: controller.usernameController,
                keyboardType: TextInputType.name,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    counterText: "",
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue.shade700, width: 1)),
                    hintText: "John Doe",
                    labelText: "Username",
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
            SizedBox(
              height: 50,
              child: TextFormField(
                maxLines: 1,
                maxLength: 30,
                cursorColor: Colors.blueAccent,
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    counterText: "",
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue.shade700, width: 1)),
                    hintText: "example@gmail.com",
                    labelText: "Email",
                    floatingLabelStyle:
                        const TextStyle(color: Colors.blueAccent),
                    hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontFamily: "Poppins",
                        fontSize: 14),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey))),
              ),
            ),
            Obx(
              () => SizedBox(
                height: 50,
                child: TextFormField(
                  maxLines: 1,
                  maxLength: 16,
                  obscureText: controller.obsecureText.value,
                  cursorColor: Colors.blueAccent,
                  keyboardType: TextInputType.visiblePassword,
                  controller: controller.passwordController,
                  textAlignVertical: TextAlignVertical.center,
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
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Poppins",
                          fontSize: GlobalVariable.textmd),
                      border: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.grey))),
                ),
              ),
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
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3)),
                        checkColor: Colors.white,
                        activeColor: Colors.blue.shade900,
                        value: controller.checkBoxValue.value,
                        onChanged: (value) {
                          value ?? true
                              ? controller.checkBoxValue.value = true
                              : controller.checkBoxValue.value = false;
                        },
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                          style: const TextStyle(color: Colors.black),
                          children: [
                            const TextSpan(text: "Agree with "),
                            TextSpan(
                                text: "Terms & Condition",
                                style: TextStyle(
                                    color: Colors.blue.shade900,
                                    fontFamily: "Poppins"))
                          ]),
                    )
                  ],
                ))),
          ],
        ),
      ),
    );
  }
}
