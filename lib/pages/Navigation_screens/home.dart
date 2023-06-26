// ignore_for_file: non_constant_identifier_names, duplicate_ignore, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/pages/Home/airticket/avia_bilet.dart';
import 'package:set_of_service_app/pages/Home/house/house.dart';
import 'package:set_of_service_app/pages/Home/job/job.dart';
import 'package:set_of_service_app/pages/Home/paynet/paynet.dart';
import 'package:set_of_service_app/pages/Home/send_money/send_money.dart';
import 'package:set_of_service_app/pages/Home/shop/shop_page.dart';
import 'package:set_of_service_app/pages/Home/pochta/pochta_xizmati.dart';
import 'package:set_of_service_app/pages/Home/visa/viza_xizmati.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Home/tolovlar/tolovlar.dart';

class Home extends StatefulWidget {
  Home({super.key, required this.userId});
  int userId;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool visible = true;
  double money = 0.00;
  SharedPreferences? logindata;

  final white = Colors.white;

  final appbarColor = const Color(0xFF8B0000);

  final containerColor = const Color(0xff8A0000);

  final circleavatarback = const Color.fromARGB(208, 233, 192, 192);

  final backgroudColor = const Color.fromARGB(255, 253, 235, 235);
  void visib_check() {
    setState(() {
      visible = !visible;
    });
  }

  // late final LocalNotificationService service;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Center(
          child: Container(
            width: 354.w,
            height: 84.h,
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: visib_check,
                      icon: Icon(
                        visible == true
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: 35.w,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 12.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SOS hisobingiz",
                      style: TextStyle(
                        fontFamily: "Inter",
                        color: white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      visible ? "$money yena" : "**** yena",
                      style: TextStyle(
                        fontFamily: "Inter",
                        color: white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 105.w,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: white,
                            content: SizedBox(
                              height: 200.h,
                              width: 150.w,
                              child: Stack(
                                children: [
                                  Positioned(
                                      top: -10.h,
                                      right: -3.w,
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(
                                          Icons.close_rounded,
                                          color: Colors.black54,
                                          size: 35.w,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.add_circle_outline_rounded,
                        color: white,
                        size: 36.67,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Expanded(child: Items(context)),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget Items(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () => Navigator.of(context).push(PageTransition(
              child: Shop(
                userId: widget.userId,
              ),
              duration: const Duration(milliseconds: 250),
              type: PageTransitionType.rightToLeftWithFade,
            )),
            child: Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: circleavatarback),
                child: Image.asset(
                  "image/shop.png",
                  width: 65.w,
                  color: Colors.black,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(PageTransition(
                  child: const Send_money(),
                  duration: const Duration(milliseconds: 250),
                  type: PageTransitionType.rightToLeftWithFade));
            },
            child: Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: circleavatarback),
              child: Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: Center(
                    child: Image.asset(
                  "image/transfer.png",
                  width: 85.w,
                  color: Colors.black,
                )),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(PageTransition(
                child: const Pul_Tolovlar(),
                duration: const Duration(milliseconds: 250),
                type: PageTransitionType.rightToLeftWithFade)),
            child: Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: circleavatarback),
              child: Image.asset(
                "image/money.png",
                color: Colors.black,
                width: 65.w,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(PageTransition(
                child: Avia_bilet(
                  userId: widget.userId,
                ),
                duration: const Duration(milliseconds: 250),
                type: PageTransitionType.rightToLeftWithFade)),
            child: Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: circleavatarback),
              child: Image.asset(
                "image/ticket.png",
                color: Colors.black,
                width: 65.w,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(PageTransition(
                child: const Pochta_xizmati(),
                duration: const Duration(milliseconds: 250),
                type: PageTransitionType.rightToLeftWithFade)),
            child: Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: circleavatarback),
              child: Image.asset(
                "image/post.png",
                color: Colors.black,
                width: 65.w,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(PageTransition(
                child: const Paynet(),
                duration: const Duration(milliseconds: 250),
                type: PageTransitionType.rightToLeftWithFade)),
            child: Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: circleavatarback),
              child: Image.asset(
                "image/pay.png",
                color: Colors.black,
                width: 65.w,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(PageTransition(
                child: const Viza_xizmati(),
                duration: const Duration(milliseconds: 250),
                type: PageTransitionType.rightToLeftWithFade)),
            child: Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: circleavatarback),
              child: Image.asset(
                "image/visa.png",
                color: Colors.black,
                width: 65.w,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(PageTransition(
                child: const Ish_topish(),
                duration: const Duration(milliseconds: 250),
                type: PageTransitionType.rightToLeftWithFade)),
            child: Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: circleavatarback),
              child: Image.asset(
                "image/Group.png",
                color: Colors.black,
                width: 65.w,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0.w),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(PageTransition(
                child: const Uy_joy_top(),
                duration: const Duration(milliseconds: 250),
                type: PageTransitionType.rightToLeftWithFade)),
            child: Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: circleavatarback),
              child: Image.asset(
                "image/home.png",
                width: 65.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
