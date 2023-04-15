import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/screen/home_screen.dart';

class Registr_sign extends StatefulWidget {
  Registr_sign({super.key});

  @override
  State<Registr_sign> createState() => _Registr_signState();
}

class _Registr_signState extends State<Registr_sign> {
  // ignore: non_constant_identifier_names
  TextEditingController first_name = TextEditingController();

  // ignore: non_constant_identifier_names
  TextEditingController last_name = TextEditingController();

  TextEditingController time = TextEditingController();

  TextEditingController jins = TextEditingController();

  // ignore: non_constant_identifier_names
  TextEditingController davlat_servisi = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  get_country() {
    showCountryPicker(
        context: context,
        showPhoneCode: false,
        showSearch: false,
        onSelect: (Country country) {
          setState(() {
            davlat_servisi.text = country.name;
          });
        },
        countryListTheme: CountryListThemeData(
          bottomSheetHeight: MediaQuery.of(context).size.height * .75,
        ));
  }

  // ignore: non_constant_identifier_names
  get_gender() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: const Color(0xFF8B0000),
              content: SizedBox(
                height: 80.h,
                width: 150.w,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Siz qaysi jins vakilisiz:",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Inter",
                              fontSize: 16.sp),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 108, 59)),
                            onPressed: () {
                              setState(() {
                                jins.text = "Erkak";
                              });
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Erkak",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Inter",
                                  fontSize: 12.sp),
                            )),
                        SizedBox(
                          width: 30.w,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 243, 33, 103)),
                            onPressed: () {
                              setState(() {
                                jins.text = "Ayol";
                              });
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Ayol",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Inter",
                                  fontSize: 12.sp),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000),
        title: Text(
          "Ro'yxatdan o'tish",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Inter",
              fontSize: 21.sp,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              Form(
                key: _formkey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 33.w),
                  child: Column(children: [
                    CircleAvatar(
                      radius: 25.w,
                      backgroundColor: Colors.transparent,
                      backgroundImage: const AssetImage("image/samuray.png"),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
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
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                          controller: first_name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Iltimos ismingizni kiriting!";
                            }
                            return null;
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(16)
                          ],
                          decoration: InputDecoration(
                              label: const Text("Ismingizni kiriting:"),
                              fillColor: Colors.black,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21.w))),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                          controller: last_name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Iltimos familyangizni kiriting!";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              label: const Text("Familyangizni kiriting:"),
                              fillColor: Colors.black,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21.w))),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                          controller: jins,
                          readOnly: true,
                          onTap: get_gender,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Iltimos jinsingizni kiriting!";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              label: const Text("Jinsingizni kiriting:"),
                              fillColor: Colors.black,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21.w))),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                          onTap: get_country,
                          readOnly: true,
                          controller: davlat_servisi,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Iltimos qaysi davlat servisini ishlatmoqchisiz?";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              label: const Text(
                                  "Qaysi davlat servisini ishlatmoqchisiz:"),
                              fillColor: Colors.black,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21.w))),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: time,
                            readOnly: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Tug\'ilgan sanangizni kiritng';
                              }
                            },
                            keyboardType: TextInputType.none,
                            onTap: () async {
                              DateTime? choose = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now());
                              ThemeData.light().copyWith().appBarTheme;
                              if (choose != null) {
                                setState(() {
                                  time.text =
                                      DateFormat("dd.MM.yyyy").format(choose);
                                });
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21.w)),
                              labelText: "Tug'ilgan sanangizni kiriting:",
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF8B0000),
                          minimumSize: const Size(250, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(33),
                          ),
                        ),
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                PageTransition(
                                    child: const Home_Page(),
                                    type: PageTransitionType.fade),
                                (route) => false);
                          }
                        },
                        child: Text(
                          "Kirish",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Inter",
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                        )),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
