import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Additional_page_shop extends StatefulWidget {
  Additional_page_shop(
      {super.key,
      required this.name,
      required this.number,
      required this.delevering,
      required this.address,
      required this.time,
      required this.count,
      required this.rate,
      required this.information,
      required this.image});
  String name;
  String number;
  String delevering;
  String address;
  DateTime time;
  int count;
  double rate;
  String information;
  String image;

  @override
  State<Additional_page_shop> createState() => _Additional_page_shopState();
}

class _Additional_page_shopState extends State<Additional_page_shop> {
  bool prograss = false;

  @override
  void initState() {
    Timer(const Duration(seconds: 2), changer);
    super.initState();
  }

  changer() {
    setState(() {
      prograss = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          expandedHeight: 400,
          flexibleSpace: FlexibleSpaceBar(
              // ignore: unnecessary_null_comparison
              background: prograss ? back_photo() : prograss_indicator()),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(10.h),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70.w),
                  topRight: Radius.circular(70.w),
                ),
                color: const Color(0xFF8B0000),
              ),
              child: Column(
                children: [
                  SizedBox(height: 15.h),
                  Container(
                    width: 80,
                    height: 4,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              backgroundColor: const Color(0xFF8B0000),
              radius: 18,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
              height: 600,
              width: double.infinity,
              color: const Color(0xFF8B0000),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Padding(
                  padding:
                      EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
                  child: Column(children: [
                    Row(
                      children: [
                        Text(
                          "Mahsulot haqida ma'lumot:",
                          style: TextStyle(
                              color: Colors.white,
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
                            widget.information,
                            style: TextStyle(
                                color: Colors.white,
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
                          "Yetkazib berish xizmati: ${widget.delevering}",
                          style: TextStyle(
                              color: Colors.white,
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
                              color: Colors.white,
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
                                color: Colors.white,
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
                        onPressed: () =>
                            FlutterPhoneDirectCaller.callNumber(widget.number),
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
                ),
              )),
        )
      ],
    );
  }

  back_photo() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.image),
          fit: BoxFit.cover,
          onError: (exception, stackTrace) => Image.asset(
            "image/back_screen.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  prograss_indicator() {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        color: Colors.red,
      ),
    );
  }
}
