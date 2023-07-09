// ignore_for_file: camel_case_types, use_build_context_synchronously, duplicate_ignore, must_be_immutable, avoid_print, unnecessary_null_comparison, null_check_always_fails

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../const_api/api.dart';
import '../../screen/home_screen.dart';
import '../data/user_model.dart';
import '../sign_up/model/step_model.dart';

class Loading_page_registr extends StatefulWidget {
  Loading_page_registr(
      {super.key,
      required this.name,
      required this.surname,
      required this.password,
      required this.deviceId,
      required this.number,
      required this.gender,
      required this.sana,
      required this.server});

  String password, sana, name, deviceId, gender, surname, number, server;

  @override
  State<Loading_page_registr> createState() => _Loading_page_registrState();
}

class _Loading_page_registrState extends State<Loading_page_registr> {
  user_model? datalar;
  SharedPreferences? logindata;
  Future<void> step3(
    Step3_model model,
  ) async {
    try {
      // ignore: unused_local_variable
      final response = await http.post(
        Uri.parse(Api().step3),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(model.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          final body = response.body;
          if (body != null && body.isNotEmpty) {
            final json = jsonDecode(body);
            final result = json['object'];
            final data = user_model.fromJson(result);
            setState(() {
              datalar = data;
            });
            await getSharedPreferencesInstance();
            // ignore: use_build_context_synchronously
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => Home_Page(),
              ),
              (route) => false,
            );
          } else {
            print('API response body is null or empty');
          }
        } catch (e) {
          print(e);
        }
      } else {
        // API request failed
        Navigator.pop(context);
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
                      "Xatolik bor!\nIltimos, qaytadan urunib ko'ring!",
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
        // ignore: avoid_print
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that occurred during the request
    }
  }

  getSharedPreferencesInstance() async {
    logindata = await SharedPreferences.getInstance();
    logindata?.setBool('isFirstTime', false);
    logindata?.setInt("id", datalar!.user!.id!);
    logindata?.setString('firstName', datalar!.user!.firstName!);
    logindata?.setString('lastName', datalar!.user!.lastName!);
    logindata?.setString('phoneNumber', datalar!.user!.phoneNumber!);
    logindata?.setString('currentCountry', datalar!.user!.currentCountry!);
    logindata?.setString('visitCountry', datalar!.user!.visitCountry!);
    logindata?.setString('accountType', datalar!.user!.accountType!);
    logindata?.setString('genderType', datalar!.user!.genderType!);
    logindata?.setString('dateOfBirth', datalar!.user!.dateOfBirth!);
    logindata?.setBool('verification', datalar!.user!.verification!);
    logindata?.setString('userHashId', datalar!.user!.userHashId!);
  }

  registr() {
    step3(Step3_model(
        confirmPassword: widget.password,
        dateOfBirth: widget.sana,
        deviceId: widget.deviceId,
        firstName: widget.name,
        genderType: widget.gender,
        lastName: widget.surname,
        password: widget.password,
        phoneNumber: widget.number,
        visitCountry: widget.server));
  }

  void dialog() {
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
                  "Server bilan aloqa mavjud emas! Iltimos, birozdan keyin urinib ko'ring!",
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
    registr();
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
