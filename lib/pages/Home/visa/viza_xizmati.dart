// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Home/visa/Widget/visa_widgets.dart';
import 'package:set_of_service_app/pages/Home/visa/functions/getViza.dart';
import 'package:set_of_service_app/pages/Home/visa/models/modelsViza.dart';

class Viza_xizmati extends StatefulWidget {
  const Viza_xizmati({super.key});

  @override
  State<Viza_xizmati> createState() => _Viza_xizmatiState();
}

class _Viza_xizmatiState extends State<Viza_xizmati> {
  List<vizaModels> models = [];

  Future<void> fetchitems() async {
    final Response = await gettingVizaItems().fetchInfo(context);
    setState(() {
      Response != null ? models = Response : null;
    });
  }

  @override
  void initState() {
    fetchitems();
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
                image: AssetImage("image/back_screen.png"),
                fit: BoxFit.fitHeight)),
        child: models.isEmpty
            ? const Center(
                child: Text("Hozirda hech qanday e'lon mavjud emas!"))
            : Column(
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
                    padding:
                        EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
                    child: Visa_support_widget(models: models),
                  ))
                ],
              ),
      ),
    );
  }
}
