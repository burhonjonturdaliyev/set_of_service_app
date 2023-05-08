// ignore_for_file: non_constant_identifier_names, duplicate_ignore, must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../registr/sign_up_registr.dart';

class AuthNumberCode extends StatefulWidget {
  AuthNumberCode({super.key, required this.number});
  String? number;

  @override
  State<AuthNumberCode> createState() => _AuthNumberCodeState();
}

class _AuthNumberCodeState extends State<AuthNumberCode> {
  String? code;
  Timer? _timer;
  bool _visible = false;

  final TextEditingController _first = TextEditingController();

  final TextEditingController _second = TextEditingController();

  final TextEditingController _third = TextEditingController();

  final TextEditingController _four = TextEditingController();
  final TextEditingController _five = TextEditingController();
  int _secondsRemaining = 120;

  final _formkey = GlobalKey<FormState>();
  adding() {
    setState(() {
      code = _first.text + _second.text + _third.text + _four.text + _five.text;
    });
  }

  _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (_secondsRemaining < 1) {
            timer.cancel();
            _secondsRemaining = 120;
            _visible = true;
          } else {
            _secondsRemaining = _secondsRemaining - 1;
          }
        },
      ),
    );
  }

  checking() {
    adding();
    if (code == "12345") {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Registr_sign(),
      ));
    } else {
      debugPrint("Incorrect. Plz try again");
    }
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Form(
          key: _formkey,
          child: Stack(
            children: [
              Positioned(
                top: -10.h,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      "animations/sms_animation.json",
                      width: MediaQuery.of(context).size.width * .5,
                      repeat: _visible,
                    ),
                  ],
                ),
              ),
              infor(),
              _codeFully(),
              resubmit(),
              submitButton()
            ],
          )),
    );
  }

  // ignore: non_constant_identifier_names

  Widget infor() {
    return Positioned(
        top: 220.h,
        left: 0,
        right: 0,
        child: Column(
          children: [
            Text(
              "Iltimos xabarlar bo'limini tekshiring",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter",
                  fontSize: 18.sp),
            ),
            SizedBox(
              height: 7.h,
            ),
            Text(
              "Biz sizga ushbu +998${widget.number ?? ""} raqamiga kod yuborildik",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Inter",
                  fontSize: 15.sp),
            ),
          ],
        ));
  }

  Widget _codeFully() {
    return Positioned(
      top: 310.h,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _textfielOTP(context, true, false, _first),
            _textfielOTP(context, false, false, _second),
            _textfielOTP(context, false, false, _third),
            _textfielOTP(context, false, false, _four),
            _textfielOTP(context, false, true, _five),
          ],
        ),
      ),
    );
  }

  Widget resubmit() {
    return Positioned(
      bottom: 50.h,
      right: 0,
      left: 0,
      child: _visible
          ? MaterialButton(
              onPressed: () {
                _startTimer();
                setState(() {
                  _visible = false;
                });
              },
              child: Text(
                "Kodni qayta yuborish",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Inter",
                    fontSize: 16.sp),
              ),
            )
          : Text(
              "${_secondsRemaining.toString()} sekund",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Inter",
                  fontSize: 16.sp),
            ),
    );
  }

  Widget submitButton() {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff800000)),
          onPressed: checking,
          child: Text(
            "Kirish",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontFamily: "Inter",
                fontSize: 19.sp),
          ),
        ));
  }

  _textfielOTP(BuildContext context, bool first, last,
      TextEditingController controller) {
    return SizedBox(
      height: 45.h,
      width: 35.w,
      child: AspectRatio(
        aspectRatio: 1,
        child: TextFormField(
          style: TextStyle(
              color: const Color(0xff800000),
              fontFamily: "Inter",
              fontWeight: FontWeight.bold,
              fontSize: 10.sp),
          controller: controller,
          onChanged: (value) {
            if (value.isEmpty) {}
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          autofocus: true,
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
              counter: const Offstage(),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.w),
                  borderSide: BorderSide(width: 2.w, color: Colors.black12)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.w),
                  borderSide:
                      BorderSide(width: 2.w, color: const Color(0xff800000)))),
        ),
      ),
    );
  }
}
