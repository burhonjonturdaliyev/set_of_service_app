import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Home/pochta/Widget/pochta_widgets.dart';
import 'package:set_of_service_app/models/pochta_models.dart';

class Pochta_xizmati extends StatelessWidget {
  Pochta_xizmati({super.key});
  List<pochta_models> models = [
    pochta_models(
        name: "Omonat-service pochta xizmati ",
        delevaring: "Bor",
        phone_number: "+9989063965",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
    pochta_models(
        name: "Omonat-service pochta xizmati ",
        delevaring: "Bor",
        phone_number: "+9989063965",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
    pochta_models(
        name: "Omonat-service pochta xizmati ",
        delevaring: "Bor",
        phone_number: "+9989063965",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
    pochta_models(
        name: "Omonat-service pochta xizmati ",
        delevaring: "Bor",
        phone_number: "+9989063965",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
    pochta_models(
        name: "Omonat-service pochta xizmati ",
        delevaring: "Bor",
        phone_number: "+9989063965",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
    pochta_models(
        name: "Omonat-service pochta xizmati ",
        delevaring: "Bor",
        phone_number: "+9989063965",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFDDADA),
      appBar: AppBar(
          backgroundColor: const Color(0xFF8B0000),
          centerTitle: true,
          title: Text(
            "Pochta xizmati",
            style: TextStyle(
                fontSize: 20.sp,
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,
                letterSpacing: 5.w),
          )),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/back_screen.png"), fit: BoxFit.cover)),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 16.h, left: 10.w, bottom: 5.h),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Pochta xizmati ro’yxati ro’yxati:",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter"),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Pochta_widgets(info_List: models),
          ))
        ]),
      ),
    );
  }
}
