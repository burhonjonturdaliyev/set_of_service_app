// ignore_for_file: must_be_immutable, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:set_of_service_app/pages/Home/visa/models/modelsViza.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../models/colour_model.dart';

class Visa_support_widget extends StatelessWidget {
  Visa_support_widget({super.key, required this.models});
  List<vizaModels> models;
  List<Colour_models> colour = [
    Colour_models(
        rang2: const Color.fromARGB(255, 255, 0, 0),
        rang1: const Color.fromARGB(255, 255, 255, 255)),
  ];

  Future<void> _urlLauncher(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: models.length,
        itemBuilder: (context, index) =>
            visa_items(models[index], colour[index % 1]));
  }

  Widget visa_items(vizaModels models, Colour_models colourModels) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0.h),
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
                    "Viza",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp),
                  )
                ],
              ),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "To'lov: ${models.serviceFee}",
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
                            "Manzil: ${models.officeAddress}",
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
                        _urlLauncher(models.telegramUrl);
                      },
                      icon: Icon(
                        Icons.telegram,
                        size: 40.w,
                        color: Colors.black,
                      ))
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
                    models.totalViews.toString(),
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
