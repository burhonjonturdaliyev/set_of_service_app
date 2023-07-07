// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/screens/comment.dart';

import '../../../../../const_api/api.dart';

class fullyScreen extends StatelessWidget {
  fullyScreen(
      {super.key,
      required this.id,
      required this.createdAt,
      required this.createdBy,
      required this.updatedAt,
      required this.deleted,
      required this.title,
      required this.description,
      required this.newsType,
      required this.photo});
  int? id;
  String? createdAt;
  int? createdBy;
  String? updatedAt;
  bool? deleted;
  String? title;
  String? description;
  String? newsType;
  String? photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          DateFormat("dd/MM/yyyy").format(DateTime.parse(createdAt!)),
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              fontFamily: "Inter"),
        ),
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
                    createdBy: createdBy,
                    updatedAt: updatedAt,
                    deleted: deleted,
                    title: title,
                    description: description,
                    newsType: newsType,
                    photo: photo),
                type: PageTransitionType.fade,
              ));
        },
        icon: Icon(
          Icons.chat_bubble_outline_outlined,
          color: Colors.white,
          size: 20.sp,
        ),
        label: Text(
          "Izoh qoldirish",
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
                    image: DecorationImage(
                        image: NetworkImage("${Api().view_image}$photo"),
                        fit: BoxFit.cover),
                    color: Colors.transparent,
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
                    title!,
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
                    description!,
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
