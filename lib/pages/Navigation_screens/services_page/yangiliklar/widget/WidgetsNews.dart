// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/models/newsModels.dart';

import '../models/info_count.dart';
import 'NewsPageWidget.dart';

class NewsWidgets {
  Widget catagory({
    required List<CatagoryModels> list,
    required NewsModel model,
    required BuildContext context,
  }) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8.0.h),
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  PageTransition(
                      child:
                          NewPageWidget(type: list[0].type, name: list[0].name),
                      type: PageTransitionType.fade)),
              child: Container(
                height: 50.h,
                width: MediaQuery.of(context).size.width * 90,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(177, 228, 201, 201),
                    borderRadius: BorderRadius.circular(13.w)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.newspaper_outlined,
                          color: Colors.black54,
                          size: 25.w,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          list[0].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Inter",
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30.w,
                        ),
                        Container(
                          height: 35.h,
                          width: 35.h,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                  width: 0.5.w, color: Colors.black54),
                              borderRadius: BorderRadius.circular(100.w)),
                          child: Center(
                              child: Text(
                            model.object!.tREND.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Inter",
                              fontSize: 13.sp,
                            ),
                          )),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black54,
                          size: 25.w,
                        ),
                        SizedBox(
                          width: 10.w,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0.h),
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  PageTransition(
                      child:
                          NewPageWidget(type: list[1].type, name: list[1].name),
                      type: PageTransitionType.fade)),
              child: Container(
                height: 50.h,
                width: MediaQuery.of(context).size.width * 90,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(177, 228, 201, 201),
                    borderRadius: BorderRadius.circular(13.w)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.newspaper_outlined,
                          color: Colors.black54,
                          size: 25.w,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          list[1].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Inter",
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30.w,
                        ),
                        Container(
                          height: 35.h,
                          width: 35.h,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                  width: 0.5.w, color: Colors.black54),
                              borderRadius: BorderRadius.circular(100.w)),
                          child: Center(
                              child: Text(
                            model.object!.uZBEMBASSY.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Inter",
                              fontSize: 13.sp,
                            ),
                          )),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black54,
                          size: 25.w,
                        ),
                        SizedBox(
                          width: 10.w,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0.h),
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  PageTransition(
                      child:
                          NewPageWidget(type: list[2].type, name: list[2].name),
                      type: PageTransitionType.fade)),
              child: Container(
                height: 50.h,
                width: MediaQuery.of(context).size.width * 90,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(177, 228, 201, 201),
                    borderRadius: BorderRadius.circular(13.w)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.newspaper_outlined,
                          color: Colors.black54,
                          size: 25.w,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          list[2].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Inter",
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30.w,
                        ),
                        Container(
                          height: 35.h,
                          width: 35.h,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                  width: 0.5.w, color: Colors.black54),
                              borderRadius: BorderRadius.circular(100.w)),
                          child: Center(
                              child: Text(
                            model.object!.uYAJ.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Inter",
                              fontSize: 13.sp,
                            ),
                          )),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black54,
                          size: 25.w,
                        ),
                        SizedBox(
                          width: 10.w,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0.h),
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  PageTransition(
                      child:
                          NewPageWidget(type: list[3].type, name: list[3].name),
                      type: PageTransitionType.fade)),
              child: Container(
                height: 50.h,
                width: MediaQuery.of(context).size.width * 90,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(177, 228, 201, 201),
                    borderRadius: BorderRadius.circular(13.w)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.newspaper_outlined,
                          color: Colors.black54,
                          size: 25.w,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          list[3].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Inter",
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30.w,
                        ),
                        Container(
                          height: 35.h,
                          width: 35.h,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                  width: 0.5.w, color: Colors.black54),
                              borderRadius: BorderRadius.circular(100.w)),
                          child: Center(
                              child: Text(
                            model.object!.tOP.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Inter",
                              fontSize: 13.sp,
                            ),
                          )),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black54,
                          size: 25.w,
                        ),
                        SizedBox(
                          width: 10.w,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0.h),
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  PageTransition(
                      child:
                          NewPageWidget(type: list[4].type, name: list[4].name),
                      type: PageTransitionType.fade)),
              child: Container(
                height: 50.h,
                width: MediaQuery.of(context).size.width * 90,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(177, 228, 201, 201),
                    borderRadius: BorderRadius.circular(13.w)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.newspaper_outlined,
                          color: Colors.black54,
                          size: 25.w,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          list[4].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Inter",
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30.w,
                        ),
                        Container(
                          height: 35.h,
                          width: 35.h,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                  width: 0.5.w, color: Colors.black54),
                              borderRadius: BorderRadius.circular(100.w)),
                          child: Center(
                              child: Text(
                            model.object!.oFFICAL.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Inter",
                              fontSize: 13.sp,
                            ),
                          )),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black54,
                          size: 25.w,
                        ),
                        SizedBox(
                          width: 10.w,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0.h),
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  PageTransition(
                      child:
                          NewPageWidget(type: list[5].type, name: list[5].name),
                      type: PageTransitionType.fade)),
              child: Container(
                height: 50.h,
                width: MediaQuery.of(context).size.width * 90,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(177, 228, 201, 201),
                    borderRadius: BorderRadius.circular(13.w)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.newspaper_outlined,
                          color: Colors.black54,
                          size: 25.w,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          list[5].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Inter",
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30.w,
                        ),
                        Container(
                          height: 35.h,
                          width: 35.h,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                  width: 0.5.w, color: Colors.black54),
                              borderRadius: BorderRadius.circular(100.w)),
                          child: Center(
                              child: Text(
                            model.object!.nORMAL.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Inter",
                              fontSize: 13.sp,
                            ),
                          )),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black54,
                          size: 25.w,
                        ),
                        SizedBox(
                          width: 10.w,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0.h),
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  PageTransition(
                      child:
                          NewPageWidget(type: list[6].type, name: list[6].name),
                      type: PageTransitionType.fade)),
              child: Container(
                height: 50.h,
                width: MediaQuery.of(context).size.width * 90,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(177, 228, 201, 201),
                    borderRadius: BorderRadius.circular(13.w)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.newspaper_outlined,
                          color: Colors.black54,
                          size: 25.w,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          list[6].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Inter",
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30.w,
                        ),
                        Container(
                          height: 35.h,
                          width: 35.h,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                  width: 0.5.w, color: Colors.black54),
                              borderRadius: BorderRadius.circular(100.w)),
                          child: Center(
                              child: Text(
                            model.object!.oTHERS.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Inter",
                              fontSize: 13.sp,
                            ),
                          )),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black54,
                          size: 25.w,
                        ),
                        SizedBox(
                          width: 10.w,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0.h),
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  PageTransition(
                      child:
                          NewPageWidget(type: list[7].type, name: list[7].name),
                      type: PageTransitionType.fade)),
              child: Container(
                height: 50.h,
                width: MediaQuery.of(context).size.width * 90,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(177, 228, 201, 201),
                    borderRadius: BorderRadius.circular(13.w)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.newspaper_outlined,
                          color: Colors.black54,
                          size: 25.w,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          list[7].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Inter",
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30.w,
                        ),
                        Container(
                          height: 35.h,
                          width: 35.h,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                  width: 0.5.w, color: Colors.black54),
                              borderRadius: BorderRadius.circular(100.w)),
                          child: Center(
                              child: Text(
                            model.object!.fREQUENTLYQUESTIONS.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Inter",
                              fontSize: 13.sp,
                            ),
                          )),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black54,
                          size: 25.w,
                        ),
                        SizedBox(
                          width: 10.w,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//   Widget itemsDesign(
//     BuildContext context,
//     CatagoryModels models,
//   ) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 8.0.h),
//       child: InkWell(
//         onTap: () => Navigator.push(
//             context,
//             PageTransition(
//                 child: NewPageWidget(type: models.type, name: models.name),
//                 type: PageTransitionType.fade)),
//         child: Container(
//           height: 50.h,
//           width: MediaQuery.of(context).size.width * 90,
//           decoration: BoxDecoration(
//               color: const Color.fromARGB(177, 228, 201, 201),
//               borderRadius: BorderRadius.circular(13.w)),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   SizedBox(
//                     width: 10.w,
//                   ),
//                   Icon(
//                     Icons.newspaper_outlined,
//                     color: Colors.black54,
//                     size: 25.w,
//                   ),
//                   SizedBox(
//                     width: 15.w,
//                   ),
//                   Text(
//                     models.name,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontFamily: "Inter",
//                       fontSize: 13.sp,
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   SizedBox(
//                     width: 30.w,
//                   ),
//                   Container(
//                     height: 35.h,
//                     width: 35.h,
//                     decoration: BoxDecoration(
//                         color: Colors.transparent,
//                         border: Border.all(width: 0.5.w, color: Colors.black54),
//                         borderRadius: BorderRadius.circular(100.w)),
//                     child: Center(
//                         child: models.count != null
//                             ? Text(
//                                 models.count.toString(),
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontFamily: "Inter",
//                                   fontSize: 13.sp,
//                                 ),
//                               )
//                             : SizedBox(
//                                 height: 15.h,
//                                 width: 15.w,
//                                 child: const CircularProgressIndicator(
//                                   strokeWidth: 2,
//                                   color: Color(0xFF8B0000),
//                                 ),
//                               )),
//                   ),
//                   Icon(
//                     Icons.arrow_forward_ios_rounded,
//                     color: Colors.black54,
//                     size: 25.w,
//                   ),
//                   SizedBox(
//                     width: 10.w,
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
