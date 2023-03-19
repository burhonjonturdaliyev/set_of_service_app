import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/models/job_models.dart';
import 'package:set_of_service_app/pages/Home/job/Widget/job_widget.dart';

class Ish_topish extends StatelessWidget {
  Ish_topish({super.key});
  List<Job_models> models = [
    Job_models(
        turi: "Job",
        name: "Genbaga shoukai qilish xizmati",
        phone_number: "+998901234567",
        haqqi: "45 000 yena",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
    Job_models(
        turi: "Job",
        name: "Genbaga shoukai qilish xizmati",
        phone_number: "+998901234567",
        haqqi: "45 000 yena",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
    Job_models(
        turi: "Job",
        name: "Genbaga shoukai qilish xizmati",
        phone_number: "+998901234567",
        haqqi: "45 000 yena",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
    Job_models(
        turi: "Job",
        name: "Genbaga shoukai qilish xizmati",
        phone_number: "+998901234567",
        haqqi: "45 000 yena",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
    Job_models(
        turi: "Job",
        name: "Genbaga shoukai qilish xizmati",
        phone_number: "+998901234567",
        haqqi: "45 000 yena",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
    Job_models(
        turi: "Job",
        name: "Genbaga shoukai qilish xizmati",
        phone_number: "+998901234567",
        haqqi: "45 000 yena",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
    Job_models(
        turi: "Job",
        name: "Genbaga shoukai qilish xizmati",
        phone_number: "+998901234567",
        haqqi: "45 000 yena",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
    Job_models(
        turi: "Job",
        name: "Genbaga shoukai qilish xizmati",
        phone_number: "+998901234567",
        haqqi: "45 000 yena",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFDDADA),
      appBar: AppBar(
        title: Text(
          "Job",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Inter",
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              letterSpacing: 5.w),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF8B0000),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/back_screen.png"), fit: BoxFit.cover)),
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
                "Ish topib berish xizmati ro’yxati:",
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
            child: Job_widget(
              models: models,
            ),
          ))
        ]),
      ),
    );
  }
}
