import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: camel_case_types
class Pul_Tolovlar extends StatelessWidget {
  const Pul_Tolovlar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000),
        centerTitle: true,
        title: Text(
          "To’lovlar",
          style: TextStyle(
              fontFamily: "Inter",
              letterSpacing: 5.w,
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("image/back_screen.png"),
                  fit: BoxFit.cover)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Xizmat hali yo'lga qo'yilmagan!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter",
                      fontSize: 25.sp),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  "404",
                  style: TextStyle(
                    color: const Color(0xff8B0000),
                    fontWeight: FontWeight.w700,
                    fontFamily: "Inter",
                    fontSize: 120.sp,
                  ),
                )
              ])),
    );
  }
}
