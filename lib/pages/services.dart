// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/models/list_of_services_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/services_page/shop_xizmatlari.dart';

// ignore: camel_case_types
class List_of_services extends StatelessWidget {
  List_of_services({super.key});
  List<Services_model> model = [
    Services_model(info: "Shop xizmatlari", page: const Shop_xizmatlari())
  ];
  final white = Colors.white;

  final appbarColor = const Color(0xFF8B0000);

  final containerColor = const Color(0xff8A0000);

  final circleavatarback = const Color.fromARGB(208, 220, 163, 163);
  final backgroudColor = const Color(0xffFDDADA);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(color: backgroudColor),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              height: 25.h,
              width: 375.w,
              decoration: BoxDecoration(
                  color: appbarColor, borderRadius: BorderRadius.circular(6)),
              child: Center(
                  child: Text(
                "Barcha servislar".toUpperCase(),
                style: TextStyle(
                    fontSize: 14.sp,
                    color: white,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Inter",
                    letterSpacing: 5),
              )),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: model.length,
                itemBuilder: (context, index) {
                  return list_items(model[index], context);
                }),
          ),
        ],
      ),
    );
  }

  Widget list_items(Services_model model, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: InkWell(
        child: Container(
          height: 30.h,
          margin: const EdgeInsets.only(left: 3, right: 3),
          decoration: BoxDecoration(
              color: const Color.fromARGB(177, 228, 201, 201),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1, color: Colors.black12)),
          // ignore: prefer_const_literals_to_create_immutables
          child: Row(children: [
            Padding(
              padding: EdgeInsets.only(left: 15.0.w, top: 3.h, bottom: 3.h),
              child: Container(
                height: 24.h,
                width: 25.w,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(40, 101, 101, 1130),
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.shopping_cart_checkout,
                  color: Colors.black,
                  size: 20.w,
                ),
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Text(
              model.info,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Inter"),
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 13.w,
              color: const Color(0xff111111),
            )
          ]),
        ),
        onTap: () {
          Navigator.of(context).push(PageTransition(
            child: model.page,
            type: PageTransitionType.rightToLeft,
          ));
        },
      ),
    );
  }
}
