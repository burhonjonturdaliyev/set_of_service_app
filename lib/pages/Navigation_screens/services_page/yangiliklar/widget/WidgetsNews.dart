// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/models/newsModels.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/widget/NewsPageWidget.dart';

class NewsWidgets {
  Widget catagory({
    required List<CatagoryModels> list,
    required BuildContext context,
  }) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => itemsDesign(
        context,
        list[index],
      ),
    );
  }

  Widget itemsDesign(
    BuildContext context,
    CatagoryModels models,
  ) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0.h),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            PageTransition(
                child: NewPageWidget(type: models.type, name: models.name),
                type: PageTransitionType.fade)),
        child: Container(
          height: 50.h,
          width: MediaQuery.of(context).size.width * 90,
          decoration: BoxDecoration(
              color: const Color.fromARGB(177, 228, 201, 201),
              borderRadius: BorderRadius.circular(13.w)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  Icon(
                    Icons.newspaper_outlined,
                    color: Colors.black54,
                    size: 25.w,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    models.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30.w,
                  ),
                  Container(
                    height: 35.h,
                    width: 35.h,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(width: 0.5.w, color: Colors.black54),
                        borderRadius: BorderRadius.circular(100.w)),
                    child: Center(
                        child: models.count != null
                            ? Text(
                                models.count.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Inter",
                                  fontSize: 13.sp,
                                ),
                              )
                            : SizedBox(
                                height: 15.h,
                                width: 15.w,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Color(0xFF8B0000),
                                ),
                              )),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black54,
                    size: 25.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
