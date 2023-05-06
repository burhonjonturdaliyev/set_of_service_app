import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/news/models/newsModels.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/news/widget/NewsPageWidget.dart';

class NewsWidgets {
  Widget catagory(
      {required List<CatagoryModels> list, required BuildContext context}) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => itemsDesign(context, list[index]),
    );
  }

  Widget itemsDesign(BuildContext context, CatagoryModels models) {
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
              const CircleAvatar(
                child: Text(""),
              ),
              SizedBox(
                width: 30.w,
              ),
              Text(models.name)
            ],
          ),
        ),
      ),
    );
  }
}
