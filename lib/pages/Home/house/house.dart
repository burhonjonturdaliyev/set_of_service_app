import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/models/house_model.dart';
import 'package:set_of_service_app/pages/Home/house/Widget/house_widgets.dart';

// ignore: camel_case_types
class Uy_joy_top extends StatelessWidget {
  Uy_joy_top({super.key});
  List<house_models> models = [
    house_models(
        turi: "Home",
        name: "Uy topib berish  xizmati",
        phone_number: "+998906935544",
        tolov: "Bor",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
    house_models(
        turi: "Home",
        name: "Uy topib berish  xizmati",
        phone_number: "+998906935544",
        tolov: "Bor",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
    house_models(
        turi: "Home",
        name: "Uy topib berish  xizmati",
        phone_number: "+998906935544",
        tolov: "Bor",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
    house_models(
        turi: "Home",
        name: "Uy topib berish  xizmati",
        phone_number: "+998906935544",
        tolov: "Bor",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
    house_models(
        turi: "Home",
        name: "Uy topib berish  xizmati",
        phone_number: "+998906935544",
        tolov: "Bor",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
    house_models(
        turi: "Home",
        name: "Uy topib berish  xizmati",
        phone_number: "+998906935544",
        tolov: "Bor",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
    house_models(
        turi: "Home",
        name: "Uy topib berish  xizmati",
        phone_number: "+998906935544",
        tolov: "Bor",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF8B0000),
          centerTitle: true,
          title: Text(
            "Uy topish",
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 5.w,
                fontFamily: "Inter",
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
          )),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("image/back_screen.png"),
          fit: BoxFit.cover,
        )),
        child: Column(children: [
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              Text(
                "Uy topib berish xizmati ro’yxati:",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Inter",
                    fontSize: 18.sp),
              )
            ],
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
            child: House_widget(models: models),
          ))
        ]),
      ),
    );
  }
}
