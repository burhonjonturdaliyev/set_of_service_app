import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Widget/shop_widgets.dart';
import '../../../../models/shop_models.dart';

// ignore: camel_case_types
class Nooziq_ovqat extends StatelessWidget {
  Nooziq_ovqat({super.key});
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
    return Column(
      children: [
        SizedBox(
          height: 12.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 9.0.w, bottom: 14.h),
          child: Row(
            children: [
              Text(
                "Nooziq-ovqat servislari ro’yxati",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    fontFamily: "Inter"),
              )
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(
            left: 8.w,
            right: 8.w,
          ),
          child: List_builder(info_List: models),
        ))
      ],
    );
  }
}
