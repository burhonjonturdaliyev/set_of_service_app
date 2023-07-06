// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Home/airticket/page/functions/airTicketFuntions.dart';
import 'package:set_of_service_app/pages/Home/airticket/page/models/AirticketModels.dart';
import 'package:set_of_service_app/pages/Home/airticket/page/widget/ticket_builder.dart';

class Air_ticket_list extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Air_ticket_list({super.key});

  @override
  State<Air_ticket_list> createState() => _Air_ticket_listState();
}

class _Air_ticket_listState extends State<Air_ticket_list> {
  List<AirticketModels> models = [];
  Future<void> fetchInfo() async {
    // ignore: non_constant_identifier_names
    final Response = await AirticketFunctions().getItems(context);
    if (mounted) {
      setState(() {
        Response != null ? models = Response : null;
      });
    }
  }

  @override
  void initState() {
    fetchInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF8B0000),
          centerTitle: true,
          title: Text(
            "Bilet sotadiganlar ro’yxati",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,
                fontSize: 20.sp),
          )),
      body: RefreshIndicator(
          onRefresh: fetchInfo,
          color: const Color(0xFF8B0000),
          child: Padding(
            padding: EdgeInsets.only(left: 11.w, right: 11.w, top: 11.w),
            child: Ticket_builder(
              models: models,
            ),
          )),
    );
  }
}
