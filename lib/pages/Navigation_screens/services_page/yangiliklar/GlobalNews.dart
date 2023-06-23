// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/models/newsModels.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/widget/WidgetsNews.dart';

class GlobalNews extends StatefulWidget {
  GlobalNews({super.key, required this.userId});
  int userId;

  @override
  State<GlobalNews> createState() => _GlobalNewsState();
}

class _GlobalNewsState extends State<GlobalNews> {
  List<CatagoryModels> catagory = [
    CatagoryModels(name: "Trenddagi yangiliklar", type: "trend"),
    CatagoryModels(name: "O'zbekiston elchixonasi", type: "embassy"),
    CatagoryModels(name: "UYAJ", type: "uyaj"),
    CatagoryModels(name: "Top xabarlar", type: "top"),
    CatagoryModels(name: "Rasmiy xabarlar", type: "official"),
    CatagoryModels(name: "Odatiy yangiliklar", type: "normal"),
    CatagoryModels(name: "Boshqa turdagi", type: "others"),
    CatagoryModels(name: "Eng ko'p beriladigan savollar", type: "fryQuestions"),
  ];

  // "normal": 0,
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
          child: NewsWidgets().catagory(
            list: catagory,
            context: context,
          ),
        ),
      ),
    );
  }
}
