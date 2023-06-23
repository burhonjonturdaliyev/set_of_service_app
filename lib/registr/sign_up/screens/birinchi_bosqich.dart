// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names, duplicate_ignore, unnecessary_null_comparison, use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/registr/sign_up/screens/ikkinchi_bosqich.dart';
import 'package:http/http.dart' as http;
import '../../../const_api/api.dart';
import '../model/step_model.dart';
import 'package:device_info_plus/device_info_plus.dart';

class birinchi_bosqich extends StatefulWidget {
  const birinchi_bosqich({super.key});

  @override
  State<birinchi_bosqich> createState() => _birinchi_bosqichState();
}

class _birinchi_bosqichState extends State<birinchi_bosqich> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController number = TextEditingController();

  TextEditingController password = TextEditingController();

  // ignore: non_constant_identifier_names
  TextEditingController cofic_password = TextEditingController();
  late String fullnumber;
  bool visible = true;
  bool checking = false;
  int textstype = 1;

  late String deviceId;

  getMacAddress() async {
    print("Kirdi\n\n\n");
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      setState(() {
        deviceId = androidInfo.id;
      });
      print('Android MAC Address: $deviceId');
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      setState(() {
        deviceId = iosInfo.identifierForVendor!;
      });
      print('IOS MAC Address: $deviceId');
    }
  }

  void _visible() {
    setState(() {
      visible = !visible;
    });
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
                      top: 40.h,
                      child: Text(
                        "Ushbu raqam allaqachon ro'yxatdan o'tgan!\nIltimos, boshqa telefon nomeringizni kiriting!",
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

  String? _passwordMatchValidator(String? value) {
    if (value != password.text) {
      return "Parollar mos emas!";
    }
    return null;
  }

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
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: ikkinchi_bosqich(
                  number: fullnumber,
                  password: password.text,
                  deviceId: deviceId,
                ),
                type: PageTransitionType.fade,
                childCurrent: const birinchi_bosqich()),
            (route) => true);
      } else {
        dialog();
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that occurred during the request
    }
  }

  @override
  void initState() {
    _visible();
    getMacAddress();
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
      backgroundColor: Colors.white,
      body: Stack(children: [
        _big_container(),
        _samuray_photo(),
        _name_provider(),
        _bosqich(),
        _context()
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
                  "Birinchi bosqich",
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

  Widget _context() {
    return Positioned(
      bottom: 0.h,
      right: 10.w,
      left: 10.w,
      child: Form(
        key: _formkey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 33.w),
          child: Column(children: [
            SizedBox(
              height: 300.h,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Telefon nomerni kiriting";
                      }
                      if (value.length < 9) {
                        return "Iltimos oxirigacha kiriting";
                      }
                      return null;
                    },
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
                        pattern = '+XXX-XX-XXX-XX-XX'; // Default pattern
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
                          selection: TextSelection.collapsed(
                              offset: maskedText.length),
                        );
                      });
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      textstype == 1
                          ? LengthLimitingTextInputFormatter(12)
                          : LengthLimitingTextInputFormatter(12)
                    ],
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
                  ),
                )
              ],
            ),
            SizedBox(
              height: 29.h,
            ),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: password,
                  onChanged: (value) {
                    value = password.text;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Iltimos parolni kitiring";
                    }
                    if (value.length < 8) {
                      return "Iltimos eng kamida 8 ta belgili parol kiriting";
                    }
                    return _passwordMatchValidator(value);
                  },
                  obscureText: visible,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 25.w,
                      ),
                      suffixIcon: IconButton(
                          onPressed: _visible,
                          icon: visible == false
                              ? Icon(
                                  Icons.visibility_outlined,
                                  size: 25.w,
                                )
                              : Icon(
                                  Icons.visibility_off_outlined,
                                  size: 25.w,
                                )),
                      label: const Text("Parolni kiriting:"),
                      fillColor: Colors.black,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21.w))),
                ))
              ],
            ),
            SizedBox(
              height: 29.h,
            ),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: cofic_password,
                  onChanged: (value) {
                    value = cofic_password.text;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Iltimos parolni kitiring";
                    }
                    if (value.length < 8) {
                      return "Iltimos eng kamida 8 ta belgili parol kiriting";
                    }

                    return _passwordMatchValidator(value);
                  },
                  obscureText: visible,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 25.w,
                      ),
                      suffixIcon: IconButton(
                          onPressed: _visible,
                          icon: visible == false
                              ? Icon(
                                  Icons.visibility_outlined,
                                  size: 25.w,
                                )
                              : Icon(
                                  Icons.visibility_off_outlined,
                                  size: 25.w,
                                )),
                      label: const Text("Parolni tasdiqlang:"),
                      fillColor: Colors.black,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21.w))),
                ))
              ],
            ),
            SizedBox(
              height: 30.h,
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
                  await adding();
                  if (_formkey.currentState!.validate()) {
                    await step1(Step1_model(
                        password: password.text, phoneNumber: fullnumber));
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
                      number.clear();
                      password.clear();
                      cofic_password.clear();
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
    if (number != null) {
      fullnumber = number.text.replaceAll("-", "");
    }
  }
}
