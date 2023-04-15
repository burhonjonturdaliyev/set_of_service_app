import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
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

  @override
  void initState() {
    super.initState();
  }

  void sign_in(String number, password) async {
    try {
      Response response = await post(Uri.parse("https://reqres.in/api/login"),
          body: {"email": number, "password": password});

      if (response.statusCode == 200) {
        print("Succesfully done");
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: const Home_Page(), type: PageTransitionType.fade),
            (route) => false);
      } else {
        error_disp();
        print("Maybe next time");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void error_disp() {
    AlertDialog(
      content: SizedBox(
        height: 50.h,
        width: 50.w,
        child: const CircleAvatar(
          backgroundColor: Colors.red,
          child: Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
        ),
      ),
    );
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
                  controller: number,
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
                      return "Iltimos parolni kiriting!";
                    }
                    if (value.length < 8) {
                      return "Parol mos kelmadi!";
                    }
                    // if (value != "01022003") {
                    //   return "Parol yoki raqam xato!";
                    // }
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
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => Home_Page(),
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
    );
  }
}
