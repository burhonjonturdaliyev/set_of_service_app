// ignore_for_file: camel_case_types, duplicate_ignore, must_be_immutable, avoid_print, use_build_context_synchronously, non_constant_identifier_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/const_api/api.dart';
import 'package:set_of_service_app/registr/sign_in/Sign_in_screen.dart';

import 'model/air_ticket_info.dart';
import 'page/air_ticket_list.dart';
import 'page/country_picker.dart';
import 'widget/arriving.dart';

// ignore: camel_case_types
class Avia_bilet extends StatefulWidget {
  Avia_bilet({Key? key, required this.userId}) : super(key: key);
  int userId;

  @override
  State<Avia_bilet> createState() => _Avia_biletState();
}

class _Avia_biletState extends State<Avia_bilet> {
  TextEditingController ketishSanasi = TextEditingController();
  TextEditingController qaytishSanasi = TextEditingController();
  TextEditingController ketish = TextEditingController(),
      qaytish = TextEditingController();
  TextEditingController country1 = TextEditingController();
  TextEditingController country2 = TextEditingController();
  List<String> parvoz = ["Economy", "Business"];

  String klass = "Economy";
  int man = 0;
  int woman = 0;
  int child = 0;
  late int hammasi;

  final _formfield = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  man_adding_function() {
    setState(() {
      man++;
    });
  }

  // ignore: non_constant_identifier_names
  woman_adding_function() {
    setState(() {
      woman++;
    });
  }

  // ignore: non_constant_identifier_names
  child_adding_function() {
    setState(() {
      child++;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> info_ticket(air_ticket_info model) async {
    try {
      Dio dio = Dio();
      final response = await dio.post(
        Api().putAirticket,
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: json.encode(model.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Navigator.push(
          context,
          PageTransition(
            child: Air_ticket_list(),
            type: PageTransitionType.fade,
          ),
        );
      } else if (response.statusCode == 403) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => Sign_in(),
          ),
          (route) => false,
        );
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000),
        centerTitle: true,
        title: Text(
          "Air ticket",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Inter",
            fontSize: 20.sp,
            letterSpacing: 5.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: 375.w,
        height: 812.h,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("image/back_screen.png"),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formfield,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 355.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.w),
                        color: const Color.fromARGB(255, 243, 236, 235),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Country_picker(
                          country1: country1,
                          country2: country2,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 355.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21.w),
                      color: const Color.fromARGB(255, 243, 236, 235),
                    ),
                    child: Arriving(
                        ketish: ketish,
                        qaytish: qaytish,
                        ketishSanasi: ketishSanasi,
                        qaytishSanasi: qaytishSanasi),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 355.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21.w),
                      color: const Color.fromARGB(255, 243, 236, 235),
                    ),
                    child: Center(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                      child: Row(
                        children: [
                          Text(
                            "$man",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                              onPressed: man_adding_function,
                              icon: Icon(
                                Icons.man_outlined,
                                size: 35.w,
                              )),
                          Text(
                            "$woman",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                              onPressed: woman_adding_function,
                              icon: Icon(
                                Icons.woman_outlined,
                                size: 35.w,
                              )),
                          Text(
                            "$child",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                              onPressed: child_adding_function,
                              icon: Icon(
                                Icons.child_friendly_outlined,
                                size: 35.w,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: double.infinity,
                              width: 2.w,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Parvoz klassi",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Inter",
                                          fontSize: 10.sp),
                                    )
                                  ],
                                ),
                                DropdownButton(
                                  value: klass,
                                  elevation: 16,
                                  onChanged: (newValue) {
                                    setState(() {
                                      klass = newValue!;
                                    });
                                  },
                                  items: parvoz.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(355.w, 66.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21.w)),
                        backgroundColor: const Color(0xFF8B0000)),
                    onPressed: () async {
                      if (_formfield.currentState!.validate()) {
                        await hamma();
                        info_ticket(air_ticket_info(
                            airClass: klass,
                            from: country1.text,
                            passenger: hammasi,
                            returnDate:
                                qaytish.text == "" ? null : qaytish.text,
                            toGoDate: ketish.text,
                            userId: widget.userId,
                            whereTo: country2.text));
                      }
                    },
                    child: Text(
                      "Keyingisi",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF8B0000),
        child: Icon(
          Icons.restart_alt_rounded,
          color: Colors.white,
          size: 35.w,
        ),
        onPressed: () {
          setState(() {
            var temp = country1;
            country1 = country2;
            country2 = temp;
          });
        },
      ),
    );
  }

  hamma() {
    setState(() {
      hammasi = child + woman + man;
    });
  }
}
