// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Yakuniy_bosqich extends StatelessWidget {
  const Yakuniy_bosqich({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        _big_container(),
        _samuray_photo(),
        _name_provider(),
        _bosqich(),
        _content()
      ]),
    );
  }

  Widget _big_container() {
    return Positioned(
      bottom: 600.h,
      left: -270.w,
      child: Transform.rotate(
        angle: 309,
        child: Container(
          height: 297.h,
          width: 540.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.w),
              color: const Color(0xff800000)),
        ),
      ),
    );
  }

  Widget _samuray_photo() {
    return Positioned(
        bottom: 640.h,
        right: 13.w,
        child: SizedBox(
          height: 150.h,
          width: 130.w,
          child: Image.asset(
            "image/samuray.png",
            fit: BoxFit.cover,
          ),
        ));
  }

  Widget _name_provider() {
    return Positioned(
      bottom: 545.h,
      left: 10.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "set-\nof-\nservices".toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                // fontFamily: "Inter",
                fontSize: 40.sp),
          ),
          Text(
            "for Uzbeks",
            style: TextStyle(
                color: const Color.fromRGBO(255, 255, 255, 1),
                // fontFamily: "Inter",
                fontWeight: FontWeight.w100,
                letterSpacing: 1.w,
                fontSize: 20.sp),
          )
        ],
      ),
    );
  }

  Widget _bosqich() {
    return Positioned(
        bottom: 400.h,
        left: 25.w,
        right: 25.w,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ro'yxatdan o'tish",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter",
                      fontSize: 30.sp),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Yakuniy bosqich",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter",
                      fontSize: 15.sp),
                )
              ],
            ),
          ],
        ));
  }

  Widget _content() {
    return Positioned(
      bottom: 100.h,
      left: 10.w,
      right: 10.w,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                style: TextStyle(
                    color: Colors.black, fontFamily: "Inter", fontSize: 16.sp),
                decoration: InputDecoration(
                    hintText: "Ismingizni yozing:",
                    hintStyle: TextStyle(
                        color: Colors.black54,
                        fontFamily: "Inter",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(33.w))),
              ))
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                style: TextStyle(
                    color: Colors.black, fontFamily: "Inter", fontSize: 16.sp),
                decoration: InputDecoration(
                    hintText: "Familyangizni yozing:",
                    hintStyle: TextStyle(
                        color: Colors.black54,
                        fontFamily: "Inter",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(33.w))),
              ))
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(children: [
            Expanded(
                child: TextFormField(
              style: TextStyle(
                  color: Colors.black, fontFamily: "Inter", fontSize: 16.sp),
              decoration: InputDecoration(
                  hintText: "Jinsni tanlang:",
                  hintStyle: TextStyle(
                      color: Colors.black54,
                      fontFamily: "Inter",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(33.w))),
            )),
            SizedBox(width: 10.w),
            Expanded(
                child: TextFormField(
              style: TextStyle(
                  color: Colors.black, fontFamily: "Inter", fontSize: 16.sp),
              decoration: InputDecoration(
                  hintText: "Tug'ilgan kuningiz:",
                  hintStyle: TextStyle(
                      color: Colors.black54,
                      fontFamily: "Inter",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(33.w))),
            ))
          ]),
          SizedBox(
            height: 10.h,
          ),
          Row(children: [
            Expanded(
                child: TextFormField(
              style: TextStyle(
                  color: Colors.black, fontFamily: "Inter", fontSize: 16.sp),
              decoration: InputDecoration(
                  hintText: "Davlatni tanlang:",
                  hintStyle: TextStyle(
                      color: Colors.black54,
                      fontFamily: "Inter",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(33.w))),
            )),
            SizedBox(width: 10.w),
            Expanded(
                child: TextFormField(
              style: TextStyle(
                  color: Colors.black, fontFamily: "Inter", fontSize: 16.sp),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(33.w))),
            ))
          ]),
          Row(children: [
            Expanded(
                child: Text("Qaysi davlatdagi xizmatlarni ko`rmoqchisiz ?")),
            SizedBox(
              width: 10.w,
            ),
            Column(
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "Men", style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: " Bosildi",
                      style: TextStyle(color: Colors.black),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => print("object"))
                ]))
              ],
            )
          ])
        ],
      ),
    );
  }
}
