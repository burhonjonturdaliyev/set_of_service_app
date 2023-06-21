// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';

import '../../screen/home_screen.dart';

class Loading_page extends StatelessWidget {
  Loading_page({super.key, required this.responce});
  Response responce;

  checking(context) async {
    if (responce.statusCode == 200) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const Home_Page(),
          ),
          (route) => false);
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                backgroundColor: const Color(0xFF8B0000),
                content: SizedBox(
                  height: 150.h,
                  width: 150.w,
                  child: Stack(children: [
                    Positioned(
                        bottom: 0.h,
                        left: 0.w,
                        right: 0.w,
                        top: 50.h,
                        child: Text(
                          "Telefon yoki parol xato!\nIltimos qaytadan urunib ko'ring!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp),
                        )),
                    Positioned(
                        top: -15.h,
                        right: -10.w,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close_outlined,
                            color: Colors.white,
                            size: 35.sp,
                          ),
                        )),
                  ]),
                ),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
