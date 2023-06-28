// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, must_be_immutable, prefer_const_constructors_in_immutables, use_build_context_synchronously, duplicate_ignore, unnecessary_null_comparison

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/registr/loading/loading_screen_registr.dart';
import 'package:set_of_service_app/registr/sign_in/Sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Yakuniy_bosqich extends StatefulWidget {
  Yakuniy_bosqich(
      {super.key,
      required this.number,
      required this.password,
      required this.deviceId});
  String number;
  String password;
  String deviceId;

  @override
  State<Yakuniy_bosqich> createState() => _Yakuniy_bosqichState();
}

class _Yakuniy_bosqichState extends State<Yakuniy_bosqich> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  TextEditingController surname = TextEditingController();

  TextEditingController sana = TextEditingController();

  late String tugilgan_kun;

  late SharedPreferences loginData;
  Future<void> _urlLauncher(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch $url";
    }
  }

  bool isChecked = false;
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

  void kalendar(BuildContext context) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1900),
      maxTime: DateTime.now(),
      theme: DatePickerTheme(
        backgroundColor: const Color(0xff800000), // Set the background color
        headerColor: const Color(0xff800000), // Set the header text color
        itemStyle: TextStyle(
          color: Colors.white, // Set the date text color
          fontWeight: FontWeight.bold,
          fontSize: 18.0.sp,
        ),
        cancelStyle: TextStyle(
          color: Colors.white, // Set the done button text color
          fontSize: 16.0.sp,
          fontWeight: FontWeight.bold,
        ),
        doneStyle: TextStyle(
          color: Colors.white, // Set the done button text color
          fontSize: 16.0.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      onChanged: (date) {
        if (date != null) {
          setState(() {
            sana.text = DateFormat("dd.MM.yyyy").format(date);
            tugilgan_kun = DateFormat("yyyy-MM-dd HH:mm").format(date);
          });
        }
      },
      onConfirm: (date) {
        if (date != null) {
          setState(() {
            sana.text = DateFormat("dd.MM.yyyy").format(date);
            tugilgan_kun = DateFormat("yyyy-MM-dd HH:mm").format(date);
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        _big_container(),
        _samuray_photo(),
        _name_provider(),
        _bosqich(),
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
                  "Yakuniy bosqich",
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

  Widget _content(BuildContext context) {
    return Positioned(
      bottom: 30.h,
      left: 10.w,
      right: 10.w,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 20.w),
              child: longTextfield("Ismingizni kiriting:", name),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 20.w),
              child: longTextfield("Familyangizni kiriting:", surname),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 45.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                      //color: Colors.amberAccent,
                      border:
                          Border.all(width: 1.w, color: Colors.grey.shade500),
                      borderRadius: BorderRadius.circular(33.w)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15.w,
                      ),
                      DropdownButton<String>(
                        underline: Container(),
                        value: jinsi,
                        elevation: 16,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              jinsi = newValue;
                            });
                          }
                        },
                        items: jinslari
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                shortTextfield("Tug'ilgan sana:", sana, () {
                  kalendar(context);
                })
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 45.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                      //color: Colors.amberAccent,
                      border:
                          Border.all(width: 1.w, color: Colors.grey.shade500),
                      borderRadius: BorderRadius.circular(33.w)),
                  child: Center(
                    child: DropdownButton<String>(
                      underline: Container(),
                      value: myServer,
                      elevation: 16,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            myServer = myServer;
                          });
                        }
                      },
                      items: countryNames
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                    height: 45.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                        //color: Colors.amberAccent,
                        border:
                            Border.all(width: 1.w, color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(33.w)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                            child: Text(
                          "Foydalanish shartiga roziman",
                          style: TextStyle(
                              color: isChecked ? Colors.black : Colors.black54,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                              fontSize: 11.sp),
                        )),
                        Checkbox(
                          activeColor: const Color(0xFF8B0000),
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        )
                      ],
                    ))
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 29.w),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                            "Qaysi davlatdagi xizmatlarni ko`rmoqchisiz ?",
                            style: TextStyle(
                                color: Colors.black87,
                                fontFamily: "Inter",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500))),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "Men",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: "Inter",
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500)),
                            TextSpan(
                                text: " Foydalanish shartlarini ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Inter",
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () =>
                                      _urlLauncher("https://www.youtube.com")),
                            TextSpan(
                                text: "o'qib chiqdim va to'liq qabul qilaman.",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: "Inter",
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500)),
                            TextSpan(
                                text: "Foydalanish sharti ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Inter",
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () =>
                                      _urlLauncher("https://www.youtube.com"))
                          ])),
                        ],
                      ),
                    )
                  ]),
            ),
            SizedBox(
              height: 15.h,
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
                  if (_formKey.currentState!.validate()) {
                    if (isChecked) {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: Loading_page_registr(
                                  name: name.text,
                                  surname: surname.text,
                                  password: widget.password,
                                  deviceId: widget.deviceId,
                                  number: widget.number,
                                  gender: jinsi,
                                  sana: tugilgan_kun,
                                  server: myServer),
                              type: PageTransitionType.fade));
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          clipBehavior: Clip.antiAlias,
                          backgroundColor: const Color(0xFF8B0000),
                          content: SizedBox(
                            height: 50.h,
                            width: 50.w,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 10.h,
                                  left: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: Text(
                                    "Foydalanish shartiga\nrozi ekaningizni tasdiqlang!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Inter",
                                        fontSize: 15.sp),
                                  ),
                                ),
                                Positioned(
                                    right: -10.w,
                                    top: -13.h,
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: Colors.white,
                                        size: 35.sp,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  }
                },
                child: Text(
                  "Ro'yxatdan o'tish",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Inter",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 10.h,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Tizimdan ro’yxatdan o`tgamisiz? unda ",
                    style: TextStyle(
                        color: Colors.black87,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                        fontSize: 10.sp)),
                TextSpan(
                    text: " BU YERNI BOSING ",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                            child: Sign_in(),
                            type: PageTransitionType.fade,
                            curve: Curves.bounceOut,
                          ),
                          (route) => false),
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold))
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget longTextfield(String hintText, TextEditingController controller) {
    return SizedBox(
      height: 45.h,
      width: 330.w,
      child: Row(
        children: [
          SizedBox(
            width: 10.w,
          ),
          Expanded(
              child: TextFormField(
            controller: controller,
            maxLines: 1,
            validator: (value) {
              if (value!.isEmpty) {
                return "Bo'sh joyni to'ldiring!";
              }
              return null;
            },
            style: TextStyle(
                color: Colors.black, fontFamily: "Inter", fontSize: 16.sp),
            decoration: InputDecoration(
                label: Text(
                  hintText,
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33.w))),
          ))
        ],
      ),
    );
  }

  Widget shortTextfield(String hintText, TextEditingController controller,
      VoidCallback funksiya) {
    return SizedBox(
      height: 45.h,
      width: 150.w,
      child: Row(
        children: [
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: TextFormField(
              onTap: () {
                funksiya();
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Iltimos to'ldiring!";
                }
                return null;
              },
              controller: controller,
              readOnly: true,
              maxLines: 1,
              style: TextStyle(
                  color: Colors.black, fontFamily: "Inter", fontSize: 16.sp),
              decoration: InputDecoration(
                  label: Text(
                    hintText,
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(33.w))),
            ),
          ),
        ],
      ),
    );
  }
}
