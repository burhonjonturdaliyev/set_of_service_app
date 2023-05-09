// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:set_of_service_app/pages/Home/job/Widget/job_widget.dart';
import 'package:set_of_service_app/pages/Home/job/functions/getJob.dart';
import 'package:set_of_service_app/pages/Home/job/models/jobModels.dart';

class Ish_topish extends StatefulWidget {
  const Ish_topish({super.key});

  @override
  State<Ish_topish> createState() => _Ish_topishState();
}

class _Ish_topishState extends State<Ish_topish> {
  List<JobModels> models = [];

  Future<void> getJob() async {
    // ignore: non_constant_identifier_names, unused_local_variable
    final Response = await gettingJob().fetchInfo(context);
    setState(() {
      Response != null ? models = Response : null;
    });
  }

  @override
  void initState() {
    getJob();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Job",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Inter",
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              letterSpacing: 5.w),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF8B0000),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/back_screen.png"),
                fit: BoxFit.fitHeight)),
        child: models.isEmpty
            ? const Center(
                child: Text("Hozirda hech qanday ish mavjud emas"),
              )
            : Column(children: [
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "Ish topib berish xizmati ro’yxati:",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          fontSize: 18.sp),
                    )
                  ],
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
                  child: Job_widget(
                    models: models,
                  ),
                ))
              ]),
      ),
    );
  }
}
