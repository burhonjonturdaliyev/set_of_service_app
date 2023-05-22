// ignore_for_file: must_be_immutable, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:set_of_service_app/pages/Home/airticket/page/models/AirticketModels.dart';

import '../../../../../models/colour_model.dart';

class Ticket_builder extends StatelessWidget {
  Ticket_builder({super.key, required this.models});
  List<AirticketModels> models;
  List<Colour_models> colour = [
    Colour_models(
        rang2: const Color.fromARGB(255, 255, 0, 0),
        rang1: const Color.fromARGB(255, 255, 255, 255))
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("image/back_screen.png"),
              fit: BoxFit.fitHeight)),
      child: models.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hozirda hech qanday avia biletlar\nmavjud emas!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54,
                        fontFamily: "Inter",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: models.length,
              itemBuilder: (context, index) =>
                  //  new_design(context, models[index])
                  pochta_items(context, colour[index % 1], models[index]),
            ),
    );
  }
}

Widget pochta_items(
    BuildContext context, Colour_models colourModels, AirticketModels models) {
  return Padding(
    padding: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
    child: Container(
      width: 353.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(33.w),
        border: Border.all(width: 1, color: Colors.black26),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [colourModels.rang1, colourModels.rang2]),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.w, top: 10.h),
            child: Row(
              children: [
                Text(
                  "Avia bilet",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  models.title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w800),
                )),
                SizedBox(
                  width: 20.w,
                ),
                IconButton(
                    onPressed: () {
                      FlutterPhoneDirectCaller.callNumber(models.phoneNumber);
                    },
                    icon: Icon(
                      Icons.call,
                      size: 40.w,
                      color: Colors.black,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              children: [
                Text(
                  "Manzil: ${models.officeAddress}",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp),
                )
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 7.w, bottom: 5.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  size: 8.w,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  DateFormat("dd.MM.yyyy").format(models.updatedAt),
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 8.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Icon(
                  Icons.visibility,
                  size: 12.w,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  models.totalViews.toString(),
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 8.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Icon(
                  Icons.star_rate_rounded,
                  size: 12.w,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  models.totalStarts.toString(),
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 8.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

// Widget new_design(BuildContext context, AirticketModels api) {
//   return Padding(
//     padding: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
//     child: Container(
//       width: 353.w,
//       height: 200.h,
//       decoration: BoxDecoration(
//           border: Border.all(width: 1.w, color: Colors.black26),
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(33.w)),
//       child: Stack(children: [
//         Positioned(
//             top: 0,
//             left: 0,
//             bottom: 0,
//             child: Container(
//               height: 150.h,
//               width: 80.w,
//               decoration: BoxDecoration(
//                   color: const Color(0xFF8B0000),
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(33.w),
//                     topLeft: Radius.circular(33.w),
//                   )),
//             )),
//         Positioned(
//             top: 10,
//             left: 100.w,
//             right: 20.w,
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Qayerdan",
//                           style: TextStyle(
//                               color: Colors.black54,
//                               fontFamily: "Inter",
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16.sp),
//                         ),
//                         Text(api.fromTo!,
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontFamily: "Inter",
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16.sp))
//                       ],
//                     ),
//                     Icon(
//                       Icons.arrow_right_alt_outlined,
//                       color: Colors.black,
//                       size: 46.w,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Qayerga",
//                           style: TextStyle(
//                               color: Colors.black54,
//                               fontFamily: "Inter",
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16.sp),
//                         ),
//                         Text(api.whereTo!,
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontFamily: "Inter",
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16.sp))
//                       ],
//                     ),
//                   ],
//                 ),
//                 const Divider(
//                   thickness: 1,
//                   color: Colors.grey,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Text(
//                               "Ketish",
//                               style: TextStyle(
//                                   color: Colors.black54,
//                                   fontFamily: "Inter",
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 14.sp),
//                             ),
//                             SizedBox(
//                               width: 3.w,
//                             ),
//                             Transform.rotate(
//                               angle: 13,
//                               child: Icon(
//                                 Icons.airplanemode_active_outlined,
//                                 color: Colors.amber[900],
//                                 size: 20.w,
//                               ),
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: 5.h,
//                         ),
//                         Text(
//                           DateFormat("hh:mm a").format(api.toGoDate),
//                           style: TextStyle(
//                               color: Colors.amber[900],
//                               fontFamily: "Inter",
//                               fontWeight: FontWeight.bold,
//                               fontSize: 14.sp),
//                         ),
//                         SizedBox(
//                           height: 5.h,
//                         ),
//                         Text(DateFormat("EEEE, dd-MMMM").format(api.toGoDate)),
//                       ],
//                     ),
//                     Container(
//                       width: 1.w,
//                       height: 70.h,
//                       decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(100.w)),
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Row(
//                           children: [
//                             Transform.rotate(
//                               angle: -35,
//                               child: Icon(
//                                 Icons.airplanemode_active_outlined,
//                                 color: Colors.green[900],
//                                 size: 20.w,
//                               ),
//                             ),
//                             Text(
//                               "Qaytish",
//                               style: TextStyle(
//                                   color: Colors.black54,
//                                   fontFamily: "Inter",
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 14.sp),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 5.h,
//                         ),
//                         Text(
//                           DateFormat("hh:mm a").format(api.returnDate),
//                           style: TextStyle(
//                               color: Colors.green[900],
//                               fontFamily: "Inter",
//                               fontWeight: FontWeight.bold,
//                               fontSize: 14.sp),
//                         ),
//                         SizedBox(
//                           height: 5.h,
//                         ),
//                         Text(
//                             DateFormat("EEEE, dd-MMMM").format(api.returnDate)),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const Divider(
//                   thickness: 1,
//                   color: Colors.grey,
//                 ),
//                 Row(
//                   children: [
//                     RichText(
//                         text: TextSpan(children: [
//                       TextSpan(
//                           text: "Yo'lovchilar soni: ",
//                           style: TextStyle(
//                               color: Colors.black54,
//                               fontFamily: "Inter",
//                               fontWeight: FontWeight.w600,
//                               fontSize: 14.sp)),
//                       TextSpan(
//                           text: api.passenger.toString(),
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontFamily: "Inter",
//                               fontWeight: FontWeight.bold,
//                               fontSize: 14.sp))
//                     ])),
//                   ],
//                 ),
//               ],
//             )),
//         Positioned(
//             top: api.id == 10 ? 90.h : 80.h,
//             left: -15.w,
//             child: Transform(
//                 alignment: Alignment.center,
//                 transform: Matrix4.rotationZ(-0.5 * pi),
//                 child: Text(
//                   "Avia bilet ${api.id}",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontFamily: "Inter",
//                       fontWeight: FontWeight.bold,
//                       fontSize: api.id == 10 ? 18.sp : 23.sp),
//                 )))
//       ]),
//     ),
//   );
// }
