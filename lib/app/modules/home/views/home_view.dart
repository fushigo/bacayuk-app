import 'dart:typed_data';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/modules/home/controllers/home_controller.dart';
import 'package:bacayuk/app/widget/widget_profile.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthBody = MediaQuery.of(context).size.width;
    final heightBody = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    GlobalOrientation.orientationPotrait();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: widthBody,
            height: heightBody,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                WidgetProfile(widthBody: widthBody, heightBody: heightBody),
                SizedBox(height: heightBody * 0.03),
                SizedBox(
                  width: widthBody,
                    child: CarouselSlider(
                  options: CarouselOptions(
                      height: 300.0,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      aspectRatio: 4.0,
                      initialPage: 1,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      scrollDirection: Axis.horizontal,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800)),
                  items: [1, 2, 3].map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return SizedBox(
                            width: widthBody,
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                      "asset/image/banner_${item.toString()}.png", fit: BoxFit.fill,)),
                            ));
                      },
                    );
                  }).toList(),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
