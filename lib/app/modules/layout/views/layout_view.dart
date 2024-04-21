import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/modules/book/views/book_view.dart';
import 'package:bacayuk/app/modules/collection/views/collection_view.dart';
import 'package:bacayuk/app/modules/dashboard/views/dashboard_view.dart';
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
    return Scaffold(
        body: Obx(
          () => PageView(
            controller: controller.pageController.value,
            onPageChanged: (value) {
              controller.tabIndex.value = value;
            },
            children: [
              const HomeView(),
              const BookView(),
              const CollectionView(),
              const HistoryView(),
              const ProfileView(),
              if (controller.role.value == "admin" ||
                  controller.role.value == "petugas")
                const DashboardView()
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
              items: [
                const BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Beranda"),
                const BottomNavigationBarItem(
                    icon: Icon(
                      Icons.menu_book_rounded,
                    ),
                    label: "Buku"),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.bookmark_add_sharp), label: "Koleksi"),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.access_time_outlined), label: "Riwayat"),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile"),
                if (controller.role.value == "admin" ||
                    controller.role.value == "petugas")
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.dashboard_outlined), label: "Dashboard")
              ],
            ),
          ),
        ));
  }
}
