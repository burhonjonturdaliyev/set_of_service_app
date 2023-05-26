// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/models/newsModels.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/widget/NewsPageWidget.dart';

class NewsWidgets {
  Widget catagory(
      {required List<CatagoryModels> list,
      required BuildContext context,
      required List ikonlar}) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) =>
          itemsDesign(context, list[index], ikonlar),
    );
  }

  Widget itemsDesign(BuildContext context, CatagoryModels models, ikonlar) {
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
              Text(models.name)
            ],
          ),
        ),
      ),
    );
  }
}
