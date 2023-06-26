// ignore_for_file: must_be_immutable, file_names, use_build_context_synchronously, avoid_print, unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/models/info_count.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/models/newsModels.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/widget/WidgetsNews.dart';

import '../../../../const_api/api.dart';
import '../../../../registr/sign_in/Sign_in_screen.dart';

class GlobalNews extends StatefulWidget {
  GlobalNews({super.key, required this.userId});
  int userId;

  @override
  State<GlobalNews> createState() => _GlobalNewsState();
}

class _GlobalNewsState extends State<GlobalNews> {
  counting_news_model? model;
  List<CatagoryModels> catagory = [
    CatagoryModels(name: "Trenddagi yangiliklar", type: "trend", count: 0),
    CatagoryModels(name: "O'zbekiston elchixonasi", type: "embassy", count: 0),
    CatagoryModels(name: "UYAJ", type: "uyaj", count: 0),
    CatagoryModels(name: "Top xabarlar", type: "top", count: 0),
    CatagoryModels(name: "Rasmiy xabarlar", type: "official", count: 0),
    CatagoryModels(name: "Odatiy yangiliklar", type: "normal", count: 0),
    CatagoryModels(name: "Boshqa turdagi", type: "others", count: 0),
    CatagoryModels(
        name: "Eng ko'p beriladigan savollar", type: "fryQuestions", count: 0),
  ];

  @override
  void initState() {
    getCount();
    super.initState();
  }

  Future<void> getCount() async {
    final url = Api().countInfo;
    final uri = Uri.parse(url);
    try {
      Response response = await http.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body;
        if (body != null && body.isNotEmpty) {
          final json = jsonDecode(body);
          final data = counting_news_model.fromJson(json['data']);
          setState(() {
            model = data;
          });
        }
      } else if (response.statusCode == 403) {
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(child: Sign_in(), type: PageTransitionType.fade),
            (route) => false);
      }
    } catch (e) {
      print("Nimadir xato $e");
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
