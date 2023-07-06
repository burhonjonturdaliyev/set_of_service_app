// ignore_for_file: must_be_immutable, camel_case_types, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/pages/Home/shop/additional/add_items.dart';
import 'package:set_of_service_app/pages/Home/shop/functions/getShop.dart';
import 'package:set_of_service_app/pages/Home/shop/model/nofoods_model.dart';

import '../Widget/no_oziq_widget.dart';

// ignore: camel_case_types
class Nooziq_ovqat extends StatefulWidget {
  Nooziq_ovqat({super.key, required this.userId});
  int userId;

  @override
  State<Nooziq_ovqat> createState() => _Nooziq_ovqatState();
}

class _Nooziq_ovqatState extends State<Nooziq_ovqat> {
  List<shop_no_foods_model> models = [];

  Future<void> getNoFoods() async {
    final responce = await noFoodsGet().fetchNoFood(context);
    if (mounted) {
      setState(() {
        responce != null ? models = responce : null;
      });
    }
  }

  @override
  void initState() {
    getNoFoods();
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Nooziq-ovqatlar",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    fontFamily: "Inter"),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                        child: addItems(
                          userId: widget.userId,
                        ),
                        type: PageTransitionType.fade,
                      ));
                },
                child: Row(
                  children: [
                    Text(
                      "E'lon berish",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          fontFamily: "Inter"),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Icon(
                      Icons.add_to_photos_outlined,
                      color: Colors.black,
                      size: 25.w,
                    )
                  ],
                ),
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
          child: no_List_builder(models: models),
        ))
      ],
    );
  }
}
