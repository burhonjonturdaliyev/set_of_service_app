import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Additional_page_shop extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 160.h),
        child: Container(
          height: 525.h,
          width: 375.w,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 246, 227, 227),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35.w),
                  topLeft: Radius.circular(35.w))),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(children: [
              Positioned(
                  top: 0,
                  child: Container(
                    width: 375.w,
                    height: 375.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(21.w),
                            topLeft: Radius.circular(21.w)),
                        image: DecorationImage(
                            image: NetworkImage(image), fit: BoxFit.cover)),
                  )),
              Positioned(
                  top: 10.h,
                  left: 5.w,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 25.w,
                      ),
                    ),
                  )),
              Positioned(
                  left: 10.w,
                  top: 380.h,
                  child: Column(
                    children: [
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
                      )
                    ],
                  )),
              Positioned(
                  top: 405.h,
                  left: 5.w,
                  right: 5.w,
                  child: Text(
                    "$information dwekdfbweh ekfdbewj jfwefbew eifweif we iewbfwe fiwewei fewi",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp),
                  )),
              Positioned(
                  bottom: 10.h,
                  right: 10.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8B0000)),
                    onPressed: () =>
                        FlutterPhoneDirectCaller.callNumber(number),
                    child: Text(
                      "Hoziroq bog'laning",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Inter",
                          fontSize: 14.sp),
                    ),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
