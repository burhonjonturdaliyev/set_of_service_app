// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Home/send_money/send_money_pages/send_kartaga.dart';
import 'package:set_of_service_app/pages/Home/send_money/send_money_pages/send_naqt.dart';

class Send_money extends StatefulWidget {
  const Send_money({super.key});

  @override
  State<Send_money> createState() => _Send_moneyState();
}

class _Send_moneyState extends State<Send_money> {
  int selectedIndex = 0;

  late PageController? controller;
  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFDDADA),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("image/back_screen.png"),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(1.0.w),
                child: Container(
                  width: 375.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.w),
                      color: const Color(0xFF8B0000)),
                  child: Center(
                    child: Text(
                      "Send money",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          fontSize: 14.sp,
                          letterSpacing: 5.w),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(1.0.w),
                child: Row(
                  children: [
                    GestureDetector(
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
                            borderRadius: BorderRadius.circular(5.w),
                            color: const Color(0xFF8B0000)),
                        child: Center(
                          child: Text(
                            "Kartaga",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Inter",
                              fontSize: selectedIndex == 0 ? 14.sp : 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    GestureDetector(
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
                            borderRadius: BorderRadius.circular(5.w),
                            color: const Color(0xFF8B0000)),
                        child: Center(
                          child: Text(
                            "Naqt",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Inter",
                              fontSize: selectedIndex != 0 ? 14.sp : 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: PageView(
                controller: controller,
                onPageChanged: (int index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                children: [Kartaga(), Naqt()],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
