import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Functions {
  String country1;
  String country2;
  Functions({required this.country1, required this.country2});
  void cheking(context) {
    if (country1 == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color(0xFF8B0000),
            content: SizedBox(
                height: 85.h,
                width: 60.h,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Qayerdan Ketishingizni kiriting",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Inter",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 243, 236, 235)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("OK",
                            style: TextStyle(
                                fontFamily: "Inter",
                                color: const Color(0xFF8B0000),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold)))
                  ],
                )),
          );
        },
      );
    } else {
      if (country2 == null) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: const Color(0xFF8B0000),
              content: SizedBox(
                  height: 85.h,
                  width: 60.h,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Qayerga Qaytishingizni kiriting",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Inter",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 243, 236, 235)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("OK",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  color: const Color(0xFF8B0000),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold)))
                    ],
                  )),
            );
          },
        );
      }
    }
  }
}
