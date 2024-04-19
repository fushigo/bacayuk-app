import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/routes/app_pages.dart';
import 'package:bacayuk/app/widget/viewers/widget_image_memory.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/book_management_controller.dart';

class BookManagementView extends GetView<BookManagementController> {
  const BookManagementView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final widthBody = MediaQuery.of(context).size.width;
    final heightBody = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return Scaffold(
        appBar: AppBar(
          title: const Text('BookManagementView'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton.small(
          onPressed: () => Get.toNamed(Routes.BOOK_ADD),
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
          child: Obx(
            () => controller.loading.value == false
                ? SingleChildScrollView(
                    child: Container(
                      width: widthBody,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: widthBody,
                            height: heightBody * 0.08,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromARGB(46, 95, 95, 95),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(0, 3),
                                        ),
                                      ]),
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller.dataBook.length.toString(),
                                        style: TextStyle(
                                            fontFamily:
                                                GlobalVariable.fontPoppins,
                                            fontSize: GlobalVariable.heading_2),
                                      ),
                                      Text("Total buku",
                                          style: TextStyle(
                                              fontFamily:
                                                  GlobalVariable.fontPoppins))
                                    ],
                                  ),
                                )),
                                Expanded(
                                    child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromARGB(46, 95, 95, 95),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(0, 3),
                                        ),
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("0",
                                          style: TextStyle(
                                              fontFamily:
                                                  GlobalVariable.fontPoppins,
                                              fontSize:
                                                  GlobalVariable.heading_2)),
                                      Text("Total Kategori",
                                          style: TextStyle(
                                              fontFamily:
                                                  GlobalVariable.fontPoppins))
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                          RefreshIndicator(
                            onRefresh: () async {
                              controller.getBuku();
                              controller.update();
                            },
                            child: Container(
                              padding: const EdgeInsets.only(top: 10),
                              width: widthBody,
                              height: heightBody * 0.6,
                              child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      trailing: SizedBox(
                                        width: 150,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Get.toNamed(Routes.BOOK_EDIT,
                                                      parameters: {
                                                        "id": controller
                                                            .dataBook[index]
                                                            .bukuID
                                                            .toString()
                                                      });
                                                },
                                                child: const Icon(
                                                  Icons.edit,
                                                )),
                                            ElevatedButton(
                                                onPressed: () {
                                                  controller.deleteBook(
                                                      controller.dataBook[index]
                                                          .bukuID);
                                                },
                                                child: const Icon(Icons.delete))
                                          ],
                                        ),
                                      ),
                                      title: Text(
                                        controller.dataBook[index].judul!,
                                        maxLines: 1,
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      leading: Image(
                                        image: base64Image(
                                            controller.dataBook[index].cover!),
                                        width: widthBody * 0.1,
                                        height: heightBody * 0.06,
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const Divider();
                                  },
                                  itemCount: controller.dataBook.length),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ));
  }
}
