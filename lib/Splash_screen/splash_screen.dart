// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/registr/sign_in/Sign_in_screen.dart';
import 'package:set_of_service_app/screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        SharedPreferences logindata = await SharedPreferences.getInstance();
        bool isFirstTime = logindata.getBool('isFirstTime') ?? true;
        if (isFirstTime) {
          // User information is not saved, navigate to a setup page
          Navigator.pushAndRemoveUntil(
              context,
              PageTransition(
                  child: Sign_in(),
                  type: PageTransitionType.fade,
                  curve: Curves.fastLinearToSlowEaseIn,
                  childCurrent: const Splash_screen()),
              (route) => false);
        } else {
          // User information is already saved, navigate to the main page
          Navigator.pushAndRemoveUntil(
              context,
              PageTransition(
                  child: Home_Page(),
                  type: PageTransitionType.fade,
                  curve: Curves.fastLinearToSlowEaseIn,
                  childCurrent: const Splash_screen()),
              (route) => false);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "image/app/logo_qizil.png",
          )
        ],
      ),
    );
  }
}
