import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/modules/book/views/book_view.dart';
import 'package:bacayuk/app/modules/collection/views/collection_view.dart';
import 'package:bacayuk/app/modules/history/views/history_view.dart';
import 'package:bacayuk/app/modules/home/views/home_view.dart';
import 'package:bacayuk/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/layout_controller.dart';

class LayoutView extends GetView<LayoutController> {
  const LayoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final widthBody = MediaQuery.of(context).size.width;
    // final heightBody = MediaQuery.of(context).size.height -
    //     MediaQuery.of(context).padding.top -
    //     MediaQuery.of(context).padding.bottom;
    // final LayoutController layoutController =
    //     Get.put(LayoutController(), permanent: false);
    return Scaffold(
        body: Obx(
          () => PageView(
            controller: controller.pageController.value,
            onPageChanged: (value) {
              controller.tabIndex.value = value;
            },
            children: const [
              HomeView(),
              BookView(),
              CollectionView(),
              HistoryView(),
              ProfileView()
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color.fromARGB(47, 0, 0, 0),
                spreadRadius: 1,
                blurRadius: 30,
                offset: Offset(0, 3),
              ),
            ]),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              currentIndex: controller.tabIndex.value,
              selectedItemColor: Colors.blueAccent,
              onTap: (value) {
                controller.changeTabIndex(value);
              },
              unselectedItemColor: Colors.black38,
              selectedLabelStyle: TextStyle(
                  fontFamily: GlobalVariable.fontSignika,
                  fontWeight: FontWeight.bold),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Beranda"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.menu_book_rounded,
                    ),
                    label: "Buku"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bookmark_add_sharp), label: "Koleksi"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.access_time_outlined), label: "Riwayat"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile")
              ],
            ),
          ),
        )
        // bottomNavigationBar: Obx(() => Container(
        //       decoration: const BoxDecoration(boxShadow: [
        //         BoxShadow(
        //           color: Color.fromARGB(47, 0, 0, 0),
        //           spreadRadius: 1,
        //           blurRadius: 30,
        //           offset: Offset(0, 3),
        //         ),
        //       ]),
        //       padding: const EdgeInsets.only(top: 30),
        //       child: CurvedNavigationBar(
        //         animationCurve: Curves.easeInOut,
        //         animationDuration: const Duration(milliseconds: 200),
        //         height: heightBody * 0.065,
        //         index: controller.tabIndex.value,
        //         backgroundColor: Colors.transparent,
        //         buttonBackgroundColor: GlobalVariable.primary,
        //         color: Colors.blue.shade900,
        //         onTap: (value) {
        //           log("Nav index: ${value.toString()}");
        //           controller.changeTabIndex(value);
        //         },
        // items: const [
        //   Padding(
        //     padding: EdgeInsets.all(8.0),
        //     child: Icon(
        //       Icons.home_filled,
        //       size: 25,
        //       color: Colors.white,
        //     ),
        //   ),
        //   Padding(
        //     padding: EdgeInsets.all(8.0),
        //     child: Icon(
        //       Icons.menu_book_rounded,
        //       size: 25,
        //       color: Colors.white,
        //     ),
        //   ),
        //   Padding(
        //     padding: EdgeInsets.all(8.0),
        //     child: Icon(
        //       Icons.bookmark_add_sharp,
        //       size: 25,
        //       color: Colors.white,
        //     ),
        //   ),
        //   Padding(
        //     padding: EdgeInsets.all(8.0),
        //     child: Icon(
        //       Icons.access_time_outlined,
        //       size: 25,
        //       color: Colors.white,
        //     ),
        //   ),
        //   Padding(
        //     padding: EdgeInsets.all(8.0),
        //     child: Icon(
        //       Icons.person,
        //       size: 25,
        //       color: Colors.white,
        //     ),
        //   )
        // ],
        //       ),
        //     ))
        );
  }
}
