// ignore_for_file: camel_case_types, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Navigation_screens/history/widget/elon_done_widget.dart';

import '../../../../models/shop_models.dart';

class Elon_monitoring extends StatefulWidget {
  Elon_monitoring({super.key});

  @override
  State<Elon_monitoring> createState() => _Elon_monitoringState();
}

class _Elon_monitoringState extends State<Elon_monitoring> {
  List<Shop_models> models = [
    Shop_models(
        name: "Uzbek non national foods ...",
        number: "+998906936594",
        delevering: "Mavjud",
        address: "Tokyo, Edogawa ku, Kasai rinkoen 1-66",
        time: DateTime(2023, 03, 25),
        count: 12345,
        rate: 4.7,
        information: "Bu yerda ko'proq ma'lumot bo'lish mumkin",
        image:
            "https://uploads-ssl.webflow.com/5e86c7170f1ab21474c3f2a4/5ef1d04b4056011f67df2ed7_Natural%2Blight%2B-%2BFood%2BPhotography%2B-%2BFrenchly%2B-4365.jpg"),
    Shop_models(
        name: "Uzbek non national foods ...",
        number: "+998906936594",
        delevering: "Mavjud",
        address: "Tokyo, Edogawa ku, Kasai rinkoen 1-66",
        time: DateTime(2023, 03, 25),
        count: 12345,
        rate: 4.7,
        information: "Bu yerda ko'proq ma'lumot bo'lish mumkin",
        image:
            "https://uploads-ssl.webflow.com/5e86c7170f1ab21474c3f2a4/5ef1d04b4056011f67df2ed7_Natural%2Blight%2B-%2BFood%2BPhotography%2B-%2BFrenchly%2B-4365.jpg"),
    Shop_models(
        name: "Uzbek non national foods ...",
        number: "+998906936594",
        delevering: "Mavjud",
        address: "Tokyo, Edogawa ku, Kasai rinkoen 1-66",
        time: DateTime(2023, 03, 25),
        count: 12345,
        rate: 4.7,
        information: "Bu yerda ko'proq ma'lumot bo'lish mumkin",
        image:
            "https://uploads-ssl.webflow.com/5e86c7170f1ab21474c3f2a4/5ef1d04b4056011f67df2ed7_Natural%2Blight%2B-%2BFood%2BPhotography%2B-%2BFrenchly%2B-4365.jpg"),
    Shop_models(
        name: "Uzbek non national foods ...",
        number: "+998906936594",
        delevering: "Mavjud",
        address: "Tokyo, Edogawa ku, Kasai rinkoen 1-66",
        time: DateTime(2023, 03, 25),
        count: 12345,
        rate: 4.7,
        information: "Bu yerda ko'proq ma'lumot bo'lish mumkin",
        image:
            "https://uploads-ssl.webflow.com/5e86c7170f1ab21474c3f2a4/5ef1d04b4056011f67df2ed7_Natural%2Blight%2B-%2BFood%2BPhotography%2B-%2BFrenchly%2B-4365.jpg"),
    Shop_models(
        name: "Uzbek non national foods ...",
        number: "+998906936594",
        delevering: "Mavjud",
        address: "Tokyo, Edogawa ku, Kasai rinkoen 1-66",
        time: DateTime(2023, 03, 25),
        count: 12345,
        rate: 4.7,
        information: "Bu yerda ko'proq ma'lumot bo'lish mumkin",
        image:
            "https://uploads-ssl.webflow.com/5e86c7170f1ab21474c3f2a4/5ef1d04b4056011f67df2ed7_Natural%2Blight%2B-%2BFood%2BPhotography%2B-%2BFrenchly%2B-4365.jpg"),
    Shop_models(
        name: "Uzbek non national foods ...",
        number: "+998906936594",
        delevering: "Mavjud",
        address: "Tokyo, Edogawa ku, Kasai rinkoen 1-66",
        time: DateTime(2023, 03, 25),
        count: 12345,
        rate: 4.7,
        information: "Bu yerda ko'proq ma'lumot bo'lish mumkin",
        image:
            "https://uploads-ssl.webflow.com/5e86c7170f1ab21474c3f2a4/5ef1d04b4056011f67df2ed7_Natural%2Blight%2B-%2BFood%2BPhotography%2B-%2BFrenchly%2B-4365.jpg"),
    Shop_models(
        name: "Uzbek non national foods ...",
        number: "+998906936594",
        delevering: "Mavjud",
        address: "Tokyo, Edogawa ku, Kasai rinkoen 1-66",
        time: DateTime(2023, 03, 25),
        count: 12345,
        rate: 4.7,
        information: "Bu yerda ko'proq ma'lumot bo'lish mumkin",
        image:
            "https://uploads-ssl.webflow.com/5e86c7170f1ab21474c3f2a4/5ef1d04b4056011f67df2ed7_Natural%2Blight%2B-%2BFood%2BPhotography%2B-%2BFrenchly%2B-4365.jpg"),
    Shop_models(
        name: "Uzbek non national foods ...",
        number: "+998906936594",
        delevering: "Mavjud",
        address: "Tokyo, Edogawa ku, Kasai rinkoen 1-66",
        time: DateTime(2023, 03, 25),
        count: 12345,
        rate: 4.7,
        information: "Bu yerda ko'proq ma'lumot bo'lish mumkin",
        image:
            "https://uploads-ssl.webflow.com/5e86c7170f1ab21474c3f2a4/5ef1d04b4056011f67df2ed7_Natural%2Blight%2B-%2BFood%2BPhotography%2B-%2BFrenchly%2B-4365.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 8.h,
        left: 12.w,
        right: 12.w,
      ),
      child: finished_elon(info_List: models),
    );
  }
}
