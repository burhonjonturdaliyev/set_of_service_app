// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Home/visa/Widget/visa_widgets.dart';

import '../../../models/visa_support_models.dart';

class Viza_xizmati extends StatelessWidget {
  Viza_xizmati({super.key});
  List<visa_support_models> models = [
    visa_support_models(
        yordam: "Visa",
        name: "Grean box xizmati",
        phone_number: "+998901234567",
        xizmat_turi: "Advokatlik",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
    visa_support_models(
        yordam: "Visa",
        name: "Grean box xizmati",
        phone_number: "+998901234567",
        xizmat_turi: "Advokatlik",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
    visa_support_models(
        yordam: "Visa",
        name: "Grean box xizmati",
        phone_number: "+998901234567",
        xizmat_turi: "Advokatlik",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
    visa_support_models(
        yordam: "Visa",
        name: "Grean box xizmati",
        phone_number: "+998901234567",
        xizmat_turi: "Advokatlik",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
    visa_support_models(
        yordam: "Visa",
        name: "Grean box xizmati",
        phone_number: "+998901234567",
        xizmat_turi: "Advokatlik",
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF8B0000),
          centerTitle: true,
          title: Text(
            "Visa support",
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
                image: AssetImage("image/back_screen.png"), fit: BoxFit.cover)),
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "Vizaga yordamchilar ro’yxati:",
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
              child: Visa_support_widget(models: models),
            ))
          ],
        ),
      ),
    );
  }
}
