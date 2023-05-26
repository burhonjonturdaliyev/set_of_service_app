// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Profile_settings/Widgets/profile_settings_widgets.dart';

class Profile_settings extends StatefulWidget {
  const Profile_settings({super.key});

  @override
  State<Profile_settings> createState() => _Profile_settingsState();
}

class _Profile_settingsState extends State<Profile_settings> {
  TextEditingController ism = TextEditingController();
  TextEditingController familya = TextEditingController();
  TextEditingController nomer = TextEditingController();
  TextEditingController sana = TextEditingController();
  TextEditingController davlat = TextEditingController();
  List<String> Jins = ["Erkak", "Ayol"];

  String dropdownValue = "Erkak";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFDDADA),
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xff8B0000),
          title: Text(
            "Profil  sozlamalari",
            style: TextStyle(
                fontFamily: "Inter",
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                letterSpacing: 5),
          )),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                // color: Color(0xffFDDADA),
                image: DecorationImage(
                    image: AssetImage("image/back_screen.png"),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Profile_setting_widgets(
                    ism: ism,
                    familya: familya,
                    nomer: nomer,
                    sana: sana,
                    davlat: davlat,
                    jins: Jins,
                    dropdownValue: dropdownValue,
                  ),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 40.h,
              left: 48.w,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 281.w,
                  height: 46.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xff8B0000)),
                  child: Center(
                    child: Text(
                      "Saqlash",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Inter",
                          letterSpacing: 1.5),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
