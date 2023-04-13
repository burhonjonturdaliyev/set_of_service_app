import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/registr/Reset_password_screen.dart';
import 'package:set_of_service_app/registr/Sign_up_screen.dart';
import 'package:set_of_service_app/screen/home_screen.dart';

class Sign_in extends StatefulWidget {
  Sign_in({super.key});

  @override
  State<Sign_in> createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {
  TextEditingController number = TextEditingController();

  TextEditingController password = TextEditingController();

  bool visible = true;

  final _formkey = GlobalKey<FormState>();

  void _visible() {
    setState(() {
      visible = !visible;
    });
  }

  void sign_in(){}

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
      body: SizedBox(
        height: 812.h,
        width: 375.w,
        child: Stack(children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("image/registr_screen.png"),
              fit: BoxFit.fitWidth,
            )),
          ),
          SingleChildScrollView(
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
                        controller: number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Telefon nomerni kiriting";
                          }
                          if (value.length < 9) {
                            return "Iltimos oxirigacha kiriting";
                          }
                          if (value != "906936594") {
                            return "Bazada bunday raqam mavjud emas!";
                          }
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(90)
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
                        controller: password,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Iltimos parolni kitiring";
                          }
                          if (value.length < 8) {
                            return "Iltimos eng kamida 8 ta belgili parol kiriting";
                          }
                          if (value != "01022003") {
                            return "Parol yoki raqam xato!";
                          }
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(PageTransition(
                                child: Reset_password(),
                                type: PageTransitionType.fade));
                            number.clear();
                            password.clear();
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
                        number.clear();
                        password.clear();
                      },
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
                                child: Sign_up(),
                                type: PageTransitionType.fade));
                            number.clear();
                            password.clear();
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
          ),
        ]),
      ),
    );
  }
}
