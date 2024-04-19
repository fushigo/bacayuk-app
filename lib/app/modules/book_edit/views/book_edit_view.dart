import 'dart:io';

import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/widget/viewers/primary_button.dart';
import 'package:bacayuk/app/widget/viewers/widget_image_memory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/book_edit_controller.dart';

class BookEditView extends GetView<BookEditController> {
  const BookEditView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final widthBody = MediaQuery.of(context).size.width;
    final heightBody = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit buku'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Container(
                alignment: Alignment.topCenter,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: widthBody,
                height: heightBody,
                child: Column(
                  children: [
                    SizedBox(
                      width: widthBody,
                      height: heightBody * 0.05,
                      child: TabBar(
                          controller: controller.tabbarController.value,
                          tabs: const [
                            Tab(
                              text: "Data",
                            ),
                            Tab(
                              text: "File",
                            ),
                          ]),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      width: widthBody,
                      height: heightBody * 0.8,
                      child: TabBarView(
                        controller: controller.tabbarController.value,
                        children: [
                          SizedBox(
                            width: widthBody,
                            height: heightBody * 0.5,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.getImage();
                                    },
                                    // child: Obx(
                                    //   () => controller.imagePath.value == ''
                                    //       ? Container(
                                    //           width: widthBody * 0.35,
                                    //           height: heightBody * 0.2,
                                    //           alignment: Alignment.center,
                                    //           decoration: BoxDecoration(
                                    //               border: Border.all(
                                    //                   color: Colors.black26, width: 1)),
                                    //           child: Text(
                                    //             "Cover",
                                    //             style: TextStyle(
                                    //                 fontFamily: GlobalVariable.fontPoppins),
                                    //           ),
                                    //         )
                                    //       : Container(
                                    //           width: widthBody * 0.35,
                                    //           height: heightBody * 0.2,
                                    //           decoration: BoxDecoration(
                                    //               border: Border.all(
                                    //                   color: Colors.black26, width: 1)),
                                    //           child: Image.file(File(controller.imagePath.value)),
                                    //         ),
                                    // ),
                                    child: Obx(() {
                                      if (controller.imagePath.value == '' &&
                                          controller.profilePict.value == "") {
                                        return Container(
                                            width: widthBody * 0.35,
                                            height: heightBody * 0.2,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black26,
                                                    width: 1)),
                                            child:
                                                const CircularProgressIndicator());
                                      } else if (controller.profilePict.value !=
                                              "" &&
                                          controller.imagePath.value == '') {
                                        return Container(
                                          width: widthBody * 0.35,
                                          height: heightBody * 0.2,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black26,
                                                  width: 1)),
                                          child: Image(
                                            image: base64Image(
                                                controller.profilePict.value),
                                          ),
                                        );
                                      } else {
                                        return Container(
                                          width: widthBody * 0.35,
                                          height: heightBody * 0.2,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black26,
                                                  width: 1)),
                                          child: Image.file(
                                              File(controller.imagePath.value)),
                                        );
                                      }
                                    }),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 60,
                                            child: TextFormField(
                                              controller:
                                                  controller.judulController,
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              maxLines: 1,
                                              decoration: InputDecoration(
                                                  counterText: "",
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .blue
                                                                      .shade700,
                                                                  width: 1)),
                                                  hintText: "Bahasa Indonesia",
                                                  labelText: "Judul buku",
                                                  floatingLabelStyle:
                                                      const TextStyle(
                                                          color:
                                                              Colors
                                                                  .blueAccent),
                                                  hintStyle:
                                                      TextStyle(
                                                          color: Colors.grey,
                                                          fontFamily: "Poppins",
                                                          fontSize:
                                                              GlobalVariable
                                                                  .textmd),
                                                  border:
                                                      const OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .grey))),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 60,
                                            child: TextFormField(
                                              controller:
                                                  controller.sinopsisController,
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              maxLines: 1,
                                              decoration: InputDecoration(
                                                  counterText: "",
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .blue
                                                                      .shade700,
                                                                  width: 1)),
                                                  hintText: "Bahasa Indonesia",
                                                  labelText: "Sinopsis",
                                                  floatingLabelStyle:
                                                      const TextStyle(
                                                          color:
                                                              Colors
                                                                  .blueAccent),
                                                  hintStyle:
                                                      TextStyle(
                                                          color: Colors.grey,
                                                          fontFamily: "Poppins",
                                                          fontSize:
                                                              GlobalVariable
                                                                  .textmd),
                                                  border:
                                                      const OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .grey))),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 60,
                                            child: TextFormField(
                                              controller:
                                                  controller.penulisController,
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              maxLines: 1,
                                              decoration: InputDecoration(
                                                  counterText: "",
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .blue
                                                                      .shade700,
                                                                  width: 1)),
                                                  hintText: "Fugodev",
                                                  labelText: "Penulis",
                                                  floatingLabelStyle:
                                                      const TextStyle(
                                                          color:
                                                              Colors
                                                                  .blueAccent),
                                                  hintStyle:
                                                      TextStyle(
                                                          color: Colors.grey,
                                                          fontFamily: "Poppins",
                                                          fontSize:
                                                              GlobalVariable
                                                                  .textmd),
                                                  border:
                                                      const OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .grey))),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 60,
                                            child: TextFormField(
                                              controller:
                                                  controller.penerbitController,
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              maxLines: 1,
                                              decoration: InputDecoration(
                                                  counterText: "",
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .blue
                                                                      .shade700,
                                                                  width: 1)),
                                                  hintText: "Fugodev",
                                                  labelText: "Penerbit",
                                                  floatingLabelStyle:
                                                      const TextStyle(
                                                          color:
                                                              Colors
                                                                  .blueAccent),
                                                  hintStyle:
                                                      TextStyle(
                                                          color: Colors.grey,
                                                          fontFamily: "Poppins",
                                                          fontSize:
                                                              GlobalVariable
                                                                  .textmd),
                                                  border:
                                                      const OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .grey))),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 60,
                                            child: TextFormField(
                                              controller: controller
                                                  .tahunTerbitController,
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              maxLines: 1,
                                              decoration: InputDecoration(
                                                  counterText: "",
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .blue
                                                                      .shade700,
                                                                  width: 1)),
                                                  hintText: "2016",
                                                  labelText: "Tahun terbit",
                                                  floatingLabelStyle:
                                                      const TextStyle(
                                                          color:
                                                              Colors
                                                                  .blueAccent),
                                                  hintStyle:
                                                      TextStyle(
                                                          color: Colors.grey,
                                                          fontFamily: "Poppins",
                                                          fontSize:
                                                              GlobalVariable
                                                                  .textmd),
                                                  border:
                                                      const OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .grey))),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: heightBody * 0.04,
                                  ),
                                  Obx(() => controller.loadingButton.value
                                      ? const CircularProgressIndicator()
                                      : ButtonWidget(
                                          text: "Update",
                                          onPressed: () {
                                            controller.updateBook();
                                          },
                                          horizontal: widthBody * 0.3,
                                          vertical: heightBody * 0.015)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: widthBody,
                            height: heightBody,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Obx(
                                    () => controller.fileLoading.value == false
                                        ? SizedBox(
                                            width: widthBody,
                                            height: heightBody * 0.4,
                                            child: ListView.separated(
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    color: Colors.black12,
                                                    child: ListTile(
                                                      title: Text(controller
                                                          .dataFile[index]
                                                          .nama!),
                                                      trailing: SizedBox(
                                                        width: widthBody * 0.35,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            ElevatedButton(
                                                                style: const ButtonStyle(
                                                                    padding: MaterialStatePropertyAll(
                                                                        EdgeInsets.all(
                                                                            1))),
                                                                onPressed:
                                                                    () {},
                                                                child: const Icon(
                                                                    Icons
                                                                        .edit)),
                                                            ElevatedButton(
                                                                style: const ButtonStyle(
                                                                    padding: MaterialStatePropertyAll(
                                                                        EdgeInsets.all(
                                                                            1))),
                                                                onPressed: () {
                                                                  controller.deleteFile(controller
                                                                      .dataFile[
                                                                          index]
                                                                      .fileID!);
                                                                },
                                                                child: const Icon(
                                                                    Icons
                                                                        .delete))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                separatorBuilder:
                                                    (context, index) {
                                                  return const Divider();
                                                },
                                                itemCount:
                                                    controller.dataFile.length),
                                          )
                                        : const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                  ),
                                  SizedBox(
                                    height: heightBody * 0.02,
                                  ),
                                  Text(
                                    "Form File",
                                    style: TextStyle(
                                        fontSize: GlobalVariable.heading_3,
                                        fontFamily: GlobalVariable.fontPoppins),
                                  ),
                                  SizedBox(
                                    height: heightBody * 0.02,
                                  ),
                                  SizedBox(
                                    width: widthBody,
                                    height: 150,
                                    child: Form(
                                      key: controller.formKeyFile,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 60,
                                            child: TextFormField(
                                              controller:
                                                  controller.namaFileController,
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              maxLines: 1,
                                              decoration: InputDecoration(
                                                  counterText: "",
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .blue
                                                                      .shade700,
                                                                  width: 1)),
                                                  hintText: "BAB I",
                                                  labelText: "Nama file",
                                                  floatingLabelStyle:
                                                      const TextStyle(
                                                          color:
                                                              Colors
                                                                  .blueAccent),
                                                  hintStyle:
                                                      TextStyle(
                                                          color: Colors.grey,
                                                          fontFamily: "Poppins",
                                                          fontSize:
                                                              GlobalVariable
                                                                  .textmd),
                                                  border:
                                                      const OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .grey))),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 60,
                                            child: TextFormField(
                                              onTap: () {
                                                controller.pickFile();
                                              },
                                              readOnly: true,
                                              controller: controller
                                                  .filePickNameController,
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              maxLines: 1,
                                              decoration: InputDecoration(
                                                  counterText: "",
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .blue
                                                                      .shade700,
                                                                  width: 1)),
                                                  hintText: "Tidak ada file",
                                                  floatingLabelStyle:
                                                      const TextStyle(
                                                          color:
                                                              Colors
                                                                  .blueAccent),
                                                  hintStyle:
                                                      TextStyle(
                                                          color: Colors.grey,
                                                          fontFamily: "Poppins",
                                                          fontSize:
                                                              GlobalVariable
                                                                  .textmd),
                                                  border:
                                                      const OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .grey))),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: heightBody * 0.07,
                                  ),
                                  Obx(() => controller.loadingButton.value
                                      ? const CircularProgressIndicator()
                                      : ButtonWidget(
                                          text: "Send file",
                                          onPressed: () {
                                            controller.sendFile();
                                          },
                                          horizontal: widthBody * 0.3,
                                          vertical: heightBody * 0.015)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))));
  }
}
