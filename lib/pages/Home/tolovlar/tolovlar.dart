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
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(top: 57.0.h, left: 28.w),
              child: Row(
                children: [
                  Text(
                    "Xizmat\nvaqtincha\nishlamaydi ⚠",
                    style: TextStyle(
                        letterSpacing: 5.w,
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Image(
                  image: const AssetImage(
                    "image/error_tranzaction.png",
                  ),
                  width: 354.w,
                )
              ],
            )
          ])),
    );
  }
}
