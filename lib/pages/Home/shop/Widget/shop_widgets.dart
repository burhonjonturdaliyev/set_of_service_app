// ignore_for_file: camel_case_types, duplicate_ignore, empty_statements

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/models/colour_model.dart';
import 'package:set_of_service_app/pages/Home/shop/additional/additional_page_shop.dart';
import 'package:set_of_service_app/pages/Home/shop/model/foods_model.dart';
import 'package:set_of_service_app/pages/Home/shop/shop_pages/oziq_ovqat.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: camel_case_types, must_be_immutable
class List_builder extends StatefulWidget {
  // ignore: non_constant_identifier_names
  List_builder({super.key, required this.model});
  // ignore: non_constant_identifier_names
  List<foods_model> model;

  @override
  State<List_builder> createState() => _List_builderState();
}

class _List_builderState extends State<List_builder> {
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
        itemCount: widget.model.length,
        itemBuilder: (context, index) {
          return builder_items(context, widget.model[index], colour[index % 1]);
        });
  }

// ignore: non_constant_identifier_names
  Widget builder_items(
      BuildContext context, foods_model model, Colour_models colourModels) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0.h),
      child: InkWell(
        onTap: () => Navigator.of(context).push(PageTransition(
            child: Additional_page_shop(
                id: model.id,
                title: model.title,
                subTitle: model.subTitle,
                juridical: model.juridical,
                serviceFee: model.serviceFee,
                phoneNumber: model.phoneNumber,
                telegramUrl: model.telegramUrl,
                officeAddress: model.officeAddress,
                active: model.active,
                serviceCategoryId: model.serviceCategoryId,
                businessProfileId: model.businessProfileId,
                totalStarts: model.totalStarts,
                totalViews: model.totalViews,
                createdAt: model.createdAt,
                updatedAt: model.updatedAt),
            type: PageTransitionType.rightToLeftWithFade,
            curve: Curves.easeInBack,
            childCurrent: const Oziq_ovqat())),
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
                          "Shop",
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
                          ((model.title).length <= 30)
                              ? model.title
                              : model.title.substring(0, 30),
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
                                  model.phoneNumber);
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
                                  "Yetkazib berish: Yo'q",
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
                                  "Manzil: ${model.officeAddress}",
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
                              _urlLauncher(model.telegramUrl);
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
                padding: EdgeInsets.symmetric(horizontal: 2.w),
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
                      DateFormat("dd.MM.yyyy").format(model.createdAt),
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
      ),
    );
  }
}
