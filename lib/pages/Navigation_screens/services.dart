// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/models/list_of_services_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Home/send_money/send_money.dart';
import 'package:set_of_service_app/pages/Home/shop/shop_page.dart';
import 'package:set_of_service_app/pages/Home/tolovlar/tolovlar.dart';
import 'package:set_of_service_app/pages/Home/paynet/paynet.dart';
import 'package:set_of_service_app/pages/Home/visa/viza_xizmati.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/avia_bilet.dart';
import 'package:set_of_service_app/pages/Home/job/job.dart';
import 'package:set_of_service_app/pages/Home/pochta/pochta_xizmati.dart';

import 'package:set_of_service_app/pages/Home/house/house.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/valyuta_kurs.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/yangiliklar.dart';

// ignore: camel_case_types
class List_of_services extends StatelessWidget {
  List_of_services({super.key});
  List<Services_model> model = [
    Services_model(info: "Shop xizmatlari", page: Shop()),
    Services_model(info: "Pul yuborish xizmatlari", page: Send_money()),
    Services_model(info: "To'lovlar", page: Pul_Tolovlar()),
    Services_model(info: "Avia bilet xizmatlari", page: const Avia_bilet()),
    Services_model(info: "Pochta xizmatlari", page: Pochta_xizmati()),
    Services_model(info: "Paynet", page: const Paynet()),
    Services_model(
        info: "Viza masalalarida yordam xizmati", page: Viza_xizmati()),
    Services_model(info: "Ish topib berish xizmati", page: Ish_topish()),
    Services_model(info: "Uy-joy topib berish xizmatlari", page: Uy_joy_top()),
    Services_model(info: "Eng oxirgi yangiliklar", page: Yangiliklar()),
    Services_model(info: "Valyuta kursi", page: const Valyuta_kursi()),
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
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("image/back_screen.png"),
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter)),
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
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    model.info,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Inter"),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 13.w,
                    color: const Color(0xff111111),
                  )
                ]),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(PageTransition(
            child: model.page,
            duration: const Duration(milliseconds: 300),
            type: PageTransitionType.fade,
          ));
        },
      ),
    );
  }
}
