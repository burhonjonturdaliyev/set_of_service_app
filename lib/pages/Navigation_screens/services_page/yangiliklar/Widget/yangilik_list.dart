import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/models/comment_models.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/models/yangiliklar_models.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/new_with_comment.dart';

class yangiliklar_list extends StatefulWidget {
  yangiliklar_list({super.key, required this.models, required this.komment});

  List<yangiliklar_models> models;

  List<comment_models> komment;

  @override
  State<yangiliklar_list> createState() => _yangiliklar_listState();
}

class _yangiliklar_listState extends State<yangiliklar_list> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.models.length,
      itemBuilder: (context, index) => list_items(context, widget.models[index],
          widget.komment[index % widget.komment.length]),
    );
  }
}

Widget list_items(
    BuildContext context, yangiliklar_models models, comment_models komment) {
  bool isLiked = false;
  int likes = int.parse(models.likes);
  return Padding(
    padding: EdgeInsets.only(top: 5.h),
    child: Container(
      width: 320.w,
      // height: 160.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(21),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Wrap(
            children: [
              Container(
                height: 190.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(21.w),
                        topRight: Radius.circular(21.w)),
                    image: DecorationImage(
                        image: (NetworkImage(models.foto)), fit: BoxFit.cover)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 3.w, right: 3.w),
                child: Text(
                  models.info,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Inter"),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  DateFormat("dd-MMMM kk:mm").format(models.dateTime),
                  style: const TextStyle(color: Colors.black54),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(PageTransition(
                        child:
                            News_comments(yangilik: models, comments: komment),
                        type: PageTransitionType.fade));
                  },
                  icon: Icon(
                    Icons.comment_outlined,
                    color: Colors.black54,
                    size: 22.w,
                  ),
                  label: Text(
                    "Komment",
                    style: TextStyle(
                        color: Colors.black54,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp),
                  ))
            ],
          )
        ],
      ),
    ),
  );
}
