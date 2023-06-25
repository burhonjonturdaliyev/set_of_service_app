// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/screen/home_screen.dart';

class admin extends StatefulWidget {
  const admin({Key? key}) : super(key: key);

  @override
  State<admin> createState() => _adminState();
}

class _adminState extends State<admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/registr_screen.png"),
                fit: BoxFit.cover)),
        child: const OtpScreen(),
      ),
    );
  }
}

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  List<String> currentPin = ["", "", "", ""];
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();

  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: Colors.transparent),
  );

  int pinIndex = 0;

  checking_code() {
    check(pinOneController.text, pinTwoController.text, pinThreeController.text,
        pinFourController.text);
    pinOneController.clear();
    pinTwoController.clear();
    pinThreeController.clear();
    pinFourController.clear();
    pinIndex = 0;
  }

  @override
  void initState() {
    checking_code();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment(0.w, 0.5.h),
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  buildSecurityText(),
                  SizedBox(height: 40.0.h),
                  buildPinRow(),
                  SizedBox(
                    height: 15.h,
                  )
                ],
              ),
            ),
          ),
          buildNumberPad(),
          builButton(),
        ],
      ),
    );
  }

  builButton() {
    return Center(
      child: Container(
        padding: EdgeInsets.fromLTRB(100.w, 0.h, 100.w, 0.h),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: MaterialButton(
            splashColor: Colors.cyan[200],
            minWidth: double.infinity,
            height: 60,
            onPressed: () {
              check(pinOneController.text, pinTwoController.text,
                  pinThreeController.text, pinFourController.text);
              pinOneController.clear();
              pinTwoController.clear();
              pinThreeController.clear();
              pinFourController.clear();
              pinIndex = 0;
            },
            shape: RoundedRectangleBorder(
                // side: BorderSide(
                //     color: Colors.black
                // ),
                borderRadius: BorderRadius.circular(50)),
            color: const Color(0xFF8B0000),
            child: Text(
              "Enter",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildNumberPad() {
    return Expanded(
        child: Container(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                KeyboardNumber(
                    n: 1,
                    onPressed: () {
                      pinIndexSetup("1");
                    }),
                KeyboardNumber(
                    n: 2,
                    onPressed: () {
                      pinIndexSetup("2");
                    }),
                KeyboardNumber(
                    n: 3,
                    onPressed: () {
                      pinIndexSetup("3");
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                KeyboardNumber(
                    n: 4,
                    onPressed: () {
                      pinIndexSetup("4");
                    }),
                KeyboardNumber(
                    n: 5,
                    onPressed: () {
                      pinIndexSetup("5");
                    }),
                KeyboardNumber(
                    n: 6,
                    onPressed: () {
                      pinIndexSetup("6");
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                KeyboardNumber(
                    n: 7,
                    onPressed: () {
                      pinIndexSetup("7");
                    }),
                KeyboardNumber(
                    n: 8,
                    onPressed: () {
                      pinIndexSetup("8");
                    }),
                KeyboardNumber(
                    n: 9,
                    onPressed: () {
                      pinIndexSetup("9");
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: 60.0.w,
                  child: const MaterialButton(
                    onPressed: null,
                    child: SizedBox(),
                  ),
                ),
                KeyboardNumber(
                  n: 0,
                  onPressed: () {
                    pinIndexSetup("0");
                  },
                ),
                SizedBox(
                  width: 60.0,
                  child: MaterialButton(
                      height: 60.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      onPressed: () {
                        clearPin();
                      },
                      child: Icon(
                        Icons.dangerous_outlined,
                        color: const Color(0xFF8B0000),
                        size: 35.w,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  clearPin() {
    if (pinIndex == 0) {
      pinIndex = 0;
    } else if (pinIndex == 4) {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    } else {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    }
  }

  pinIndexSetup(String text) {
    if (pinIndex == 0) {
      pinIndex = 1;
    } else if (pinIndex < 4) {
      pinIndex++;
    }
    setPin(pinIndex, text);
    currentPin[pinIndex - 1] = text;
    String strPin = "";
    for (var e in currentPin) {
      strPin += e;
    }
    if (pinIndex == 4) print(strPin);
  }

  setPin(int n, String text) {
    switch (n) {
      case 1:
        pinOneController.text = text;
        break;
      case 2:
        pinTwoController.text = text;
        break;
      case 3:
        pinThreeController.text = text;
        break;
      case 4:
        pinFourController.text = text;
        break;
    }
  }

  buildPinRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinOneController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinTwoController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinThreeController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinFourController,
        ),
      ],
    );
  }

  void check(String one, String two, String three, String four) {
    if (one == "2" && two == "5" && three == "8" && four == "0") {
      Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
              child: Home_Page(),
              type: PageTransitionType.fade,
              curve: Curves.easeInCirc,
              duration: const Duration(seconds: 1)),
          (route) => false);
    }
  }

  buildSecurityText() {
    return Text(
      "PIN-kodni kiriting",
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.sp,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

class PINNumber extends StatelessWidget {
  final TextEditingController textEditingController;
  final OutlineInputBorder outlineInputBorder;

  // ignore: use_key_in_widget_constructors
  const PINNumber(
      {required this.textEditingController, required this.outlineInputBorder});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.0.w,
      child: TextField(
        controller: textEditingController,
        enabled: false,
        obscureText: true,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16.0.w),
          border: outlineInputBorder,
          filled: true,
          fillColor: Colors.white38,
        ),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 21.0.sp,
          color: const Color(0xFF8B0000),
        ),
      ),
    );
  }
}

class KeyboardNumber extends StatelessWidget {
  final int n;
  final Function() onPressed;

  const KeyboardNumber({super.key, required this.n, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0.w,
      height: 60.0.h,
      decoration: BoxDecoration(
        border: Border.all(width: 1.w, color: Colors.black38),
        shape: BoxShape.circle,
        //color: Colors.purpleAccent.withOpacity(0.1),
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        padding: EdgeInsets.all(8.0.w),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        height: 90.0,
        child: Text(
          "$n",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24 * MediaQuery.of(context).textScaleFactor,
            color: const Color(0xFF8B0000),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
