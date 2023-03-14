import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: camel_case_types, must_be_immutable
class Information_section_profile extends StatelessWidget {
  String number;
  String jins;
  String mamlakat;
  Information_section_profile(
      {super.key,
      required this.number,
      required this.jins,
      required this.mamlakat});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              "image/icons/call.png",
              width: 30.w,
              color: Colors.black,
            ),
            SizedBox(
              width: 19.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Telefon raqami",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(143, 0, 0, 0)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      number,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    )
                  ],
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 21.h,
        ),
        Row(
          children: [
            Image.asset(
              "image/icons/accaount.png",
              width: 30.w,
              color: Colors.black,
            ),
            SizedBox(
              width: 19.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Jins",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(143, 0, 0, 0)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      jins,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    )
                  ],
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 21.h,
        ),
        Row(
          children: [
            Image.asset(
              "image/icons/location.png",
              width: 30.w,
              color: Colors.black,
            ),
            SizedBox(
              width: 19.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Hozirgi mamlakat",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(143, 0, 0, 0)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      mamlakat,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
