import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:set_of_service_app/pages/Home/airticket/page/models/Api_models.dart';

import '../../../../../models/colour_model.dart';
import '../models/air_ticket_model.dart';

class Ticket_builder extends StatelessWidget {
  Ticket_builder({super.key, required this.ticket, required this.models});
  List<Api_models> models;
  List<Ticket_list> ticket;
  List<Colour_models> colour = [
    Colour_models(
        rang2: const Color.fromARGB(204, 255, 0, 0), rang1: Colors.white),
  ];

  @override
  Widget build(BuildContext context) {
    int size = colour.length;
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
                  pochta_items(colour[index % size], models[index]),
            ),
    );
  }
}

Widget pochta_items(Colour_models colourModels, Api_models api) {
  return Padding(
    padding: EdgeInsets.only(top: 5.h, bottom: 5.0.h, left: 5.w, right: 5.w),
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
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  api.createdBy == null ? "Air ticket" : "${api.createdBy}",
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "Qayerga: ",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: api.whereTo,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w800),
                  )
                ])),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "Qayerdan: ",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: api.fromTo,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w800),
                  )
                ])),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [Text("Parvoz turi:"), Text(api.airClass!)],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text("Borish kuni: "),
                Text(DateFormat("dd.MM.yyyy").format(api.toGoDate)),
                SizedBox(
                  width: 10.w,
                ),
                Text("Qaytish kuni: "),
                Text(DateFormat("dd.MM.yyyy").format(api.returnDate))
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 5.h,
            ),
            // Row(
            //   children: [
            //     Text(
            //       "Manzil: ${models.manzil}",
            //       style: TextStyle(
            //           color: Colors.black,
            //           fontFamily: "Inter",
            //           fontWeight: FontWeight.w400,
            //           fontSize: 10.sp),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    ),
  );
}
