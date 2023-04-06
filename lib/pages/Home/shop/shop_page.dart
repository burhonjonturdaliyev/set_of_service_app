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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFF8B0000),
        appBar: AppBar(
            bottom: TabBar(indicatorColor: Colors.white, tabs: [
              Tab(
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
              Tab(
                child: Text(
                  "Nooziq-ovqat",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                      fontSize: selectedIndex == 0 ? 14.sp : 12.sp,
                      letterSpacing: 5.w),
                ),
              ),
            ]),
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
            color: Color(0xffFDDADA),
            image: DecorationImage(
                image: AssetImage("image/back_screen.png"), fit: BoxFit.cover),
          ),
          child: TabBarView(
            // physics: const NeverScrollableScrollPhysics(),

            children: [Oziq_ovqat(), Nooziq_ovqat()],
          ),
        ),
      ),
    );
  }
}
