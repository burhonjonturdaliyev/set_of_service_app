// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_constructors_in_immutables, duplicate_ignore, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/pages/Navigation_screens/chat.dart';
import 'package:set_of_service_app/pages/Navigation_screens/history.dart';
import 'package:set_of_service_app/pages/Navigation_screens/home.dart';
import 'package:set_of_service_app/pages/Navigation_screens/profil.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services.dart';
import 'package:set_of_service_app/pages/Support_page/Support_page.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _Home_PageState createState() => _Home_PageState(selectedIndex: 0);
}

class _Home_PageState extends State<Home_Page> {
  int selectedIndex = 0;
  _Home_PageState({required this.selectedIndex});
  final List<IconData> data = [
    Icons.home_outlined,
    Icons.history_outlined,
    Icons.menu_outlined,
    Icons.chat_bubble_outline,
    Icons.manage_accounts_outlined,
  ];
  bool Lock_screen = false;
  late PageController? _controller;

  final white = Colors.white;

  final appbarColor = const Color(0xFF8B0000);

  final containerColor = const Color(0xff8A0000);

  final circleavatarback = const Color.fromARGB(208, 220, 163, 163);

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  // _page_lock() {
  //   Navigator.of(context)
  //       .push(PageTransition(child: admin(), type: PageTransitionType.fade));
  // }

  // _lock() {
  //   setState(() {
  //     Lock_screen = true;
  //   });
  //   if (Lock_screen) {
  //     Timer(Duration(seconds: 1), () {
  //       setState(() {
  //         Lock_screen = false;
  //       });
  //       _page_lock();
  //     });
  //   }
  // }

  // _info_message(String showMessage) {
  //   final snackBar = SnackBar(
  //       backgroundColor: appbarColor,
  //       duration: Duration(seconds: 1),
  //       //shape: OutlineInputBorder(borderRadius: BorderRadius.circular(21.w)),
  //       padding: EdgeInsets.only(bottom: 10.h),
  //       content: Center(
  //         child: SizedBox(
  //           width: 320,
  //           child: Center(
  //             child: Text(
  //               showMessage,
  //               style: TextStyle(
  //                   fontFamily: "Inter",
  //                   fontSize: 16.sp,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.white,
  //                   letterSpacing: 5.sp),
  //             ),
  //           ),
  //         ),
  //       ));
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Lock_screen ? const Color(0xFF8B0000) : const Color(0xffFDDADA),
      appBar: AppBar(
        backgroundColor: appbarColor,
        title: Text(
          "${"set-of-services".toUpperCase()} ${"ilovasi".toLowerCase()}",
          style: TextStyle(
            fontFamily: "Inter",
            color: white,
            fontSize: 10.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(PageTransition(
                  child: Support_center(),
                  type: PageTransitionType.rightToLeftJoined,
                  childCurrent: Home_Page()));
            },
            icon: Icon(
              Icons.mail,
              size: 32.w,
            ),
          ),
          // IconButton(
          //     onPressed: () {
          //       if (Lock_screen) {
          //         _info_message("Dastur qulflandi");
          //         _lock();
          //       } else {
          //         _info_message("Dastur qulflandi");
          //         _lock();
          //       }
          //     },
          //     icon: Icon(Lock_screen ? Icons.lock : Icons.lock_open),
          //     color: Colors.white,
          //     iconSize: 32.w),
        ],
      ),
      bottomNavigationBar: Lock_screen
          ? null
          : Padding(
              padding:
                  EdgeInsets.only(left: 5.0.w, right: 5.0.w, bottom: 3.0.h),
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                color: containerColor,
                child: SizedBox(
                  height: 60.h,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: data.length,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    itemBuilder: (ctx, i) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = i;
                            _controller?.animateToPage(selectedIndex,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 35.w,
                          child: Icon(
                            data[i],
                            size: 35.w,
                            color: i == selectedIndex
                                ? Colors.white
                                : circleavatarback,
                          ),
                        ),
                      ),
                    ),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
            ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/back_screen.png"),
                fit: BoxFit.fitHeight)),
        child: PageView(
          physics: AlwaysScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          children: [
            Home(),
            History_money(),
            List_of_services(),
            Chat(),
            Profil()
          ],
        ),
      ),
    );
  }
}
