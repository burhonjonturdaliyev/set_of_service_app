// ignore_for_file: unnecessary_null_comparison, camel_case_types, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: camel_case_types, must_be_immutable
class Information_section_profile extends StatefulWidget {
  String number;
  String jins;
  String mamlakat;
  String server;
  String email;
  Information_section_profile(
      {super.key,
      required this.number,
      required this.jins,
      required this.mamlakat,
      required this.server,
      required this.email});

  @override
  State<Information_section_profile> createState() =>
      _Information_section_profileState();
}

class _Information_section_profileState
    extends State<Information_section_profile> {
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
                      "Telefon raqam:",
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
                      widget.number,
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
          height: 10.h,
        ),
        Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.mail_outline_outlined,
                  color: Colors.black87,
                  size: 33.w,
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
                          "Elektron pochta:",
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
                          widget.email,
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
              height: 10.h,
            ),
          ],
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
                      "Jins:",
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
                      widget.jins,
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
          height: 10.h,
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
                      "Hozirgi mamlakat:",
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
                      widget.mamlakat,
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
          height: 10.h,
        ),
        Row(
          children: [
            Icon(
              Icons.wifi_password_outlined,
              color: Colors.black,
              size: 30.w,
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
                      "Ishlatilayotgan server:",
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
                      widget.server,
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
