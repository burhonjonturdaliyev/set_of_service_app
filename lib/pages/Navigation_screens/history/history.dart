// ignore_for_file: camel_case_types, must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Navigation_screens/history/screens/elon_monitoring.dart';
import 'package:set_of_service_app/pages/Navigation_screens/history/screens/money_monitoring.dart';

class History extends StatefulWidget {
  History({super.key, required this.userId});
  int userId;
  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final white = Colors.white;

  final appbarColor = const Color(0xFF8B0000);

  final containerColor = const Color(0xff8A0000);

  final circleavatarback = const Color.fromARGB(208, 220, 163, 163);

  final backgroudColor = const Color(0xffFDDADA);

  int selectedIndex = 0;

  late PageController? controller;
  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 1.h, left: 1.w, right: 1.w),
          width: 375.w,
          height: 25.h,
          decoration: BoxDecoration(
              color: const Color(0xFF8B0000),
              borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Text(
              "Monitoring",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 5.w),
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    controller?.animateToPage(selectedIndex = 0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  });
                },
                child: Container(
                  width: 185.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                      color: selectedIndex == 0
                          ? const Color(0xA4F89B9B)
                          : const Color(0xFF8B0000),
                      borderRadius: BorderRadius.circular(5.w)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Xarajatlar",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Inter",
                              fontWeight: selectedIndex == 0
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: 14.sp,
                              letterSpacing: 5.w),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    controller?.animateToPage(selectedIndex = 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  });
                },
                child: Container(
                  width: 185.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                      color: selectedIndex == 1
                          ? const Color(0xA4F89B9B)
                          : const Color(0xFF8B0000),
                      borderRadius: BorderRadius.circular(5.w)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Faol e'lonlar",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Inter",
                              fontWeight: selectedIndex == 0
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: 14.sp,
                              letterSpacing: 5.w),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: PageView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: controller,
          onPageChanged: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          children: [
            Money_monitoring(
              userId: widget.userId,
            ),
            Elon_monitoring(
              userId: widget.userId,
            )
          ],
        ))
      ],
    );
  }
}
