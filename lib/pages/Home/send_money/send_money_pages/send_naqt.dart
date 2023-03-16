import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:set_of_service_app/models/send_money_naqt_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Naqt extends StatefulWidget {
  Naqt({super.key});

  @override
  State<Naqt> createState() => _NaqtState();
}

class _NaqtState extends State<Naqt> {
  List<Naqt_pul_model> models = [];

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
            child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Container(),
        ))
      ],
    );
  }
}

Widget Naqt_items(Naqt_pul_model model) {
  return Container(
    child: TextButton(
      onPressed: () async {
        if (await canLaunch(model.telegram.toString())) {
          await launch(model.telegram.toString());
        } else {
          throw 'Could not launch ${model.telegram}';
        }
      },
      child: Text("Telegram"),
    ),
  );
}
