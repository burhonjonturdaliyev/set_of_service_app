// ignore_for_file: camel_case_types, must_be_immutable, use_build_context_synchronously, duplicate_ignore

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import '../../const_api/api.dart';
import '../sign_up/model/step_model.dart';
import '../sign_up/screens/yakuniy_bosqich.dart';

class Loading_screen_sms extends StatefulWidget {
  Loading_screen_sms(
      {super.key,
      required this.number,
      required this.password,
      required this.deviceId,
      required this.conficCode});
  String number, password, deviceId, conficCode;

  @override
  State<Loading_screen_sms> createState() => _Loading_screen_smsState();
}

class _Loading_screen_smsState extends State<Loading_screen_sms> {
  Future<void> step2(
    Step2_model model,
  ) async {
    try {
      // ignore: unused_local_variable
      final response = await http.post(
        Uri.parse(Api().step2),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(model.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Yakuniy_bosqich(
                number: widget.number,
                password: widget.password,
                deviceId: widget.deviceId,
              ),
            ));
      } else {
        Navigator.pop(context);
        dialog();
        // ignore: avoid_print
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      return;
    }
  }

  dialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: const Color(0xFF8B0000),
              content: SizedBox(
                height: 150.h,
                width: 150.w,
                child: Stack(children: [
                  Positioned(
                      bottom: 0.h,
                      left: 0.w,
                      right: 0.w,
                      top: 50.h,
                      child: Text(
                        "Kiritilgan kod mos kelmadi!\nIltimos qaytadan urunib ko'ring!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp),
                      )),
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
                      )),
                ]),
              ),
            ));
  }

  @override
  void initState() {
    step2(Step2_model(
        password: widget.password,
        phoneNumber: widget.password,
        smsCode: widget.conficCode));
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
