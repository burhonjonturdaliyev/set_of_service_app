// ignore_for_file: camel_case_types, must_be_immutable, non_constant_identifier_names, unnecessary_null_comparison, avoid_print, duplicate_ignore, null_check_always_fails

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:set_of_service_app/registr/data/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const_api/api.dart';
import '../../screen/home_screen.dart';
import '../sign_in/model/login_model.dart';

class Loading_page extends StatefulWidget {
  Loading_page({
    super.key,
    required this.phoneNumber,
    required this.password,
    required this.macAddress,
  });

  String phoneNumber;
  String password;
  String macAddress;

  @override
  State<Loading_page> createState() => _Loading_pageState();
}

class _Loading_pageState extends State<Loading_page> {
  user_model? datalar;
  late Timer _timer;
  SharedPreferences? logindata;
  void checkingTime() {
    const duration = Duration(seconds: 30);
    _timer = Timer(duration, () {
      Navigator.pop(context);
      dialog(); // Call the dialog function outside the timer callback
    });
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

  Future<void> login(login_model model) async {
    try {
      final response = await http.post(
        Uri.parse(Api().login),
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
        print(response.statusCode);
        // ignore: use_build_context_synchronously
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
                      "Telefon yoki parol xato!\nIltimos qaytadan urunib ko'ring!",
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
      return;
    }
  }

  auth() {
    login(login_model(
      macAddress: widget.macAddress,
      password: widget.password,
      phoneNumber: widget.phoneNumber,
    ));
  }

  @override
  void initState() {
    checkingTime();
    auth();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
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
                  "Internet aloqa bilan muammo bor. Iltimos aloqangizni tekshiring!",
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
}
