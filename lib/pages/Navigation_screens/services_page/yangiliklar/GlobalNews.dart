// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/models/newsModels.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/widget/WidgetsNews.dart';

class GlobalNews extends StatelessWidget {
  GlobalNews({super.key});
  List<CatagoryModels> catagory = [
    CatagoryModels(
        name: "Odatiy", icon: const Icon(Icons.start_outlined), type: "Normal"),
    CatagoryModels(
        name: "Ko'p ko'rilgan",
        icon: const Icon(Icons.start_outlined),
        type: "Top"),
    CatagoryModels(
        name: "Mashxur", icon: const Icon(Icons.start_outlined), type: "Trend"),
    CatagoryModels(
        name: "Rasmiy",
        icon: const Icon(Icons.start_outlined),
        type: "Official"),
    CatagoryModels(
        name: "Boshqa turdagi",
        icon: const Icon(Icons.start_outlined),
        type: "Others"),
  ];
  List<String> ikonlar = [
    "article",
    "trending_up",
    "trending_up",
    "check_circle",
    "category"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Yangiliklar",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              letterSpacing: 5.w,
              fontWeight: FontWeight.bold,
              fontFamily: "Inter"),
        ),
        backgroundColor: const Color(0xFF8B0000),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/back_screen.png"),
                fit: BoxFit.fitHeight)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: NewsWidgets()
              .catagory(list: catagory, context: context, ikonlar: ikonlar),
        ),
      ),
    );
  }
}
