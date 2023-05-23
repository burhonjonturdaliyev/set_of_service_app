// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class Yakuniy_bosqich extends StatefulWidget {
  Yakuniy_bosqich({super.key});

  @override
  State<Yakuniy_bosqich> createState() => _Yakuniy_bosqichState();
}

class _Yakuniy_bosqichState extends State<Yakuniy_bosqich> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  TextEditingController surname = TextEditingController();

  TextEditingController jins = TextEditingController();

  TextEditingController sana = TextEditingController();

  TextEditingController server = TextEditingController();

  void listItems1() {
    print("Hello tashket1");
  }

  void kalendar(BuildContext context) async {
    DateTime? choose = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    ThemeData.light().copyWith().appBarTheme;
    if (choose != null) {
      setState(() {
        sana.text = DateFormat("dd.MM.yyyy").format(choose);
      });
    }
  }

  void servers() {
    PopupMenuButton<String>(
        itemBuilder: (context) => [
              PopupMenuItem(
                  value: "Japan",
                  child: Text(
                    "Japan",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600),
                  )),
              PopupMenuItem(
                  value: "Uzbekistan",
                  child: Text(
                    "Uzbekistan",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600),
                  )),
              PopupMenuItem(
                  value: "Korea",
                  child: Text(
                    "Korea",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600),
                  )),
              PopupMenuItem(
                  value: "Yevropa",
                  child: Text(
                    "Yevropa",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600),
                  )),
              PopupMenuItem(
                  value: "Amerika",
                  child: Text(
                    "Ameria",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600),
                  )),
              PopupMenuItem(
                  value: "Avstraliya",
                  child: Text(
                    "Avstraliya",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600),
                  )),
              PopupMenuItem(
                  value: "Xitoy",
                  child: Text(
                    "Xitoy",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600),
                  )),
              PopupMenuItem(
                  value: "Japan",
                  child: Text(
                    "Japan",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600),
                  )),
            ]);
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
            longTextfield("Ismingizni kiriting:", name),
            SizedBox(
              height: 10.h,
            ),
            longTextfield("Familyangizni kiriting:", surname),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                shortTextfield("Jinsni tanlang:", jins, listItems1),
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
                shortTextfield("Davlatni tanlang:", server, () {
                  print("dwd");
                }),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                    height: 45.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                        //color: Colors.amberAccent,
                        border:
                            Border.all(width: 2.w, color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(33.w)),
                    child: const Center(
                      child: Text("Some thing"),
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
                                  ..onTap = () => print("object")),
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
                                  ..onTap = () => print("Bosildi"))
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
                  if (_formKey.currentState!.validate()) {}
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
                      ..onTap = () => print("Bu yerni bosing bosildi"),
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
    return Container(
      height: 45.h,
      width: 310.w,
      decoration: BoxDecoration(
          //color: Colors.amberAccent,
          border: Border.all(width: 2.w, color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(33.w)),
      child: Row(
        children: [
          SizedBox(
            width: 10.w,
          ),
          Expanded(
              child: TextFormField(
            controller: controller,
            maxLines: 1,
            style: TextStyle(
                color: Colors.black, fontFamily: "Inter", fontSize: 16.sp),
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                    color: Colors.black54,
                    fontFamily: "Inter",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500),
                border: InputBorder.none),
          ))
        ],
      ),
    );
  }

  Widget shortTextfield(String hintText, TextEditingController controller,
      VoidCallback funksiya) {
    return Container(
      height: 45.h,
      width: 150.w,
      decoration: BoxDecoration(
          //color: Colors.amberAccent,
          border: Border.all(width: 2.w, color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(33.w)),
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
              controller: controller,
              readOnly: true,
              maxLines: 1,
              style: TextStyle(
                  color: Colors.black, fontFamily: "Inter", fontSize: 16.sp),
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                      color: Colors.black54,
                      fontFamily: "Inter",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
