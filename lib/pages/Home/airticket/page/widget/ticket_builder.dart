// ignore_for_file: must_be_immutable, camel_case_types, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:set_of_service_app/pages/Home/airticket/page/models/AirticketModels.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../models/colour_model.dart';

class Ticket_builder extends StatefulWidget {
  Ticket_builder({super.key, required this.models});
  List<AirticketModels> models;

  @override
  State<Ticket_builder> createState() => _Ticket_builderState();
}

class _Ticket_builderState extends State<Ticket_builder> {
  List<Colour_models> colour = [
    Colour_models(
        rang2: const Color.fromARGB(255, 255, 0, 0),
        rang1: const Color.fromARGB(255, 255, 255, 255))
  ];
  Future<void> _urlLauncher(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (!await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      )) {
        throw "Can not launch $url";
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("image/back_screen.png"),
              fit: BoxFit.fitHeight)),
      child: widget.models.isEmpty
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
              itemCount: widget.models.length,
              itemBuilder: (context, index) =>
                  //  new_design(context, models[index])
                  pochta_items(colour[index % 1], widget.models[index]),
            ),
    );
  }

  Widget pochta_items(Colour_models colourModels, AirticketModels model) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0.h),
      child: Container(
        width: 353.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 1, color: Colors.black26),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [colourModels.rang1, colourModels.rang2]),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Avia chiptalar",
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
                        model.title!.length > 30
                            ? model.title!.substring(0, 30)
                            : model.title!,
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
                            FlutterPhoneDirectCaller.callNumber(
                                model.phoneNumber!);
                          },
                          icon: Icon(
                            Icons.call,
                            size: 40.w,
                            color: Colors.black,
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Bilet narxi: ${model.serviceFee}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            children: [
                              Text(
                                "Manzil: ${model.officeAddress!.length > 35 ? model.officeAddress!.substring(0, 35) : model.officeAddress} ...",
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
                          onPressed: () {
                            _urlLauncher(model.telegramUrl!);
                          },
                          icon: Icon(
                            Icons.telegram_outlined,
                            size: 40.w,
                            color: Colors.black,
                          ))
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 1.h,
                    color: Colors.black,
                  ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 7.w,
              ),
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
                    DateFormat("dd.MM.yyyy")
                        .format(DateTime.parse(model.createdAt!)),
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
                    model.totalViews.toString(),
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
                    model.totalStarts.toString(),
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
}
