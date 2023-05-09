// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Home/pochta/Widget/pochta_widgets.dart';
import 'package:set_of_service_app/pages/Home/pochta/functions/gettingPochta.dart';

import 'package:set_of_service_app/pages/Home/pochta/models/pochtaModels.dart';

class Pochta_xizmati extends StatefulWidget {
  const Pochta_xizmati({super.key});

  @override
  State<Pochta_xizmati> createState() => _Pochta_xizmatiState();
}

class _Pochta_xizmatiState extends State<Pochta_xizmati> {
  List<pochtaModels> models = [];

  Future<void> gettingPochta() async {
    final Response = await GettingPochta().fetchInfo(context);
    setState(() {
      Response != null ? models = Response : null;
    });
  }

  @override
  void initState() {
    gettingPochta();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                image: AssetImage("image/back_screen.png"),
                fit: BoxFit.fitHeight)),
        child: models.isEmpty
            ? const Center(
                child: Text("Hech qanday hizmat mavjud emas!"),
              )
            : Column(children: [
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
