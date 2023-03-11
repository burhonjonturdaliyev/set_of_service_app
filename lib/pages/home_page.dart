// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: camel_case_types
class Home_page extends StatelessWidget {
  Home_page({Key? key}) : super(key: key);

  final white = Colors.white;
  final appbarColor = const Color(0xFF8B0000);
  final containerColor = const Color(0xff8A0000);
  final circleavatarback = Color.fromARGB(208, 220, 163, 163);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFDDADA),
      appBar: AppBar(
        backgroundColor: appbarColor,
        title: Text(
          "${"set-of-services".toUpperCase()} ${"ilovasi".toLowerCase()}",
          style: TextStyle(
            fontFamily: "Inter",
            color: white,
            fontSize: 10.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.mail,
              size: 32,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Container(
              width: 354.w,
              height: 84.h,
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.visibility_outlined,
                          size: 35,
                          color: white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SOS hisobingiz",
                        style: TextStyle(
                          fontFamily: "Inter",
                          color: white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "0.00 yena",
                        style: TextStyle(
                          fontFamily: "Inter",
                          color: white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 105.w,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_circle_outline_rounded,
                          color: white,
                          size: 36.67,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Expanded(child: Items()),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Items() {
    return GridView.count(
      crossAxisCount: 3,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: circleavatarback),
            child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  size: 50,
                ),
                onPressed: () {}),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: circleavatarback),
            child: IconButton(
                icon: Icon(
                  Icons.track_changes,
                  size: 50,
                ),
                onPressed: () {}),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: circleavatarback),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: circleavatarback),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: circleavatarback),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: circleavatarback),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: circleavatarback),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: circleavatarback),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: circleavatarback),
          ),
        ),
      ],
    );
  }
}
