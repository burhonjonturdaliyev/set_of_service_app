// ignore_for_file: camel_case_types, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Home/shop/model/nofoods_model.dart';
import 'package:set_of_service_app/pages/Navigation_screens/history/widget/elon_done_widget.dart';

import '../functions/faol_elon.dart';

class Elon_monitoring extends StatefulWidget {
  Elon_monitoring({super.key, required this.userId});
  int userId;

  @override
  State<Elon_monitoring> createState() => _Elon_monitoringState();
}

class _Elon_monitoringState extends State<Elon_monitoring> {
  List<shop_no_foods_model> models = [];

  Future<void> getNoFoods() async {
    final responce = await elon_no_foods().fetchNoFood(context, widget.userId);
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
