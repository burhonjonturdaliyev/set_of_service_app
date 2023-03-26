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
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                child: Text(
                  "Naqt",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Inter",
                    fontSize: selectedIndex == 0 ? 14.sp : 12.sp,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Kartaga",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Inter",
                    fontSize: selectedIndex == 0 ? 14.sp : 12.sp,
                  ),
                ),
              )
            ],
          ),
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
        backgroundColor: const Color(0xffFDDADA),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("image/back_screen.png"),
                  fit: BoxFit.cover)),
          child: TabBarView(
            children: [
              Naqt(),
              Kartaga(),
            ],
          ),
        ),
      ),
    );
  }
}
