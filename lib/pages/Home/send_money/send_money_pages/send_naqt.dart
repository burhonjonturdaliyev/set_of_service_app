// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Home/send_money/Widgets/send_money_naqt_widget.dart';
import 'package:set_of_service_app/pages/Home/send_money/functions/sendNaqt.dart';

import 'package:set_of_service_app/pages/Home/send_money/models/modelsNaqt.dart';

class Naqt extends StatefulWidget {
  const Naqt({super.key});

  @override
  State<Naqt> createState() => _NaqtState();
}

class _NaqtState extends State<Naqt> {
  List<NaqtModels> models = [
    NaqtModels(
        id: 1,
        title: "Paynet",
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

  Future<void> getKarta() async {
    final Response = await sendNaqt().fetchInfo(context);
    if (mounted) {
      setState(() {
        Response != null ? models = Response : null;
      });
    }
  }

  @override
  void initState() {
    // getKarta();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return models.isEmpty
        ? const Center(
            child: Text(
              "Ulanmoqda...",
              textAlign: TextAlign.center,
            ),
          )
        : Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 6.h, left: 11.w, right: 11.w),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Naqt pul yuboruvchi xizmatlar ro’yxati:",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          letterSpacing: 1.w,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w800),
                    ))
                  ],
                ),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(left: 11.w, right: 11.w, top: 11.w),
                child: Send_money_naqt_widget(
                  naqt_model: models,
                ),
              ))
            ],
          );
  }
}
