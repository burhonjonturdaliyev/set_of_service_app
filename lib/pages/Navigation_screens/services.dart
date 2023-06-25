// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable, non_constant_identifier_names, camel_case_types, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/models/list_of_services_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Home/send_money/send_money.dart';
import 'package:set_of_service_app/pages/Home/shop/shop_page.dart';
import 'package:set_of_service_app/pages/Home/tolovlar/tolovlar.dart';
import 'package:set_of_service_app/pages/Home/paynet/paynet.dart';
import 'package:set_of_service_app/pages/Home/visa/viza_xizmati.dart';
import 'package:set_of_service_app/pages/Home/airticket/avia_bilet.dart';
import 'package:set_of_service_app/pages/Home/job/job.dart';
import 'package:set_of_service_app/pages/Home/pochta/pochta_xizmati.dart';
import 'package:set_of_service_app/pages/Home/house/house.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/currency/valyuta_kurs.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/GlobalNews.dart';

// ignore: camel_case_types
class List_of_services extends StatefulWidget {
  List_of_services({super.key, required this.userId});
  int userId;

  @override
  State<List_of_services> createState() => _List_of_servicesState();
}

class _List_of_servicesState extends State<List_of_services> {
  late List<Services_model> model;

  final white = Colors.white;

  final appbarColor = const Color(0xFF8B0000);

  final containerColor = const Color(0xff8A0000);

  final circleavatarback = const Color.fromARGB(208, 220, 163, 163);

  final backgroudColor = const Color(0xffFDDADA);

  @override
  void initState() {
    super.initState();
    model = [
      Services_model(
          info: "Shop xizmatlari",
          page: Shop(
            userId: widget.userId,
          ),
          image: "assets/service/xarid.png"),
      Services_model(
          info: "Pul yuborish xizmatlari",
          page: const Send_money(),
          image: "assets/service/pul_yuborish.png"),
      Services_model(
          info: "To'lovlar",
          page: const Pul_Tolovlar(),
          image: "assets/service/tolov.png"),
      Services_model(
          info: "Avia bilet xizmatlari",
          page: Avia_bilet(
            userId: widget.userId,
          ),
          image: "assets/service/bilet.png"),
      Services_model(
          info: "Pochta xizmatlari",
          page: const Pochta_xizmati(),
          image: "assets/service/pochta.png"),
      Services_model(
          info: "Paynet",
          page: const Paynet(),
          image: "assets/service/paynet.png"),
      Services_model(
          info: "Viza masalalarida yordam xizmati",
          page: const Viza_xizmati(),
          image: "assets/service/viza.png"),
      Services_model(
          info: "Ish topib berish xizmati",
          page: const Ish_topish(),
          image: "assets/service/ish.png"),
      Services_model(
          info: "Uy-joy topib berish xizmatlari",
          page: const Uy_joy_top(),
          image: "assets/service/uy.png"),
      Services_model(
          info: "Eng oxirgi yangiliklar",
          page: GlobalNews(
            userId: widget.userId,
          ),
          image: "assets/service/yangiliklar.png"
          //Yangiliklar()
          ),
      Services_model(
          info: "Valyuta kursi",
          page: const Valyuta_kursi(),
          image: "assets/service/valyuta.png"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  Row(
                    children: [
                      Image.asset(
                        model.image,
                        width: 18.w,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        model.info,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Inter"),
                      ),
                    ],
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
