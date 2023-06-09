// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Home/shop/shop_pages/nooziq_ovqat.dart';
import 'package:set_of_service_app/pages/Home/shop/shop_pages/oziq_ovqat.dart';

class Shop extends StatefulWidget {
  Shop({super.key, required this.userId, this.selectedIndex});
  int userId;
  int? selectedIndex;

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  int selectedIndex = 0;

  late PageController? controller;
  @override
  void initState() {
    super.initState();
    setState(() {
      selectedIndex = widget.selectedIndex ?? 0;
    });
    controller = PageController(initialPage: selectedIndex);
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
            elevation: 0,
            centerTitle: true,
            backgroundColor: const Color(0xFF8B0000),
            title: Text(
              "shop".toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  letterSpacing: 5.w,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter"),
            )),
        body: Container(
          decoration: const BoxDecoration(
            //color: Color(0xffFDDADA),
            image: DecorationImage(
                image: AssetImage("image/back_screen.png"),
                fit: BoxFit.fitHeight),
          ),
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
                                    "Oziq-ovqat",
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
                                "Nooziq-ovqat",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Inter",
                                    fontWeight: selectedIndex == 1
                                        ? FontWeight.bold
                                        : FontWeight.normal,
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
                  children: [
                    const Oziq_ovqat(),
                    Nooziq_ovqat(
                      userId: widget.userId,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
