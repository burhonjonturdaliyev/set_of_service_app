// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../screen/home_screen.dart';
import '../../reset/Reset_password_screen.dart';
import '../../sign_up/Sign_up_screen.dart';

// ignore: must_be_immutable
class DesignSignIn extends StatefulWidget {
  DesignSignIn(
      {super.key,
      required this.number,
      required this.password,
      required this.visible});
  TextEditingController number;

  TextEditingController password;

  bool visible;

  @override
  State<DesignSignIn> createState() => _DesignSignInState();
}

class _DesignSignInState extends State<DesignSignIn> {
  late SharedPreferences logindata;
  late bool new_user;
  final _formkey = GlobalKey<FormState>();

  void _visible() {
    setState(() {
      widget.visible = !widget.visible;
    });
  }

  void check_login() async {
    logindata = await SharedPreferences.getInstance();
    new_user = (logindata.getBool("login") ?? true);
    print("new user");
    if (new_user == false) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Home_Page(),
          ));
    }
  }

  @override
  void initState() {
    super.initState();
    check_login();
  }

  @override
  void dispose() {
    super.dispose();
    widget.number.dispose();
    widget.password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      _big_container(),
      _samuray_photo(),
      _name_provider(),
      _context()
    ]);
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

  Widget _context() {
    return Positioned(
      bottom: 40.h,
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
                  "Tizimga kirish",
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
                  controller: widget.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Telefon nomerni kiriting";
                    }
                    if (value.length < 9) {
                      return "Iltimos oxirigacha kiriting";
                    }
                    // if (value != "906936594") {
                    //   return "Bazada bunday raqam mavjud emas!";
                    // }
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11)
                  ],
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone_iphone_outlined,
                        size: 25.w,
                      ),
                      prefix: const Text(
                        "+998 ",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Inter",
                        ),
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
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: widget.password,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Iltimos parolni kiriting!";
                    }
                    if (value.length < 8) {
                      return "Parol mos kelmadi!";
                    }
                  },
                  obscureText: widget.visible,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 25.w,
                      ),
                      suffixIcon: IconButton(
                          onPressed: _visible,
                          icon: widget.visible == false
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(PageTransition(
                          child: Reset_password(),
                          type: PageTransitionType.fade));
                      widget.number.clear();
                      widget.password.clear();
                    },
                    child: Text(
                      "Parolni unutdingizmi?",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w900,
                          fontSize: 8.sp),
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
                onLongPress: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                          child: const Home_Page(),
                          type: PageTransitionType.fade),
                      (route) => false);
                  widget.number.clear();
                  widget.number.clear();
                },
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    String number = widget.number.text;
                    String password = widget.password.text;
                    print("Succesfully");
                    logindata.setBool("login", false);
                    logindata.setString("number", number);
                    logindata.setString("password", password);

                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const Home_Page(),
                        ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Ro’yxatdan o’tish uchun",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w300,
                        fontSize: 8.sp)),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(PageTransition(
                          child: Sign_up(), type: PageTransitionType.fade));
                      widget.number.clear();
                      widget.password.clear();
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
}