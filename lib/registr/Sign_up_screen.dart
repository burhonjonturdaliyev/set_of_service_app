import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/screen/home_screen.dart';

class Sign_up extends StatefulWidget {
  Sign_up({super.key});

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController number = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController cofic_password = TextEditingController();
  bool visible = true;

  void _visible() {
    setState(() {
      visible = !visible;
    });
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
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/registr_screen.png"),
                fit: BoxFit.cover)),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 33.w),
                child: Column(children: [
                  SizedBox(
                    height: 300.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Ro`yxatdan o`tish",
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
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(9)
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
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              PageTransition(
                                  child: Home_Page(),
                                  type: PageTransitionType.bottomToTopPop,
                                  childCurrent: Sign_up()),
                              (route) => false);
                        }
                      },
                      child: Text(
                        "Ro’yxatdan uchun",
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
          ),
        ),
      ),
    );
  }
}
