// ignore_for_file: camel_case_types, non_constant_identifier_names, must_be_immutable

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class addItems extends StatefulWidget {
  const addItems({super.key});

  @override
  State<addItems> createState() => _addItemsState();
}

class _addItemsState extends State<addItems> {
  TextEditingController mavzu = TextEditingController();

  TextEditingController telegram = TextEditingController();

  TextEditingController telfon = TextEditingController();

  TextEditingController qoshimcha_raqam = TextEditingController();

  TextEditingController manzil = TextEditingController();

  TextEditingController batafsil = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  int radioButton = 1;
  bool checkBox = false;

  Future<void> _urlLauncher(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch $url";
    }
  }

  Widget getImage() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50.h,
        width: 75.w,
        decoration: BoxDecoration(
            color: const Color(0xABB9AEAE),
            borderRadius: BorderRadius.circular(5.w)),
        child: Center(
            child: Icon(
          Icons.add_photo_alternate_outlined,
          color: const Color(0xFF8B0000),
          size: 30.sp,
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Nooziq-ovqat",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              letterSpacing: 5.w,
              fontWeight: FontWeight.bold,
              fontFamily: "Inter"),
        ),
        backgroundColor: const Color(0xFF8B0000),
      ),
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2.h, left: 2.w, right: 2.w),
                  child: Container(
                    height: 25.h,
                    decoration: BoxDecoration(
                        color: const Color(0xFF8B0000),
                        borderRadius: BorderRadius.circular(5.w)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "E'lon berish",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                                letterSpacing: 5.w),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 11.w, vertical: 7.h),
                  child: Column(children: [
                    Row(
                      children: [
                        Text(
                          "Rasm qo'shish",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Inter",
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "E'longa bermoqchi bo'lgan mahsulotingizni rasmini yuklang.\nRasm soni 4 tadan oshmasligi kerak !!!",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                              fontSize: 11.sp),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getImage(),
                        getImage(),
                        getImage(),
                        getImage(),
                      ],
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "Mavzu qo'shish",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Inter",
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          "E’lon mavzusini yozing.\nEtibor bering !!! xxxx tadan ko’p belgi e’lon uchun ajratilgan joydan oshib ketadi va ko’yinmay qolishi mumkin !!!  ",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                              fontSize: 11.sp),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    shortTextfield("Mavzu", mavzu),
                    shortTextfield("Telegram @username", telegram),
                    numberTextfield("Telefon raqam", telfon),
                    numberTextfield("Qo'shimcha raqam", qoshimcha_raqam),
                    shortTextfield("Manzil", manzil),
                    bigTextfield("Batafsil ma'lumot", batafsil),
                    Row(
                      children: [
                        Text(
                          "Yetkazib berasizmi?",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Inter",
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Ha",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter",
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Radio(
                          value: 1,
                          groupValue: radioButton,
                          onChanged: (value) {
                            setState(() {
                              radioButton = value as int;
                            });
                          },
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Yo'q",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter",
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Radio(
                          value: 2,
                          groupValue: radioButton,
                          onChanged: (value) {
                            setState(() {
                              radioButton = value as int;
                            });
                          },
                        ),
                      ],
                    ),
                    shartlari(),
                    SizedBox(
                      height: 5.h,
                    ),
                    uploadButton()
                  ]),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget radioButtonField(int value, int groupvalue) {
    return Radio(
      value: value,
      groupValue: groupvalue,
      onChanged: (value) {
        setState(() {
          groupvalue = value!;
        });
      },
    );
  }

  Widget shartlari() {
    return Row(
      children: [
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "E'lon berish shartlari",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Inter",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () => _urlLauncher("https://office-project.uz/")),
          TextSpan(
              text: "ga roziman",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Inter",
                  fontSize: 14.sp))
        ])),
        Checkbox(
          value: checkBox,
          activeColor: const Color(0xFF8B0000),
          onChanged: (value) {
            setState(() {
              checkBox = value!;
            });
          },
        )
      ],
    );
  }

  Widget uploadButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF8B0000),
          minimumSize: const Size(250, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21),
          ),
        ),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            Navigator.pop(context);
          }
        },
        child: Text(
          "E'lonni joylash",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Inter",
              fontSize: 20.sp,
              fontWeight: FontWeight.bold),
        ));
  }

  Widget bigTextfield(String label, controller) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Iltimos ${label.toLowerCase()}ni kiriting!";
              }
              return null;
            },
            controller: controller,
            maxLines: 3,
            decoration: InputDecoration(
                label: Text(label),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.w, color: const Color(0xFF8B0000)),
                    borderRadius: BorderRadius.circular(12.w))),
          ))
        ],
      ),
    );
  }

  Widget numberTextfield(String label, controller) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Iltimos ${label.toLowerCase()}ni kiriting!";
              }
              return null;
            },
            controller: controller,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            maxLines: 1,
            decoration: InputDecoration(
                prefix: const Text(
                  "+",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Inter",
                  ),
                ),
                label: Text(label),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.w, color: const Color(0xFF8B0000)),
                    borderRadius: BorderRadius.circular(12.w))),
          ))
        ],
      ),
    );
  }

  Widget shortTextfield(String label, controller) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Iltimos ${label.toLowerCase()}ni kiriting!";
              }
              return null;
            },
            controller: controller,
            maxLines: 1,
            decoration: InputDecoration(
                label: Text(label),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.w, color: const Color(0xFF8B0000)),
                    borderRadius: BorderRadius.circular(12.w))),
          ))
        ],
      ),
      // Container(
      //   height: 35.h,
      //   decoration: BoxDecoration(
      //       border: Border.all(width: 1.w, color: Colors.black54),
      //       borderRadius: BorderRadius.circular(9.w)),
      //   child: Padding(
      //     padding: EdgeInsets.only(left: 15.w),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         Expanded(
      //             child: TextFormField(
      //           controller: controller,
      //           maxLines: 1,
      //           decoration:
      //               InputDecoration(hintText: hint, border: InputBorder.none),
      //         ))
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
