// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, camel_case_types, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Profile_settings/Widgets/profile_settings_widgets.dart';

class Profile_settings extends StatefulWidget {
  Profile_settings({super.key, required this.userHashId, required this.userId});
  String? userHashId;
  int? userId;

  @override
  State<Profile_settings> createState() => _Profile_settingsState();
}

class _Profile_settingsState extends State<Profile_settings> {
  TextEditingController ism = TextEditingController();
  TextEditingController familya = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController sana = TextEditingController();
  TextEditingController davlat = TextEditingController();
  String myServer = 'JAPAN';
  String jinsi = 'ERKAK';

  List<String> jinslari = ['ERKAK', 'AYOL'];
  List<String> countryNames = [
    'JAPAN',
    'UZBEKISTAN',
    'KOREA',
    'USA',
    'RUSSIA',
    'KAZAKHSTAN',
    'EUROPE',
    'CHINA',
    'CANADA',
    'SINGAPORE',
    'TURKEY',
    'UAE'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xff8B0000),
          title: Text(
            "Profil sozlamalari",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                letterSpacing: 5.w,
                fontWeight: FontWeight.bold,
                fontFamily: "Inter"),
          )),
      body: Container(
        height: 812.h,
        width: 375.w,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/back_screen.png"),
                fit: BoxFit.fitHeight)),
        child: Profile_setting_widgets(
          userHashId: widget.userHashId,
          userId: widget.userId,
          ism: ism,
          familya: familya,
          email: email,
          sana: sana,
          server: myServer,
          jinsi: jinsi,
          jinslari: jinslari,
          davlatlar: countryNames,
        ),
      ),
    );
  }
}
