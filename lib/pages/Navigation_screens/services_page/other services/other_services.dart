// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/other%20services/function/getting_info_other.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/other%20services/model/other_services_model.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/other%20services/widget/other_services_widget.dart';

class other_services extends StatefulWidget {
  const other_services({super.key});

  @override
  State<other_services> createState() => _other_servicesState();
}

class _other_servicesState extends State<other_services> {
  List<other_services_model> model = [];

  Future<void> fetchData() async {
    final responce = await getting_other().fetchData(context);
    if (mounted) {
      setState(() {
        responce != null ? model = responce : null;
      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Boshqa servizlar",
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
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/back_screen.png"),
                fit: BoxFit.fitHeight)),
        child: model.isEmpty
            ? const Center(
                child: Text("Hozirda hech qanday e'lon mavjud emas"),
              )
            : Column(children: [
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "Barcha servizlar ro’yxati:",
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
                        padding:
                            EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
                        child: other_services_widget(
                          model: model,
                        )))
              ]),
      ),
    );
  }
}
