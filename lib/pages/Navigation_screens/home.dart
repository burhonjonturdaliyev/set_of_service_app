import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/pages/Home/send_money/send_money.dart';
import 'package:set_of_service_app/pages/Home/shop/shop_page.dart';
import 'package:set_of_service_app/pages/services_page/pochta_xizmati.dart';

import '../Home/tolovlar/tolovlar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool visible = true;
  double money = 0.00;

  final white = Colors.white;

  final appbarColor = const Color(0xFF8B0000);

  final containerColor = const Color(0xff8A0000);

  final circleavatarback = const Color.fromARGB(208, 220, 163, 163);

  final backgroudColor = const Color(0xffFDDADA);
  void visib_check() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("image/back_screen.png"),
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter)),
      child: Column(
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
                        onPressed: () {},
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
      ),
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
              child: Shop(),
              type: PageTransitionType.fade,
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
                  child: Send_money(), type: PageTransitionType.fade));
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
                child: Pul_Tolovlar(),
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
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(PageTransition(
                child: Pochta_xizmati(),
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
        Padding(
          padding: const EdgeInsets.all(10.0),
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
        Padding(
          padding: const EdgeInsets.all(10.0),
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
        Padding(
          padding: EdgeInsets.all(10.0.w),
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
      ],
    );
  }
}
