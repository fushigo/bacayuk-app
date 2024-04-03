import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/modules/completed_profile/controllers/completed_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletedProfileForm extends GetView<CompletedProfileController> {
  const CompletedProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
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
                controller: controller.namalengkapController,
                keyboardType: TextInputType.name,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    counterText: "",
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue.shade700, width: 1)),
                    hintText: "John Doe",
                    labelText: "Full name",
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
                cursorColor: Colors.blueAccent,
                controller: controller.bioController,
                keyboardType: TextInputType.text,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue.shade700, width: 1)),
                    hintText: "bersama bacayuk hari lebih menyenangkan",
                    labelText: "Bio",
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
            SizedBox(
              height: 50,
              child: TextFormField(
                readOnly: true,
                maxLines: 1,
                maxLength: 10,
                cursorColor: Colors.blueAccent,
                controller: controller.tanggallahirController,
                onTap: () {
                  controller.selectDate();
                },
                keyboardType: TextInputType.datetime,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    counterText: "",
                    prefixIcon: const Icon(Icons.calendar_today),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue.shade700, width: 1)),
                    labelText: "Birthday",
                    hintText: "Date",
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
            SizedBox(
              height: 60,
              child: DropdownButtonFormField<String>(
                style: TextStyle(
                    fontFamily: GlobalVariable.fontPoppins,
                    fontSize: GlobalVariable.textlg,
                    color: Colors.black),
                value: controller.selectedItem,
                onChanged: (String? newValue) {
                  controller.selectedItem = newValue!;
                  controller.check();
                },
                items: <String>['Male', 'Female', 'Other']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: "Gender",
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue.shade700, width: 1)),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                    borderRadius:
                        BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: TextFormField(
                maxLines: 1,
                cursorColor: Colors.blueAccent,
                controller: controller.alamatController,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue.shade700, width: 1)),
                    hintText: "Jl.Samudera Pasai No.49",
                    labelText: "Address",
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
          ],
        ),
      ),
    );
  }
}
