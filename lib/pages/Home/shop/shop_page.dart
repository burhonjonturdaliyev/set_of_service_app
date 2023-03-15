import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Home/shop/shop_pages/nooziq_ovqat.dart';
import 'package:set_of_service_app/pages/Home/shop/shop_pages/oziq_ovqat.dart';

class Shop extends StatefulWidget {
  Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
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
      backgroundColor: const Color(0xFF8B0000),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xffFDDADA),
            image: DecorationImage(
                image: AssetImage("image/back_screen.png"), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(1.0.w),
                child: Container(
                  width: 375.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                      color: const Color(0xFF8B0000),
                      borderRadius: BorderRadius.circular(5.w)),
                  child: Center(
                    child: Text(
                      "shop".toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          letterSpacing: 5.w,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.0.w),
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
                            color: const Color(0xFF8B0000),
                            borderRadius: BorderRadius.circular(5.w)),
                        child: Center(
                          child: Text(
                            "Oziq-ovqat",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w700,
                                fontSize: selectedIndex == 0 ? 14.sp : 12.sp,
                                letterSpacing: 5.w),
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
                            color: const Color(0xFF8B0000),
                            borderRadius: BorderRadius.circular(5.w)),
                        child: Center(
                          child: Text(
                            "Nooziq-ovqat",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w700,
                                fontSize: selectedIndex == 1 ? 14.sp : 12.sp,
                                letterSpacing: 5.w),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  // physics: const NeverScrollableScrollPhysics(),
                  controller: controller,
                  onPageChanged: (int index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  children: [Oziq_ovqat(), Nooziq_ovqat()],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
