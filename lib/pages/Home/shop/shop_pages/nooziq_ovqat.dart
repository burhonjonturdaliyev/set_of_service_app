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
        rate: 4.7),
    Shop_models(
        name: "Uzbek non national foods ...",
        number: "+998906936594",
        delevering: "Mavjud",
        address: "Tokyo, Edogawa ku, Kasai rinkoen 1-66",
        time: DateTime(2023, 03, 25),
        count: 12345,
        rate: 4.7),
    Shop_models(
        name: "Uzbek non national foods ...",
        number: "+998906936594",
        delevering: "Mavjud",
        address: "Tokyo, Edogawa ku, Kasai rinkoen 1-66",
        time: DateTime(2023, 03, 25),
        count: 12345,
        rate: 4.7),
    Shop_models(
        name: "Uzbek non national foods ...",
        number: "+998906936594",
        delevering: "Mavjud",
        address: "Tokyo, Edogawa ku, Kasai rinkoen 1-66",
        time: DateTime(2023, 03, 25),
        count: 12345,
        rate: 4.7),
    Shop_models(
        name: "Uzbek non national foods ...",
        number: "+998906936594",
        delevering: "Mavjud",
        address: "Tokyo, Edogawa ku, Kasai rinkoen 1-66",
        time: DateTime(2023, 03, 25),
        count: 12345,
        rate: 4.7),
    Shop_models(
        name: "Uzbek non national foods ...",
        number: "+998906936594",
        delevering: "Mavjud",
        address: "Tokyo, Edogawa ku, Kasai rinkoen 1-66",
        time: DateTime(2023, 03, 25),
        count: 12345,
        rate: 4.7),
    Shop_models(
        name: "Uzbek non national foods ...",
        number: "+998906936594",
        delevering: "Mavjud",
        address: "Tokyo, Edogawa ku, Kasai rinkoen 1-66",
        time: DateTime(2023, 03, 25),
        count: 12345,
        rate: 4.7),
    Shop_models(
        name: "Uzbek non national foods ...",
        number: "+998906936594",
        delevering: "Mavjud",
        address: "Tokyo, Edogawa ku, Kasai rinkoen 1-66",
        time: DateTime(2023, 03, 25),
        count: 12345,
        rate: 4.7),
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
