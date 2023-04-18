import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:set_of_service_app/pages/Home/airticket/page/models/Api_models.dart';

class Ticket_builder extends StatelessWidget {
  Ticket_builder({super.key, required this.models});
  List<Api_models> models;

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
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : ListView.builder(
              itemCount: models.length,
              itemBuilder: (context, index) =>
                  new_design(context, models[index])
              // pochta_items(context, colour[index % size], models[index]),
              ),
    );
  }
}

// Widget pochta_items(
//     BuildContext context, Colour_models colourModels, Api_models api) {
//   dialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: const Color(0xffFDDADA),
//           content: SizedBox(
//             height: 320.h,
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               RichText(
//                   text: TextSpan(children: [
//                 TextSpan(
//                   text: "Qayerdan: ",
//                   style: TextStyle(
//                       color: Colors.black54,
//                       fontFamily: "Inter",
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w600),
//                 ),
//                 TextSpan(
//                   text: api.fromTo!,
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontFamily: "Inter",
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.w600),
//                 )
//               ])),
//             ]),
//           ),
//         );
//       },
//     );
//   }

//   return Padding(
//     padding: EdgeInsets.only(top: 5.h, bottom: 5.0.h, left: 5.w, right: 5.w),
//     child: InkWell(
//       onTap: dialog,
//       child: Container(
//         width: 353.w,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(33.w),
//           border: Border.all(width: 1, color: Colors.black26),
//           gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [colourModels.rang1, colourModels.rang2]),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     api.createdBy == null ? "Air ticket" : "${api.createdBy}",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontFamily: "Inter",
//                         fontWeight: FontWeight.w400,
//                         fontSize: 10.sp),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 5.h,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   RichText(
//                       text: TextSpan(children: [
//                     TextSpan(
//                       text: "Qayerga: ",
//                       style: TextStyle(
//                           color: Colors.black54,
//                           fontSize: 18.sp,
//                           fontFamily: "Inter",
//                           fontWeight: FontWeight.w500),
//                     ),
//                     TextSpan(
//                       text: api.whereTo,
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 24.sp,
//                           fontFamily: "Inter",
//                           fontWeight: FontWeight.w800),
//                     )
//                   ])),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   RichText(
//                       text: TextSpan(children: [
//                     TextSpan(
//                       text: "Qayerdan: ",
//                       style: TextStyle(
//                           color: Colors.black54,
//                           fontSize: 18.sp,
//                           fontFamily: "Inter",
//                           fontWeight: FontWeight.w500),
//                     ),
//                     TextSpan(
//                       text: api.fromTo,
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 24.sp,
//                           fontFamily: "Inter",
//                           fontWeight: FontWeight.w800),
//                     )
//                   ])),
//                 ],
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Row(
//                 children: [Text("Parvoz turi:"), Text(api.airClass!)],
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Row(
//                 children: [
//                   Text(
//                     "Borish kuni: ",
//                   ),
//                   Text(DateFormat("dd.MM.yyyy").format(api.toGoDate)),
//                   SizedBox(
//                     width: 10.w,
//                   ),
//                   Text("Qaytish kuni: "),
//                   Text(DateFormat("dd.MM.yyyy").format(api.returnDate))
//                 ],
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               SizedBox(
//                 height: 5.h,
//               ),
//               // Row(
//               //   children: [
//               //     Text(
//               //       "Manzil: ${models.manzil}",
//               //       style: TextStyle(
//               //           color: Colors.black,
//               //           fontFamily: "Inter",
//               //           fontWeight: FontWeight.w400,
//               //           fontSize: 10.sp),
//               //     )
//               //   ],
//               // )
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }

Widget new_design(BuildContext context, Api_models api) {
  return Padding(
    padding: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
    child: Container(
      width: 353.w,
      height: 200.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(33.w)),
      child: Stack(children: [
        Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: 150.h,
              width: 80.w,
              decoration: BoxDecoration(
                  color: const Color(0xFF8B0000),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(33.w),
                    topLeft: Radius.circular(33.w),
                  )),
            )),
        Positioned(
            top: 10,
            left: 100.w,
            right: 20.w,
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Qayerdan",
                          style: TextStyle(
                              color: Colors.black54,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp),
                        ),
                        Text(api.fromTo!,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp))
                      ],
                    ),
                    Icon(
                      Icons.arrow_right_alt_outlined,
                      color: Colors.black,
                      size: 46.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Qayerga",
                          style: TextStyle(
                              color: Colors.black54,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp),
                        ),
                        Text(api.whereTo!,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp))
                      ],
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Ketish",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Transform.rotate(
                              angle: 13,
                              child: Icon(
                                Icons.airplanemode_active_outlined,
                                color: Colors.amber[900],
                                size: 20.w,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          DateFormat("hh:mm a").format(api.toGoDate),
                          style: TextStyle(
                              color: Colors.amber[900],
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(DateFormat("EEEE, dd-MMMM").format(api.toGoDate)),
                      ],
                    ),
                    Container(
                      width: 1.w,
                      height: 70.h,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(100.w)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Transform.rotate(
                              angle: -35,
                              child: Icon(
                                Icons.airplanemode_active_outlined,
                                color: Colors.green[900],
                                size: 20.w,
                              ),
                            ),
                            Text(
                              "Qaytish",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          DateFormat("hh:mm a").format(api.returnDate),
                          style: TextStyle(
                              color: Colors.green[900],
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                            DateFormat("EEEE, dd-MMMM").format(api.returnDate)),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Yo'lovchilar soni: ",
                          style: TextStyle(
                              color: Colors.black54,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp)),
                      TextSpan(
                          text: api.passenger.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp))
                    ])),
                  ],
                ),
              ],
            )),
        Positioned(
            top: api.id == 10 ? 90.h : 80.h,
            left: -15.w,
            child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(-0.5 * pi),
                child: Text(
                  "Avia bilet ${api.id}",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      fontSize: api.id == 10 ? 18.sp : 23.sp),
                )))
      ]),
    ),
  );
}
