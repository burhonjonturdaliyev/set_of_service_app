// ignore_for_file: must_be_immutable, file_names, camel_case_types, non_constant_identifier_names, duplicate_ignore, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/registr/loading/loading_screen_reset.dart';

class Reset_password extends StatefulWidget {
  const Reset_password({super.key});

  @override
  State<Reset_password> createState() => _Reset_passwordState();
}

class _Reset_passwordState extends State<Reset_password> {
  final _formkey = GlobalKey<FormState>();
  int textstype = 1;
  TextEditingController number = TextEditingController();
  String? fullnumber;

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
      backgroundColor: Colors.white,
      body: Stack(children: [
        _big_container(),
        _samuray_photo(),
        _name_provider(),
        _context(context)
      ]),
    );
  }

  // ignore: non_constant_identifier_names
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

  // ignore: non_constant_identifier_names
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

  Widget _context(BuildContext context) {
    return Positioned(
      bottom: 180.h,
      right: 10.w,
      left: 10.w,
      child: Form(
        key: _formkey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 33.w),
          child: Column(children: [
            SizedBox(
              height: 338.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Parolni tiklash",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter",
                      fontSize: 30.sp),
                )
              ],
            ),
            SizedBox(
              height: 33.h,
            ),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Iltimos telefon raqamni kiriting!";
                    }
                    if (value.length < 12) {
                      return "Telefon raqamni to'liq kiriting!";
                    }
                    return null;
                  },
                  controller: number,
                  onChanged: (value) {
                    String pattern;
                    if (value.startsWith('9')) {
                      pattern = '+XXX-XX-XXX-XX-XX';
                    } else if (value.startsWith('8')) {
                      pattern = '+XX-XX-XXXX-XXXX';
                      setState(() {
                        textstype = 2;
                      });
                    } else {
                      pattern = '+XXX-XX-XXX-XX-XX';
                    }

                    var textIndex = 0;
                    var maskedText = '';

                    for (var patternIndex = 0;
                        patternIndex < pattern.length;
                        patternIndex++) {
                      if (pattern[patternIndex] == 'X') {
                        if (textIndex < value.length) {
                          maskedText += value[textIndex];
                          textIndex++;
                        }
                      } else {
                        maskedText += pattern[patternIndex];
                      }

                      if (textIndex >= value.length) {
                        break;
                      }
                    }

                    setState(() {
                      number.value = TextEditingValue(
                        text: maskedText,
                        selection:
                            TextSelection.collapsed(offset: maskedText.length),
                      );
                    });
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    textstype == 1
                        ? LengthLimitingTextInputFormatter(12)
                        : LengthLimitingTextInputFormatter(12)
                  ],
                  buildCounter: (
                    BuildContext context, {
                    required int currentLength,
                    required bool isFocused,
                    required int? maxLength,
                  }) =>
                      null,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone_iphone_outlined,
                        size: 25.w,
                      ),
                      label: const Text("Telefon raqamni kiriting:"),
                      fillColor: Colors.black,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21.w))),
                  keyboardType: TextInputType.number,
                ))
              ],
            ),
            SizedBox(
              height: 29.h,
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
                    await adding();
                    Navigator.push(
                        context,
                        PageTransition(
                            child: loading_reset(number: fullnumber!),
                            type: PageTransitionType.fade));
                  }
                },
                child: Text(
                  "Parolni olish",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Inter",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Tizimdan ro’yxatdan o`tgamisiz? unda",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w300,
                        fontSize: 8.sp)),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "BU YERNI BOSING",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 8.sp,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ]),
        ),
      ),
    );
  }

  adding() {
    fullnumber = number.text.replaceAll("-", "");
  }
}
