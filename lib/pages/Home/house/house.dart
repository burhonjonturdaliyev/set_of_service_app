// ignore_for_file: camel_case_types, duplicate_ignore, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Home/house/Widget/house_widgets.dart';
import 'package:set_of_service_app/pages/Home/house/functions/getItems.dart';
import 'package:set_of_service_app/pages/Home/house/models/models.dart';

// ignore: camel_case_types
class Uy_joy_top extends StatefulWidget {
  const Uy_joy_top({super.key});

  @override
  State<Uy_joy_top> createState() => _Uy_joy_topState();
}

class _Uy_joy_topState extends State<Uy_joy_top> {
  Future<void> fetchItems() async {
    final Response = await getHouse().fetchInfo(context);
    if (mounted) {
      setState(() {
        Response != null ? homeItems = Response : null;
      });
    }
  }

  List<HomeModels> homeItems = [
    HomeModels(
        id: 1,
        title: "2 xonalik uy",
        subTitle:
            "Nimadir Nimadir Nimadir Nimadir Nimadir Nimadir Nimadir Nimadir Nimadir Nimadir Nimadir Nimadir Nimadir",
        juridical: false,
        serviceFee: "2000 yena",
        phoneNumber: "+998906936594",
        telegramUrl: "https://t.me/TBA_003",
        officeAddress: "Tokyo Ganjao Nimadir 232",
        active: true,
        serviceCategoryId: 1,
        businessProfileId: 1,
        totalStarts: 5.0,
        totalViews: 1230,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now())
  ];

  @override
  void initState() {
    // fetchItems();
    super.initState();
  }

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
          fit: BoxFit.fitHeight,
        )),
        child: homeItems.isEmpty
            ? const Center(child: Text("Hozircha yangilik yo'q"))
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
                  child: House_widget(models: homeItems),
                ))
              ]),
      ),
    );
  }
}
