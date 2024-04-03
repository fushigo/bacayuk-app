import 'package:bacayuk/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends GetView<HomeController> {
  const ShimmerWidget(this.widthBody, this.heightBody, {super.key});

  final double widthBody;
  final double heightBody;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 4 / 7,
        children: List.generate(
            6,
            (index) => SizedBox(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 170,
                          width: widthBody * 0.5,
                          color: Colors.grey, // Placeholder color
                        ),
                      ),
                      SizedBox(
                        height: heightBody * 0.02,
                      ),
                      Container(
                        height: 16,
                        width: widthBody * 0.5,
                        color: Colors.grey, // Placeholder color
                      ),
                    ],
                  ),
                )),
      ),
    );
  }
}
