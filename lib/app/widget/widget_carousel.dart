import 'package:bacayuk/app/modules/home/controllers/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetCarousel extends GetView<HomeController> {
  const WidgetCarousel(
      {super.key, required this.widthBody, required this.heightBody});

  final double widthBody;
  final double heightBody;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widthBody,
        child: CarouselSlider(
          options: CarouselOptions(
              height: heightBody * 0.3,
              enlargeCenterPage: true,
              viewportFraction: 1,
              aspectRatio: 4.0,
              initialPage: 1,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              scrollDirection: Axis.horizontal,
              autoPlayAnimationDuration: const Duration(milliseconds: 800)),
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
                            "asset/image/banner_${item.toString()}.png",
                            fit: BoxFit.fill,
                          )),
                    ));
              },
            );
          }).toList(),
        ));
  }
}
