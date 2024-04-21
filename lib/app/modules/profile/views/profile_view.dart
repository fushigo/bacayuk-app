import 'package:bacayuk/app/data/constant/global.dart';
import 'package:bacayuk/app/widget/viewers/widget_image_memory.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final widthBody = MediaQuery.of(context).size.width;
    final heightBody = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return Scaffold(
        body: SafeArea(
      child: Container(
          width: widthBody,
          height: heightBody,
          color: Colors.grey.shade100,
          padding: const EdgeInsets.all(15),
          child: Obx(
            () => controller.loading.value == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: widthBody,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // border:
                              //     Border.all(width: 1, color: Colors.black12),
                              color: Colors.white),
                          child: Column(
                            children: [
                              SizedBox(
                                width: widthBody,
                                height: heightBody * 0.17,
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Container(
                                      width: widthBody,
                                      height: heightBody * 0.12,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.blue.shade800),
                                    ),
                                    Positioned(
                                      top: heightBody * 0.07,
                                      child: Container(
                                        width: 90,
                                        height: 90,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 3, color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: ClipOval(
                                          child: controller.dataUserProfile
                                                      .value.profile ==
                                                  null
                                              ? const CircleAvatar(
                                                  child: Icon(Icons.person))
                                              : Image(
                                                  image: base64Image(controller
                                                      .dataUserProfile
                                                      .value
                                                      .profile!
                                                      .gambar!),
                                                ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: widthBody,
                                height: heightBody * 0.1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "@${controller.dataUserProfile.value.username}",
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily:
                                              GlobalVariable.fontPoppins,
                                          fontSize: GlobalVariable.textmd,
                                          color: Colors.black38),
                                    ),
                                    SizedBox(
                                      height: heightBody * 0.01,
                                    ),
                                    Text(
                                      controller
                                          .dataUserProfile.value.namaLengkap
                                          .toString(),
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily:
                                              GlobalVariable.fontPoppins,
                                          fontSize: GlobalVariable.heading_3,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: heightBody * 0.01,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller
                                              .dataUserProfile.value.role!,
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily:
                                                  GlobalVariable.fontPoppins,
                                              fontSize: GlobalVariable.textmd,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue.shade800),
                                        ),
                                        SizedBox(
                                          width: widthBody * 0.03,
                                        ),
                                        const Text(
                                          "|",
                                          style:
                                              TextStyle(color: Colors.black12),
                                        ),
                                        SizedBox(
                                          width: widthBody * 0.03,
                                        ),
                                        Text(
                                          "Joined ${DateFormat('MMMM yyyy').format(DateTime.parse(controller.dataUserProfile.value.createdAt!))}",
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily:
                                                  GlobalVariable.fontPoppins,
                                              fontSize: GlobalVariable.textmd,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black26),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: heightBody * 0.02,
                              ),
                              SizedBox(
                                width: widthBody,
                                height: heightBody * 0.05,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: widthBody * 0.35,
                                        alignment: Alignment.center,
                                        height: 40,
                                        child: ElevatedButton.icon(
                                          style: ButtonStyle(
                                            iconColor:
                                                MaterialStateProperty.all(
                                                    Colors.black),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.white),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              side: const BorderSide(
                                                  color: Colors
                                                      .black12), // Menambahkan border abu
                                            )),
                                          ),
                                          onPressed: () {},
                                          icon: const Icon(Icons.settings),
                                          label: const Text(
                                            "Edit Profile",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        )),
                                    Container(
                                        width: widthBody * 0.3,
                                        alignment: Alignment.center,
                                        height: 40,
                                        child: ElevatedButton.icon(
                                          style: ButtonStyle(
                                            iconColor:
                                                MaterialStateProperty.all(
                                                    Colors.red),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.white),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              side: const BorderSide(
                                                  color: Colors
                                                      .black12), // Menambahkan border abu
                                            )),
                                          ),
                                          onPressed: () {},
                                          icon: const Icon(Icons.logout),
                                          label: const Text(
                                            "Logout",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: heightBody * 0.02,
                              ),
                              Container(
                                width: widthBody,
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.topCenter,
                                child: Text(
                                  maxLines: 5,
                                  controller.dataUserProfile.value.profile !=
                                          null
                                      ? controller
                                          .dataUserProfile.value.profile!.bio
                                          .toString()
                                      : "No bio yet!",
                                  style: TextStyle(
                                      fontFamily: GlobalVariable.fontPoppins,
                                      fontSize: GlobalVariable.textmd,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: heightBody * 0.02,
                        ),
                        Container(
                          width: widthBody,
                          height: heightBody * 0.25,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // border:
                              //     Border.all(width: 1, color: Colors.black12),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Information",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: GlobalVariable.fontPoppins,
                                    fontSize: GlobalVariable.heading_3,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: heightBody * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          Icons.email_outlined,
                                          color: Colors.black45,
                                        ),
                                        SizedBox(
                                          width: widthBody * 0.03,
                                        ),
                                        Text(
                                          "Email",
                                          style: TextStyle(
                                              fontFamily:
                                                  GlobalVariable.fontPoppins,
                                              color: Colors.black38,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Text(
                                    controller.dataUserProfile.value.email!,
                                    style: TextStyle(
                                        fontFamily: GlobalVariable.fontPoppins,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: heightBody * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          Icons.location_on_outlined,
                                          color: Colors.black45,
                                        ),
                                        SizedBox(
                                          width: widthBody * 0.03,
                                        ),
                                        Text(
                                          "Alamat",
                                          style: TextStyle(
                                              fontFamily:
                                                  GlobalVariable.fontPoppins,
                                              color: Colors.black38,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Text(
                                    controller.dataUserProfile.value.alamat!,
                                    style: TextStyle(
                                        fontFamily: GlobalVariable.fontPoppins,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: heightBody * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          Icons.calendar_month_outlined,
                                          color: Colors.black45,
                                        ),
                                        SizedBox(
                                          width: widthBody * 0.03,
                                        ),
                                        Text(
                                          "Tanggal lahir",
                                          style: TextStyle(
                                              fontFamily:
                                                  GlobalVariable.fontPoppins,
                                              color: Colors.black38,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Text(
                                    controller.dataUserProfile.value.profile !=
                                            null
                                        ? "Joined ${DateFormat('MMMM yyyy').format(DateTime.parse(controller.dataUserProfile.value.profile!.tanggalLahir!))}"
                                        : "-",
                                    style: TextStyle(
                                        fontFamily: GlobalVariable.fontPoppins,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          )),
    ));
  }
}
