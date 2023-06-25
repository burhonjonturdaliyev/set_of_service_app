// ignore_for_file: camel_case_types, must_be_immutable, non_constant_identifier_names, unused_element, avoid_print, use_build_context_synchronously, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/registr/loading/loading_screen_sms.dart';

class ikkinchi_bosqich extends StatefulWidget {
  ikkinchi_bosqich(
      {super.key,
      required this.number,
      required this.password,
      required this.deviceId});
  String number;
  String password;
  String deviceId;

  @override
  State<ikkinchi_bosqich> createState() => _ikkinchi_bosqichState();
}

class _ikkinchi_bosqichState extends State<ikkinchi_bosqich> {
  TextEditingController conficCode = TextEditingController();

  final _formkey = GlobalKey<FormState>();

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      body: Stack(children: [
        _big_container(),
        _samuray_photo(),
        _name_provider(),
        _bosqich(),
        _text(),
        _content(context)
      ]),
    );
  }

  Widget _big_container() {
    return Positioned(
      bottom: 600.h,
      left: -270.w,
      child: Transform.rotate(
        angle: 309,
        child: Container(
          height: 297.h,
          width: 540.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.w),
              color: const Color(0xff800000)),
        ),
      ),
    );
  }

  Widget _samuray_photo() {
    return Positioned(
        bottom: 640.h,
        right: 13.w,
        child: SizedBox(
          height: 150.h,
          width: 130.w,
          child: Image.asset(
            "image/samuray.png",
            fit: BoxFit.cover,
          ),
        ));
  }

  Widget _name_provider() {
    return Positioned(
      bottom: 545.h,
      left: 10.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "set-\nof-\nservices".toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                // fontFamily: "Inter",
                fontSize: 40.sp),
          ),
          Text(
            "for Uzbeks",
            style: TextStyle(
                color: const Color.fromRGBO(255, 255, 255, 1),
                // fontFamily: "Inter",
                fontWeight: FontWeight.w100,
                letterSpacing: 1.w,
                fontSize: 20.sp),
          )
        ],
      ),
    );
  }

  Widget _bosqich() {
    return Positioned(
        bottom: 400.h,
        left: 25.w,
        right: 25.w,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ro'yxatdan o'tish",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter",
                      fontSize: 30.sp),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ikkinchi bosqich",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter",
                      fontSize: 15.sp),
                )
              ],
            ),
          ],
        ));
  }

  Widget _text() {
    return Positioned(
      bottom: 345.h,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Text(
            widget.number,
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
                letterSpacing: 3.w),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "Raqamiga tasdiqlash kod yubordik.",
            style: TextStyle(
                color: Colors.black54,
                fontFamily: "Inter",
                fontSize: 11.sp,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Positioned(
        right: 50.w,
        left: 50.w,
        bottom: 100.h,
        child: Form(
            key: _formkey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      // ignore: body_might_complete_normally_nullable
                      validator: (value) {
                        if (value == null) {
                          return "Iltimos parolni kiriting:"; //   => Here we should write some logic
                        }
                        if (value.length != 4) {
                          return "Parol 4 xonadan iborat bo'lishi kerak";
                        }
                      },
                      controller: conficCode,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Inter",
                          fontSize: 16.sp),
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(4)],
                      decoration: InputDecoration(
                          label: Text(
                            "Tasdiqlash kodi:",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          hintText: "Misol: 1234",
                          hintStyle: TextStyle(
                              color: Colors.black54,
                              fontFamily: "Inter",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(33.w))),
                    ))
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8B0000),
                      minimumSize: const Size(250, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: Loading_screen_sms(
                                    number: widget.number,
                                    conficCode: conficCode.text,
                                    password: widget.password,
                                    deviceId: widget.deviceId),
                                type: PageTransitionType.fade));
                      }
                    },
                    child: Text(
                      "Keyingisi",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Inter",
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 10.w,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8B0000),
                      minimumSize: const Size(250, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Orqaga",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Inter",
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            )));
  }
}
