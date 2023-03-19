import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Home/send_money/Widgets/send_money_naqt_widget.dart';
import 'package:set_of_service_app/models/send_money_naqt_model.dart';

class Naqt extends StatefulWidget {
  const Naqt({super.key});

  @override
  State<Naqt> createState() => _NaqtState();
}

class _NaqtState extends State<Naqt> {
  List<Naqt_pul_model> models = [
    Naqt_pul_model(
        name: "Payme",
        kurs: 1.34,
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66",
        phone_number: "+98906936594",
        telegram: "https://t.me/TBA_003"),
    Naqt_pul_model(
        name: "Omonat servis",
        kurs: 1.34,
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66",
        phone_number: "+98906936594",
        telegram: "https://t.me/TBA_003"),
    Naqt_pul_model(
        name: "BSI",
        kurs: 1.34,
        address: "Tokyo , Edogawa ku , Kasai rinkoen 1-66",
        phone_number: "+98906936594",
        telegram: "https://t.me/TBA_003"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
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
