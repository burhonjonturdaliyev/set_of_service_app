// ignore_for_file: camel_case_types, must_be_immutable, non_constant_identifier_names, use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/const_api/api.dart';
import 'package:http/http.dart' as http;

import '../sign_in/Sign_in_screen.dart';

class loading_reset extends StatefulWidget {
  loading_reset({super.key, required this.number});
  String number;

  @override
  State<loading_reset> createState() => _loading_resetState();
}

class _loading_resetState extends State<loading_reset> {
  getting_info() async {
    final uri = '${Api().forget_password}${widget.number}';
    final url = Uri.parse(uri);
    final responce = await http.get(url);
    if (responce.statusCode == 200 || responce.statusCode == 201) {
      final json = jsonDecode(responce.body);
      Navigator.pop(context);
      login(json['object']);
    } else {
      print(responce.statusCode);
    }
  }

  login(String info) {
    showDialog(
      context: context,
      builder: (context) => ClipRRect(
        borderRadius: BorderRadius.circular(21.w),
        child: AlertDialog(
          backgroundColor: const Color(0xFF8B0000),
          content: SizedBox(
            height: 218.h,
            width: 348.w,
            child: Column(
              children: [
                SizedBox(
                  height: 54.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Sizning parolingiz:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w900,
                            fontSize: 16.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(
                      info,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w900,
                          fontSize: 19.sp),
                    ))
                  ],
                ),
                SizedBox(
                  height: 65.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                            child: Sign_in(), type: PageTransitionType.fade),
                        (route) => false);
                  },
                  child: Container(
                    width: 220.w,
                    height: 37.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.w),
                        border: Border.all(
                            width: 3,
                            color: const Color.fromARGB(70, 241, 237, 237)),
                        color: const Color.fromARGB(208, 252, 210, 210)),
                    child: Center(
                      child: Text(
                        "ok".toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 25.sp,
                            fontFamily: "Inter"),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    getting_info();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(107, 0, 0, 0),
      body: Center(
          child: Container(
        height: 90.h,
        width: 90.w,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: const Center(
            child: CircularProgressIndicator(
          color: Color(0xFF8B0000),
        )),
      )),
    );
  }
}
