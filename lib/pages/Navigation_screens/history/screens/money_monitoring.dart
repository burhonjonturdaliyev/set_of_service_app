// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../models/history_model.dart';

class Money_monitoring extends StatelessWidget {
  Money_monitoring({super.key, required this.userId});
  int userId;
  final appbarColor = const Color(0xFF8B0000);

  final containerColor = const Color(0xff8A0000);

  final circleavatarback = const Color.fromARGB(208, 220, 163, 163);

  final backgroudColor = const Color(0xffFDDADA);
  List<history_money_model> model = [
    history_money_model(
        convert_sum: 1500.0,
        komissiya: 100,
        kurs: 70,
        name: "Burhonjon Turdialiev",
        manba: "8600 0804 3655 1343",
        summa: 10000,
        holat: true,
        sabab: "Tushum",
        time: DateTime.now()),
    history_money_model(
        convert_sum: 1500.0,
        komissiya: 100,
        kurs: 70,
        name: "Burhonjon Turdialiev",
        manba: "+99890-693-65-94",
        summa: 10000,
        holat: false,
        sabab: "Paynet",
        time: DateTime(2022, 2, 1, 12, 35, 0, 5, 55))
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 9.h,
      ),
      Expanded(child: error()
          // ListView.builder(
          //     itemCount: model.length,
          //     itemBuilder: (context, index) {
          //       return history_items(context, model[index]);
          //     }),
          )
    ]);
  }

  Widget error() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Xizmat hali yo'lga qo'yilmagan!",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: "Inter",
                fontSize: 25.sp),
          ),
          SizedBox(
            height: 25.h,
          ),
          Lottie.asset("animations/error.json", repeat: false, animate: false)
        ]);
  }
}
