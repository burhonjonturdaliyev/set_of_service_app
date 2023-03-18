import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/screen/home_screen.dart';

// ignore: camel_case_types
class Confirm_tranzactions extends StatelessWidget {
  Confirm_tranzactions(
      {super.key,
      required this.name,
      required this.number,
      required this.yuborish_summa,
      required this.qabul_qilish_summa,
      required this.kurs,
      required this.komissiya});
  String name;
  String number;
  String yuborish_summa;
  String qabul_qilish_summa;
  String kurs;
  String komissiya;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 354.w,
      height: 430.h,
      decoration: BoxDecoration(
          // border: Border.all(width: 1, color: Colors.black45),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(21)),
      child: Column(
        children: [
          SizedBox(
            height: 23.h,
          ),
          Row(
            children: [
              Text(
                "Yuboruvchi",
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Inter"),
              )
            ],
          ),
          Row(
            children: [
              Text(
                name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Inter"),
              )
            ],
          ),
          SizedBox(
            height: 19.h,
          ),
          Row(
            children: [
              Text(
                "Qabul qiluvchi",
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Inter"),
              )
            ],
          ),
          Row(
            children: [
              Text(
                number,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Inter"),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Text("Summa",
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Inter"))
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Text(
                "Yuborish: \n$yuborish_summa yena",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Inter"),
              )
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(
            children: [
              Text(
                "Qabul qilish: \n$qabul_qilish_summa",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Inter"),
              )
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Text(
                "Kurs: \n$kurs",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Inter"),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "Komissiya: \n$komissiya",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Inter"),
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    PageTransition(
                        child: Home_Page(), type: PageTransitionType.fade),
                    (route) => false);
              },
              child: Text("O'tkazma"))
        ],
      ),
    );
  }
}
