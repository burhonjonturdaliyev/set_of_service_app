// ignore_for_file: camel_case_types, must_be_immutable, use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/registr/sign_up/screens/ikkinchi_bosqich.dart';
import '../../const_api/api.dart';
import '../sign_up/model/step_model.dart';

class Loading_screen_step1 extends StatefulWidget {
  Loading_screen_step1(
      {super.key,
      required this.number,
      required this.password,
      required this.deviceId});
  String number, password, deviceId;

  @override
  State<Loading_screen_step1> createState() => _Loading_screen_step1State();
}

class _Loading_screen_step1State extends State<Loading_screen_step1> {
  Future<void> step1(
    Step1_model model,
  ) async {
    try {
      // ignore: unused_local_variable
      final response = await http.post(
        Uri.parse(Api().step1),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(model.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: ikkinchi_bosqich(
                    number: widget.number,
                    password: widget.password,
                    deviceId: widget.deviceId),
                type: PageTransitionType.fade));
      } else {
        Navigator.pop(context);
        dialog("Ushbu telefon raqam allaqachon ro'yxatdan o'tgan!");
        // ignore: avoid_print
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that occurred during the request
    }
  }

  void dialog(String info) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF8B0000),
        content: SizedBox(
          height: 150.h,
          width: 150.w,
          child: Stack(
            children: [
              Positioned(
                bottom: 0.h,
                left: 0.w,
                right: 0.w,
                top: 50.h,
                child: Text(
                  info,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              Positioned(
                top: -15.h,
                right: -10.w,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close_outlined,
                    color: Colors.white,
                    size: 35.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    step1(Step1_model(password: widget.password, phoneNumber: widget.number));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
