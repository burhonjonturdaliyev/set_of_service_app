// ignore_for_file: must_be_immutable, camel_case_types, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Home/shop/Widget/shop_widgets.dart';
import 'package:set_of_service_app/pages/Home/shop/functions/getShop.dart';
import 'package:set_of_service_app/pages/Home/shop/model/foods_model.dart';

// ignore: camel_case_types
class Oziq_ovqat extends StatefulWidget {
  const Oziq_ovqat({super.key});

  @override
  State<Oziq_ovqat> createState() => _Oziq_ovqatState();
}

class _Oziq_ovqatState extends State<Oziq_ovqat> {
  List<foods_model> models = [
    foods_model(
        id: 1,
        title: "Tashkent",
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

  Future<void> getFoods() async {
    final responce = await foodsGet().fetchFood();
    if (mounted) {
      setState(() {
        responce != null ? models = responce : null;
      });
    }
  }

  @override
  void initState() {
    //getFoods();
    super.initState();
  }

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
          child: List_builder(model: models),
        ))
      ],
    );
  }
}
