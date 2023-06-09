// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/pages/Support_page/screens/chattingSupport.dart';
import 'package:set_of_service_app/pages/Support_page/models/support_types.dart';
import 'package:set_of_service_app/pages/Support_page/screens/deleteScreen.dart';

class SupportTypes extends StatefulWidget {
  SupportTypes({super.key, required this.userId});
  int userId;

  @override
  State<SupportTypes> createState() => _SupportTypesState();
}

class _SupportTypesState extends State<SupportTypes> {
  late List<Support_Types> models;
  @override
  void initState() {
    super.initState();
    models = [
      Support_Types(
          name: "Aktiv chat", page: Support_center(userId: widget.userId)),
      Support_Types(
          name: "Tugatilgan chatlar",
          page: DeleteMessageSupport(
            userId: widget.userId,
          )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff8B0000),
        title: Text(
          "Support-center",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 5,
            fontFamily: "Inter",
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/back_screen.png"),
                fit: BoxFit.fitHeight)),
        child: ListView.builder(
          itemCount: models.length,
          itemBuilder: (context, index) => supportItems(models[index], context),
        ),
      ),
    );
  }

  Widget supportItems(Support_Types models, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 5.w, right: 5.w),
      child: InkWell(
        onTap: () => Navigator.push(context,
            PageTransition(child: models.page, type: PageTransitionType.fade)),
        child: Container(
          height: 50.h,
          width: MediaQuery.of(context).size.width * 90,
          decoration: BoxDecoration(
              color: const Color.fromARGB(177, 228, 201, 201),
              borderRadius: BorderRadius.circular(13.w)),
          child: Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              Icon(
                Icons.mark_unread_chat_alt_outlined,
                color: Colors.black54,
                size: 25.w,
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(models.name)
            ],
          ),
        ),
      ),
    );
  }
}
