// ignore_for_file: camel_case_types, must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/models/history_model.dart';
import 'package:intl/intl.dart';

class History_money extends StatelessWidget {
  History_money({super.key});
  List<history_money_model> model = [
    history_money_model(
        manba: "8600 0804 3655 1343",
        summa: 10000,
        holat: true,
        sabab: "Tushum",
        time: DateTime.now()),
    history_money_model(
        manba: "+99890-693-65-94",
        summa: 10000,
        holat: true,
        sabab: "Paynet",
        time: DateTime(2022, 2, 1, 12, 35, 0, 5, 55))
  ];
  final white = Colors.white;

  final appbarColor = const Color(0xFF8B0000);

  final containerColor = const Color(0xff8A0000);

  final circleavatarback = const Color.fromARGB(208, 220, 163, 163);
  final backgroudColor = const Color(0xffFDDADA);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: backgroudColor),
      child: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 1.h, left: 1.w, right: 1.w),
          width: 375.w,
          height: 25.h,
          decoration: BoxDecoration(
              color: appbarColor, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Text(
              "Monitoring",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: white,
                  letterSpacing: 5.w),
            ),
          ),
        ),
        SizedBox(
          height: 9.h,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: model.length,
                itemBuilder: (context, index) {
                  return history_items(context, model[index]);
                }))
      ]),
    );
  }
}

// ignore: non_constant_identifier_names
Widget history_items(BuildContext context, history_money_model model) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 7.w),
    child: Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(91, 0, 209, 246),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 1, color: Colors.black12)),
      width: 361.w,
      height: 65.h,
      child: Padding(
        padding: EdgeInsets.all(6.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('kk:mm').format(model.time),
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter",
                      color: Colors.black),
                ),
                Text(
                  model.manba,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontFamily: "Inter"),
                ),
                Container(
                  height: 11.h,
                  width: 48.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: model.sabab.toString() == "Tushum"
                          ? Colors.green
                          : Colors.red),
                  child: Center(
                    child: Text(
                      model.sabab,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 8.sp,
                          fontFamily: "Inter"),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('yyyy:MM:dd').format(model.time),
                  style: TextStyle(color: Colors.black, fontSize: 8.sp),
                ),
                Container(
                    width: 73.w,
                    height: 11.h,
                    decoration: BoxDecoration(
                        color: model.holat == true ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: Text(
                        model.holat == true ? "O'tkazildi" : "Rad qilindi",
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )),
                Text(
                  "${model.summa.toString()} yena",
                  style: TextStyle(
                      color:
                          model.sabab == "Tushum" ? Colors.green : Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 3.sp),
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
