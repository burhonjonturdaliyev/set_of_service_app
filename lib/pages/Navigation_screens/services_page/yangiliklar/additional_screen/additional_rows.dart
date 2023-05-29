// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/additional_screen/fully_information.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/models/newsModels.dart';

class additionalNews extends StatelessWidget {
  additionalNews({super.key});
  List<infoNew> news = [
    infoNew(
        id: 1,
        createdAt: DateTime.now().toString(),
        title:
            "Lorem Ipsum is simply dummy text ofthe printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s ....",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        countryInfoType: "Japan",
        photo: 1)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000),
      ),
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) => design(context, news[index]),
      ),
    );
  }

  Widget design(BuildContext context, infoNew model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  child: fullyScreen(
                      id: model.id,
                      title: model.title,
                      description: model.description,
                      countryInfoType: model.countryInfoType,
                      createdAt: model.createdAt,
                      photo: model.photo),
                  type: PageTransitionType.rightToLeft,
                  childCurrent: additionalNews()));
        },
        child: Container(
            height: 95.h,
            width: 367.w,
            decoration: BoxDecoration(
                color: const Color(0x7DE4C9C9),
                border: Border.all(width: 0.5.w, color: Colors.black26),
                borderRadius: BorderRadius.circular(13.w)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              model.title.length >= 100
                                  ? "${model.title.substring(0, 100)} ..."
                                  : model.title,
                              style: TextStyle(
                                  fontFamily: "Inter", fontSize: 11.sp),
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.black54,
                              size: 13.sp,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(DateFormat("yyyy.MM.dd")
                                .format(DateTime.parse(model.createdAt))),
                            SizedBox(
                              width: 10.w,
                            ),
                            Icon(
                              Icons.watch_later_outlined,
                              color: Colors.black54,
                              size: 13.sp,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(DateFormat("HH:mm")
                                .format(DateTime.parse(model.createdAt)))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 120.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.black38),
                        borderRadius: BorderRadius.circular(5.w)),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
