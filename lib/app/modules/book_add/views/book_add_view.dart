import 'dart:io';

import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/widget/viewers/primary_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/book_add_controller.dart';

class BookAddView extends GetView<BookAddController> {
  const BookAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final widthBody = MediaQuery.of(context).size.width;
    final heightBody = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tambah Buku'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: widthBody,
          height: heightBody,
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    controller.getImage();
                  },
                  child: Obx(
                    () => controller.imagePath.value == ''
                        ? Container(
                            width: widthBody * 0.35,
                            height: heightBody * 0.2,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black26, width: 1)),
                            child: Text(
                              "Cover",
                              style: TextStyle(
                                  fontFamily: GlobalVariable.fontPoppins),
                            ),
                          )
                        : Container(
                            width: widthBody * 0.35,
                            height: heightBody * 0.2,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black26, width: 1)),
                            child: Image.file(File(controller.imagePath.value)),
                          ),
                  ),
                ),
                SizedBox(
                  height: heightBody * 0.03,
                ),
                SizedBox(
                  width: widthBody,
                  height: 400,
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60,
                          child: TextFormField(
                            controller: controller.judulController,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                            decoration: InputDecoration(
                                counterText: "",
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue.shade700, width: 1)),
                                hintText: "Bahasa Indonesia",
                                labelText: "Judul buku",
                                floatingLabelStyle:
                                    const TextStyle(color: Colors.blueAccent),
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: "Poppins",
                                    fontSize: GlobalVariable.textmd),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey))),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          child: TextFormField(
                            controller: controller.sinopsisController,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                            decoration: InputDecoration(
                                counterText: "",
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue.shade700, width: 1)),
                                hintText: "Bahasa Indonesia",
                                labelText: "Sinopsis",
                                floatingLabelStyle:
                                    const TextStyle(color: Colors.blueAccent),
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: "Poppins",
                                    fontSize: GlobalVariable.textmd),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey))),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          child: TextFormField(
                            controller: controller.penulisController,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                            decoration: InputDecoration(
                                counterText: "",
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue.shade700, width: 1)),
                                hintText: "Fugodev",
                                labelText: "Penulis",
                                floatingLabelStyle:
                                    const TextStyle(color: Colors.blueAccent),
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: "Poppins",
                                    fontSize: GlobalVariable.textmd),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey))),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          child: TextFormField(
                            controller: controller.penerbitController,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                            decoration: InputDecoration(
                                counterText: "",
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue.shade700, width: 1)),
                                hintText: "Fugodev",
                                labelText: "Penerbit",
                                floatingLabelStyle:
                                    const TextStyle(color: Colors.blueAccent),
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: "Poppins",
                                    fontSize: GlobalVariable.textmd),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey))),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          child: TextFormField(
                            controller: controller.tahunTerbitController,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                            decoration: InputDecoration(
                                counterText: "",
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue.shade700, width: 1)),
                                hintText: "2016",
                                labelText: "Tahun terbit",
                                floatingLabelStyle:
                                    const TextStyle(color: Colors.blueAccent),
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: "Poppins",
                                    fontSize: GlobalVariable.textmd),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey))),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: heightBody * 0.05,
                ),
                Obx(() => controller.loading.value == false
                    ? ButtonWidget(
                        text: "Create",
                        onPressed: () {
                          controller.createBook();
                        },
                        horizontal: widthBody * 0.3,
                        vertical: heightBody * 0.015)
                    : const CircularProgressIndicator())
              ],
            ),
          ),
        )));
  }
}
