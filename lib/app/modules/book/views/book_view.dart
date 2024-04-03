import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/modules/book/controllers/book_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final widthBody = MediaQuery.of(context).size.width;
    final heightBody = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: widthBody,
        height: heightBody,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: widthBody,
                child: TabBar(
                  padding: const EdgeInsets.all(0),
                  indicator: const BoxDecoration(),
                  controller: controller.tabController,
                  tabs: [
                    Tab(
                      child: Text(
                        "Komik",
                        style: TextStyle(
                            fontFamily: GlobalVariable.fontSignika,
                            fontSize: GlobalVariable.textlg),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Novel",
                        style: TextStyle(
                            fontFamily: GlobalVariable.fontSignika,
                            fontSize: GlobalVariable.textlg),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Pendidikan",
                        style: TextStyle(
                            fontFamily: GlobalVariable.fontSignika,
                            fontSize: GlobalVariable.textlg),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: widthBody,
                height: heightBody,
                padding:
                    const EdgeInsets.all(0),
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    Container(
                        width: widthBody,
                        height: heightBody,
                        alignment: Alignment.topCenter,
                        child: Obx(() => controller.dataGenreBuku.isNotEmpty ? Column(
                          children: [
                            TabBar(
                                padding: const EdgeInsets.all(0),
                                controller: controller.tabGenreController.value,
                                tabs: controller.dataGenreBuku
                                    .map((dataGenre) => Tab(
                                  child: Text(dataGenre.nama!),
                                ))
                                    .toList()),
                            Container(
                                width: widthBody,
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: TabBarView(
                                    controller: controller.tabGenreController.value,
                                    children: controller.dataGenreBuku
                                        .map((data) => SizedBox(
                                      width: widthBody,
                                      height: 300,
                                      child: Text(data.nama!),
                                    ))
                                        .toList())
                            )
                          ],
                        ): const CircularProgressIndicator())),
                    Container(
                      color: Colors.red,
                    ),
                    Container(
                      color: Colors.green,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
