// ignore_for_file: must_be_immutable, camel_case_types, prefer_const_constructors_in_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Additional_done_page extends StatefulWidget {
  Additional_done_page(
      {super.key,
      required this.id,
      required this.title,
      required this.description,
      required this.delivered,
      required this.address,
      required this.telegramUrl,
      required this.phoneNumber,
      required this.mobileNumber,
      required this.shopType,
      required this.objectPhotos,
      required this.createdAt,
      required this.updatedAt,
      required this.viewsCount,
      required this.starts,
      required this.businessProfileId,
      required this.userId});
  int id;
  String title;
  String description;
  bool delivered;
  String address;
  String telegramUrl;
  String phoneNumber;
  String mobileNumber;
  String shopType;
  List<dynamic>? objectPhotos;
  String createdAt;
  String updatedAt;
  int viewsCount;
  double starts;
  int businessProfileId;
  int userId;

  @override
  State<Additional_done_page> createState() => _Additional_done_pageState();
}

class _Additional_done_pageState extends State<Additional_done_page> {
  int _currentImageIndex = 0;
  List name = [
    "https://cdn.pixabay.com/photo/2016/02/28/12/55/boy-1226964_960_720.jpg",
    "https://cdn.pixabay.com/photo/2014/11/13/06/12/boy-529067_960_720.jpg",
    "https://cdn.pixabay.com/photo/2014/09/16/01/19/girl-447701_960_720.jpg",
  ];

  done() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text(
            "E'lonni o'chirishni xoxlaysizmi?",
            style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w700,
                fontSize: 16.sp),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: () {},
                  child: Text(
                    "Ha",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp),
                  )),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Yo'q",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp))),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: done,
              icon: Icon(Icons.done_all_outlined,
                  color: Colors.white, size: 25.sp))
        ],
        title: Text(
          "Faol e'loningiz",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              letterSpacing: 5.w,
              fontWeight: FontWeight.bold,
              fontFamily: "Inter"),
        ),
        backgroundColor: const Color(0xFF8B0000),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/back_screen.png"),
                fit: BoxFit.fitHeight)),
        child: Stack(children: [
          Positioned(
            top: 5,
            left: 0,
            right: 0,
            child: name.isEmpty
                ? const SizedBox()
                : CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.95,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentImageIndex = index;
                        });
                      },
                    ),
                    items: name.map((url) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            url,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
          ),
          Positioned(
            top: 190,
            left: 0,
            right: 0,
            child: name.isEmpty
                ? const SizedBox()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: name.map((url) {
                      int index = name.indexOf(url);
                      return Container(
                        width: 8,
                        height: 8,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 2.w),
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 0.25.w, color: Colors.black),
                          shape: BoxShape.circle,
                          color: _currentImageIndex == index
                              ? const Color(0xFF8B0000)
                              : Colors.white,
                        ),
                      );
                    }).toList(),
                  ),
          ),
          Positioned(
              top: name.isNotEmpty ? 220.h : 5.h,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w, top: 15.h, right: 10.w),
                child: Column(children: [
                  Row(
                    children: [
                      Text(
                        "Mahsulot haqida ma'lumot:",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter",
                            fontSize: 18.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.description,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Yetkazib berish xizmati: Yo'q",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter",
                            fontSize: 18.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Bizning manzilimiz:",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter",
                            fontSize: 18.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.address,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffFDDADA)),
                      onPressed: () => FlutterPhoneDirectCaller.callNumber(
                          widget.phoneNumber),
                      child: Text(
                        "Hoziroq bog'laning",
                        style: TextStyle(
                            color: const Color(0xFF8B0000),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter",
                            fontSize: 14.sp),
                      ),
                    ),
                  ])
                ]),
              ))
        ]),
      ),
    );
  }
}
