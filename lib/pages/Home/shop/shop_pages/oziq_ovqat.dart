// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Home/shop/Widget/shop_widgets.dart';
import 'package:set_of_service_app/models/shop_models.dart';

// ignore: camel_case_types
class Oziq_ovqat extends StatelessWidget {
  Oziq_ovqat({super.key});
  List<Shop_models> models = [
    Shop_models(
        name: "Uzbek national foods ...",
        number: "+998906936594",
        delevering: "Mavjud",
        address: "Tokyo, Edogawa ku, Kasai rinkoen 1-66",
        time: DateTime(2023, 03, 25),
        count: 12345,
        rate: 4.7,
        information:
            "Everyone takes pictures of their food, but few do it well. You know the feeling. It looks great on your plate – fresh, vibrant, and delicious – but so meh on your screen. I love food and I hate to see so many average (or bad!!) pictures of beautiful food, so I compiled a few easy tips that anyone can use to expose the raw (or cooked) beauty of food. The best part: you don’t even need fancy equipment, your phone will do just great.",
        image:
            "https://uploads-ssl.webflow.com/5e86c7170f1ab21474c3f2a4/5ef1d04b4056011f67df2ed7_Natural%2Blight%2B-%2BFood%2BPhotography%2B-%2BFrenchly%2B-4365.jpg"),
    Shop_models(
        name: "Uzbek national foods ...",
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
        name: "Uzbek national foods ...",
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
        name: "Uzbek national foods ...",
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
        name: "Uzbek national foods ...",
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
        name: "Uzbek national foods ...",
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
        name: "Uzbek national foods ...",
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
        name: "Uzbek national foods ...",
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
                "Oziq-ovqat servislari ro’yxati",
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
