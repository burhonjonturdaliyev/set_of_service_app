import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/models/send_money_naqt_model.dart';

import '../models/colour_model.dart';

// ignore: camel_case_types, must_be_immutable
class Send_money_naqt_widget extends StatelessWidget {
  // ignore: non_constant_identifier_names
  Send_money_naqt_widget({super.key, required this.naqt_model});
  // ignore: non_constant_identifier_names
  List<Naqt_pul_model> naqt_model;
  List<Colour_models> colour = [
    Colour_models(
        rang1: const Color.fromARGB(204, 8, 250, 230),
        rang2: Colors.transparent),
    Colour_models(
        rang1: const Color.fromARGB(206, 50, 53, 224),
        rang2: Colors.transparent),
    Colour_models(
        rang1: const Color.fromARGB(206, 21, 242, 69),
        rang2: Colors.transparent),
    Colour_models(
        rang1: const Color.fromARGB(206, 174, 23, 234),
        rang2: Colors.transparent),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: naqt_model.length,
        itemBuilder: (context, index) =>
            Container_builder_naqt(colour[index % 4], naqt_model[index]));
  }
}

// ignore: non_constant_identifier_names
Widget Container_builder_naqt(
    Colour_models colourModels, Naqt_pul_model models) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.0.h),
    child: Container(
      width: 353.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.w),
        border: Border.all(width: 1, color: Colors.black26),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [colourModels.rang1, colourModels.rang2]),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(top: 15.0.h, bottom: 25.h, left: 15.w, right: 15.w),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Pul yuborish",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  models.name,
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
                      FlutterPhoneDirectCaller.callNumber(models.phone_number);
                    },
                    icon: Icon(
                      Icons.call,
                      size: 40.w,
                      color: Colors.black,
                    ))
              ],
            ),
            SizedBox(
              height: 20.h,
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
                          "Kurs: 1\$ = ${models.kurs} yena",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "Manzil: ${models.address}",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp),
                        )
                      ],
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.telegram,
                      size: 40.w,
                      color: Colors.black,
                    ))
              ],
            )
          ],
        ),
      ),
    ),
  );
}
