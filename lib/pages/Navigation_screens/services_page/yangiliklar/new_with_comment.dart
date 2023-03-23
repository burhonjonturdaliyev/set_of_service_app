import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/models/comment_models.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/models/yangiliklar_models.dart';

class News_comments extends StatelessWidget {
  News_comments({super.key, required this.yangilik, required this.comments});
  final yangiliklar_models yangilik;
  final comment_models comments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8B0000),
      body: SafeArea(
        child: Container(
          width: 375.w,
          height: 812.h,
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(children: [
            _avatar_picker(yangilik),
            _image_provider(yangilik),
            _info_provider(yangilik),
          ]),
        ),
      ),
    );
  }

  _image_provider(yangiliklar_models yangilik) {
    return Positioned(
        top: 33.h,
        right: 0.w,
        left: 0.w,
        child: Container(
          width: 375.w,
          height: 215.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21.w),
              image: DecorationImage(
                  image: NetworkImage(
                    yangilik.foto,
                  ),
                  fit: BoxFit.cover)),
        ));
  }

  _avatar_picker(yangiliklar_models yangilik) {
    return Positioned(
        left: 5.w,
        top: 5.h,
        child: SizedBox(
          height: 25.h,
          child: Row(
            children: [
              Container(
                height: 25.w,
                width: 25.w,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100.w),
                ),
                child: Center(
                  child: Icon(
                    Icons.person,
                    color: Colors.blue,
                    size: 25.w,
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(yangilik.id)
            ],
          ),
        ));
  }

  _info_provider(yangiliklar_models yangilik) {
    return Positioned(
        top: 250.h,
        left: 5.w,
        right: 5.w,
        child: SizedBox(
          width: 375.w,
          height: 130.h,
          child: Text(
            yangilik.info,
            textAlign: TextAlign.justify,
          ),
        ));
  }
}
