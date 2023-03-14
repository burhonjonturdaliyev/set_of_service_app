import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/Widgets/profile_widgets.dart';
import 'package:set_of_service_app/pages/Profile_settings/Profile_settings.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/back_screen.png"),
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(1.w),
                child: Container(
                  width: 375.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xff8B0000)),
                  child: Center(
                      child: Text(
                    "Profil",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                        letterSpacing: 5),
                  )),
                ),
              ),
              SizedBox(
                height: 33.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Burhonjon Turdialiev",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Inter"),
                  )
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tasdiqlanmagan akkaunt",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter"),
                  )
                ],
              ),
              SizedBox(
                height: 19.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "01.02.2003",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                width: 330.w,
                height: 120.h,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(206, 241, 228, 108),
                    borderRadius: BorderRadius.circular(16)),
                child: Column(children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: 15.0.h, left: 19.w, right: 19.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Ilovaning barcha imkoniyatlaridan to’liq foydalanish uchun , iltimos identifikatsiya jarajoyidan o’ting",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Inter"),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Identifikatsiyadan o’tish",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w700,
                                fontSize: 14.sp,
                                color: Colors.black),
                          ))
                    ],
                  )
                ]),
              ),
              SizedBox(
                height: 38.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Information_section_profile(
                    number: "+998 90 123 45 67",
                    jins: "Erkak",
                    mamlakat: "Yaponiya"),
              ),
            ],
          ),
        ),
        Positioned(
            left: 48.w,
            bottom: 15.h,
            child: InkWell(
              onTap: () => Navigator.of(context).push(PageTransition(
                  child: const Profile_settings(),
                  type: PageTransitionType.bottomToTop)),
              child: Container(
                width: 281.w,
                height: 46.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff8B0000)),
                child: Center(
                  child: Text(
                    "Tahrirlash",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                        letterSpacing: 1.5),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
