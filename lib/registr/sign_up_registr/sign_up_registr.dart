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
  TextEditingController first_name = TextEditingController();

  TextEditingController last_name = TextEditingController();

  TextEditingController time = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                    height: 33.h,
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
                        },
                        inputFormatters: [LengthLimitingTextInputFormatter(16)],
                        decoration: InputDecoration(
                            label: const Text("Ismingizni kiriting:"),
                            fillColor: Colors.black,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(21.w))),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
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
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: time,
                          keyboardType: TextInputType.none,
                          onTap: () async {
                            DateTime? choose = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now());
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
                            labelText: "Sanani tanlang",
                            hintText: "Tug'ilgan sana",
                            hintStyle: TextStyle(
                                color: Colors.black26,
                                fontSize: 16.sp,
                                fontFamily: "Inter"),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
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
    );
  }
}
