// ignore_for_file: must_be_immutable, file_names, use_build_context_synchronously, avoid_print, unnecessary_null_comparison, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/models/newsModels.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/widget/WidgetsNews.dart';

import '../../../../const_api/api.dart';
import 'models/info_count.dart';

class GlobalNews extends StatefulWidget {
  GlobalNews({super.key, required this.userId});
  int userId;

  @override
  State<GlobalNews> createState() => _GlobalNewsState();
}

class _GlobalNewsState extends State<GlobalNews> {
  NewsModel? model;
  List<CatagoryModels> catagory = [
    CatagoryModels(
      name: "Trenddagi yangiliklar",
      type: "TREND",
    ),
    CatagoryModels(
      name: "O'zbekiston elchixonasi",
      type: "UZB_EMBASSY",
    ),
    CatagoryModels(
      name: "UYAJ",
      type: "UYAJ",
    ),
    CatagoryModels(
      name: "Top xabarlar",
      type: "TOP",
    ),
    CatagoryModels(
      name: "Rasmiy xabarlar",
      type: "OFFICAL",
    ),
    CatagoryModels(
      name: "Odatiy yangiliklar",
      type: "NORMAL",
    ),
    CatagoryModels(
      name: "Boshqa turdagi",
      type: "OTHERS",
    ),
    CatagoryModels(
      name: "Eng ko'p beriladigan savollar",
      type: "FREQUENTLY_QUESTIONS",
    ),
  ];

  @override
  void initState() {
    get_info();
    super.initState();
  }

  get_info() async {
    final uri = Api().countInfo;
    final url = Uri.parse(uri);
    final response = await http.get(url);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final json = jsonDecode(response.body);
      setState(() {
        model = NewsModel.fromJson(json);
      });
    } else {
      print(response.statusCode);
      print(response.body);
    }
  }

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
        height: 812.h,
        width: 375.w,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/back_screen.png"),
                fit: BoxFit.fitHeight)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: model != null
              ? NewsWidgets().catagory(
                  list: catagory,
                  model: model!,
                  context: context,
                )
              : Center(
                  child: SizedBox(
                    height: 50.h,
                    width: 50.w,
                    child: const CircularProgressIndicator(
                      color: Color(0xFF8B0000),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
