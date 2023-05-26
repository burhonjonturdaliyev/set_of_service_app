// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:set_of_service_app/models/history_model.dart';

class History_money extends StatelessWidget {
  History_money({super.key});
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
  final white = Colors.white;

  final appbarColor = const Color(0xFF8B0000);

  final containerColor = const Color(0xff8A0000);

  final circleavatarback = const Color.fromARGB(208, 220, 163, 163);
  final backgroudColor = const Color(0xffFDDADA);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(children: [
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
            "Xizmat hali yo'lga qo'yilgan emas",
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

// // ignore: non_constant_identifier_names
// Widget history_items(BuildContext context, history_money_model model) {
//   return Padding(
//     padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 7.w),
//     child: GestureDetector(
//       child: Container(
//         decoration: BoxDecoration(
//             color: const Color.fromARGB(91, 0, 209, 246),
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(width: 1, color: Colors.black12)),
//         width: 361.w,
//         height: 65.h,
//         child: Padding(
//           padding: EdgeInsets.all(6.0.w),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     DateFormat('kk:mm').format(model.time),
//                     style: TextStyle(
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: "Inter",
//                         color: Colors.black),
//                   ),
//                   Text(
//                     model.manba,
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 14.sp,
//                         fontFamily: "Inter"),
//                   ),
//                   Container(
//                     height: 11.h,
//                     width: 48.w,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                         color: model.sabab.toString() == "Tushum"
//                             ? Colors.green
//                             : Colors.red),
//                     child: Center(
//                       child: Text(
//                         model.sabab,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 8.sp,
//                             fontFamily: "Inter"),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 5.h,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     DateFormat('yyyy:MM:dd').format(model.time),
//                     style: TextStyle(color: Colors.black, fontSize: 8.sp),
//                   ),
//                   Container(
//                       width: 73.w,
//                       height: 11.h,
//                       decoration: BoxDecoration(
//                           color:
//                               model.holat == true ? Colors.green : Colors.red,
//                           borderRadius: BorderRadius.circular(16)),
//                       child: Center(
//                         child: Text(
//                           model.holat == true ? "O'tkazildi" : "Rad qilindi",
//                           style: TextStyle(
//                               fontSize: 10.sp,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white),
//                         ),
//                       )),
//                   Text(
//                     "${model.summa.toString()} yena",
//                     style: TextStyle(
//                         color:
//                             model.sabab == "Tushum" ? Colors.green : Colors.red,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                         letterSpacing: 3.sp),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       onTap: () {
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               backgroundColor: const Color(0xffFDDADA),
//               content: SizedBox(
//                 height: 300.h,
//                 child: Column(children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           "${model.summa} yena",
//                           style: TextStyle(
//                               fontSize: 16.sp,
//                               fontFamily: "Inter",
//                               letterSpacing: 1,
//                               color: Colors.black,
//                               fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                       Container(
//                           width: 80.w,
//                           height: 18.h,
//                           decoration: BoxDecoration(
//                               color: model.holat == true
//                                   ? Colors.green
//                                   : Colors.red,
//                               borderRadius: BorderRadius.circular(16)),
//                           child: Center(
//                             child: Text(
//                               model.holat == true
//                                   ? "O'tkazildi"
//                                   : "Rad qilindi",
//                               style: TextStyle(
//                                   fontSize: 10.sp,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white),
//                             ),
//                           )),
//                     ],
//                   ),
//                   Divider(
//                     thickness: 1.sp,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         "Jo'natuvchi:",
//                         style: TextStyle(
//                             color: const Color.fromARGB(145, 0, 0, 1),
//                             fontSize: 10.sp,
//                             fontFamily: "Inter",
//                             letterSpacing: 0.5.sp),
//                       )
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Text(model.name,
//                           style: TextStyle(
//                               color: const Color.fromARGB(255, 0, 0, 0),
//                               fontSize: 10.sp,
//                               fontFamily: "Inter",
//                               fontWeight: FontWeight.w600,
//                               letterSpacing: 0.5.sp)),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         "Oluvchi:",
//                         style: TextStyle(
//                             color: const Color.fromARGB(145, 0, 0, 1),
//                             fontSize: 10.sp,
//                             fontFamily: "Inter",
//                             letterSpacing: 0.5.sp),
//                       )
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Text(model.manba,
//                           style: TextStyle(
//                               color: const Color.fromARGB(255, 0, 0, 0),
//                               fontSize: 10.sp,
//                               fontFamily: "Inter",
//                               fontWeight: FontWeight.w600,
//                               letterSpacing: 0.5.sp)),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         "Komissiya:",
//                         style: TextStyle(
//                             color: const Color.fromARGB(145, 0, 0, 1),
//                             fontSize: 10.sp,
//                             fontFamily: "Inter",
//                             letterSpacing: 0.5.sp),
//                       )
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Text("${model.komissiya} yena",
//                           style: TextStyle(
//                               color: const Color.fromARGB(255, 0, 0, 0),
//                               fontSize: 10.sp,
//                               fontFamily: "Inter",
//                               fontWeight: FontWeight.w600,
//                               letterSpacing: 0.5.sp)),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         "Kurs:",
//                         style: TextStyle(
//                             color: const Color.fromARGB(145, 0, 0, 1),
//                             fontSize: 10.sp,
//                             fontFamily: "Inter",
//                             letterSpacing: 0.5.sp),
//                       )
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Text("${model.kurs} sum",
//                           style: TextStyle(
//                               color: const Color.fromARGB(255, 0, 0, 0),
//                               fontSize: 10.sp,
//                               fontFamily: "Inter",
//                               fontWeight: FontWeight.w600,
//                               letterSpacing: 0.5.sp)),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         "Qabul qilingan summa:",
//                         style: TextStyle(
//                             color: const Color.fromARGB(145, 0, 0, 1),
//                             fontSize: 10.sp,
//                             fontFamily: "Inter",
//                             letterSpacing: 0.5.sp),
//                       )
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Text("${model.convert_sum} sum",
//                           style: TextStyle(
//                               color: const Color.fromARGB(255, 0, 0, 0),
//                               fontSize: 10.sp,
//                               fontFamily: "Inter",
//                               fontWeight: FontWeight.w600,
//                               letterSpacing: 0.5.sp)),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         "Sana:",
//                         style: TextStyle(
//                             color: const Color.fromARGB(145, 0, 0, 1),
//                             fontSize: 10.sp,
//                             fontFamily: "Inter",
//                             letterSpacing: 0.5.sp),
//                       )
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Text(DateFormat("dd.MM.yyyy kk:mm:ss").format(model.time),
//                           style: TextStyle(
//                               color: const Color.fromARGB(255, 0, 0, 0),
//                               fontSize: 10.sp,
//                               fontFamily: "Inter",
//                               fontWeight: FontWeight.w600,
//                               letterSpacing: 0.5.sp)),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                 ]),
//               ),
//             );
//           },
//         );
//       },
//     ),
//   );
// }
