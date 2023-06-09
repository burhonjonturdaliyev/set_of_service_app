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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF8B0000),
          centerTitle: true,
          title: Text(
            "Send money",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: "Inter",
                fontSize: 20.sp,
                letterSpacing: 5.w),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("image/back_screen.png"),
                  fit: BoxFit.fitHeight)),
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.0.w),
                child: Column(
                  children: [
                    Row(
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
                                color: selectedIndex == 1
                                    ? const Color(0xA4F89B9B)
                                    : const Color(0xFF8B0000),
                                borderRadius: BorderRadius.circular(5.w)),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Naqt",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w700,
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
                                color: selectedIndex == 0
                                    ? const Color(0xA4F89B9B)
                                    : const Color(0xFF8B0000),
                                borderRadius: BorderRadius.circular(5.w)),
                            child: Center(
                              child: Text(
                                "Kartaga",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.sp,
                                    letterSpacing: 5.w),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: selectedIndex == 0
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 2.h,
                          width: 185.w,
                          color: Colors.white,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: controller,
                  onPageChanged: (int index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  children: const [
                    Naqt(),
                    Kartaga(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
