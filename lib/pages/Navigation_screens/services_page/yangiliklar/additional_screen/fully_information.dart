// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/screens/comment.dart';

class fullyScreen extends StatelessWidget {
  fullyScreen(
      {super.key,
      required this.id,
      required this.title,
      required this.description,
      required this.countryInfoType,
      required this.createdAt,
      required this.photo});
  int id;
  String createdAt;
  String title;
  String description;
  String countryInfoType;
  int photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF8B0000),
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                child: CommentsNews(
                    id: id,
                    createdAt: createdAt,
                    description: description,
                    title: title,
                    photo: photo,
                    countryInfoType: countryInfoType),
                type: PageTransitionType.fade,
              ));
        },
        icon: Icon(
          Icons.chat_bubble_outline_outlined,
          color: Colors.white,
          size: 20.sp,
        ),
        label: Text(
          "Komment",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: "Inter",
              fontSize: 14.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: 367.w,
                height: 254.h,
                decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(12.w),
                    border: Border.all(width: 0.5.w, color: Colors.black45)),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    "Mavzu:",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        fontFamily: "Inter"),
                  )
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    style: TextStyle(
                        color: Colors.black87,
                        fontFamily: "Inter",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600),
                  ))
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Text(
                    "Izoh:",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        fontFamily: "Inter"),
                  )
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    style: TextStyle(
                        color: Colors.black54,
                        fontFamily: "Inter",
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400),
                  ))
                ],
              ),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
