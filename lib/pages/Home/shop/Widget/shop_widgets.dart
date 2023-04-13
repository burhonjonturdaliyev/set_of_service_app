import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/models/colour_model.dart';
import 'package:set_of_service_app/models/shop_models.dart';
import 'package:set_of_service_app/pages/Home/shop/additional/additional_page_shop.dart';
import 'package:set_of_service_app/pages/Home/shop/shop_pages/oziq_ovqat.dart';

// ignore: camel_case_types, must_be_immutable
class List_builder extends StatelessWidget {
  // ignore: non_constant_identifier_names
  List_builder({super.key, required this.info_List});
  // ignore: non_constant_identifier_names
  List<Shop_models> info_List;
  List<Colour_models> colour = [
    Colour_models(
        rang2: const Color.fromARGB(255, 255, 0, 0),
        rang1: const Color.fromARGB(255, 255, 255, 255)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: info_List.length,
        itemBuilder: (context, index) {
          return builder_items(context, info_List[index], colour[index % 1]);
        });
  }
}

// ignore: non_constant_identifier_names
Widget builder_items(
    BuildContext context, Shop_models infoList, Colour_models colourModels) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.0.h),
    child: InkWell(
      onTap: () => Navigator.of(context).push(PageTransition(
          child: Additional_page_shop(
              name: infoList.name,
              number: infoList.number,
              delevering: infoList.delevering,
              address: infoList.address,
              time: infoList.time,
              count: infoList.count,
              rate: infoList.rate,
              information: infoList.information,
              image: infoList.image),
          type: PageTransitionType.bottomToTop,
          childCurrent: Oziq_ovqat())),
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
              padding: const EdgeInsets.all(15.0),
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
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        infoList.name,
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
                                infoList.number);
                          },
                          icon: Icon(
                            Icons.call,
                            size: 40.w,
                            color: Colors.black,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
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
                                "Yetkazib berish: ${infoList.delevering}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              Text(
                                "Manzil: ${infoList.address}",
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
                            Icons.telegram_outlined,
                            size: 40.w,
                            color: Colors.black,
                          ))
                    ],
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
                    DateFormat("dd.MM.yyyy").format(infoList.time),
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
                    "${infoList.count}",
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
                    "${infoList.rate}",
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
