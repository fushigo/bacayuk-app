import 'dart:developer';

import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/widget/viewers/widget_image_memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';

import '../controllers/ulasan_controller.dart';

class UlasanView extends GetView<UlasanController> {
  const UlasanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final heightBody =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final widthBody = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('${controller.judulBuku}'),
          centerTitle: true,
        ),
        body: Container(
          width: widthBody,
          height: heightBody,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Container(
                width: widthBody,
                height: heightBody * 0.3,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber.shade400,
                      ),
                      onRatingUpdate: (value) {
                        controller.getRating(value);
                      },
                    ),
                    SizedBox(
                      height: heightBody * 0.02,
                    ),
                    SizedBox(
                      width: widthBody,
                      height: 100,
                      child: TextFormField(
                        controller: controller.ulasanController,
                        textAlignVertical: TextAlignVertical.top,
                        style:
                            TextStyle(fontFamily: GlobalVariable.fontPoppins),
                        maxLines: 10,
                        decoration: const InputDecoration(
                            hintText: "Berikan ulasan anda",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Colors.black26))),
                      ),
                    ),
                    SizedBox(
                      height: heightBody * 0.03,
                    ),
                    Obx(() => controller.loadingButton.value == false
                        ? ElevatedButton(
                            onPressed: () {
                              controller.createUlasanBuku();
                            },
                            child: const Text("Kirim Ulasan"))
                        : const Center(
                            child: CircularProgressIndicator(),
                          ))
                  ],
                ),
              ),
              SizedBox(
                height: heightBody * 0.01,
              ),
              SizedBox(
                  width: widthBody,
                  height: heightBody * 0.6,
                  child: Obx(
                    () => controller.loading.value == false
                        ? ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: controller.dataUlasan.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: widthBody,
                                margin: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: widthBody,
                                      height: 70,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: controller.dataUlasan[index]
                                                        .user!.profile ==
                                                    null
                                                ? const ClipOval(
                                                    child: CircleAvatar(
                                                      child: Icon(Icons.person),
                                                    ),
                                                  )
                                                : ClipOval(
                                                    child: Image(
                                                        image: base64Image(
                                                            controller
                                                                .dataUlasan[
                                                                    index]
                                                                .user!
                                                                .profile!
                                                                .gambar
                                                                .toString())),
                                                  ),
                                          ),
                                          SizedBox(
                                            width: widthBody * 0.03,
                                          ),
                                          SizedBox(
                                            child: Text(
                                              controller.dataUlasan[index].user!
                                                  .username!,
                                              style: TextStyle(
                                                  fontFamily: GlobalVariable
                                                      .fontSignika,
                                                  fontSize:
                                                      GlobalVariable.heading_3,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: widthBody * 0.5,
                                      height: heightBody * 0.02,
                                      child: RatingBarIndicator(
                                        direction: Axis.horizontal,
                                        itemPadding: const EdgeInsets.all(0),
                                        itemSize: 20,
                                        rating: controller
                                            .dataUlasan[index].rating!
                                            .toDouble(),
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: Colors.blue.shade900,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: heightBody * 0.01,
                                    ),
                                    SizedBox(
                                      width: widthBody,
                                      child: Text(
                                        controller.dataUlasan[index].ulasan!,
                                        maxLines: 10,
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily:
                                                GlobalVariable.fontPoppins,
                                            fontSize: GlobalVariable.textmd),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                  ))
            ],
          ),
        ));
  }
}
