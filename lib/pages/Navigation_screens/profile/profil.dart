// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/Widgets/profile_widgets.dart';
import 'package:set_of_service_app/pages/Navigation_screens/profile/identification/profileIdentification.dart';
import 'package:set_of_service_app/pages/Profile_settings/Profile_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profil extends StatefulWidget {
  Profil(
      {super.key,
      required this.userId,
      required this.davlat,
      required this.fullname,
      required this.jins,
      required this.number,
      required this.sana,
      required this.server,
      required this.verification,
      required this.userHashId,
      required this.email});
  int userId;
  String? fullname, sana, number, jins, davlat, server, userHashId, email;
  bool? verification;
  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  SharedPreferences? logindata;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
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
            widget.verification == true
                ? SizedBox(
                    height: 20.h,
                  )
                : SizedBox(
                    height: 33.h,
                  ),
            Visibility(
                visible: widget.verification ?? false,
                child: Column(
                  children: [
                    Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.black45),
                          borderRadius: BorderRadius.circular(100.w)),
                      child:
                          Icon(Icons.person, color: Colors.black45, size: 55.w),
                    ),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.fullname ?? "Yuklanmoqda",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Inter"),
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.verification == true
                    ? Text(
                        "Tasdiqlangan akkaunt",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter"),
                      )
                    : Text(
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
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  // ignore: unnecessary_null_comparison
                  widget.sana != null
                      ? DateFormat("dd.MM.yyyy")
                          .format(DateTime.parse(widget.sana!))
                      : "Yuklanmoqda",
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
            Visibility(
              visible: widget.verification == true ? false : true,
              child: Column(
                children: [
                  Container(
                    width: 330.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(206, 241, 228, 108),
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 15.0.h, left: 19.w, right: 19.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Ilovaning barcha imkoniyatlaridan to’liq foydalanish uchun , iltimos identifikatsiya jarayonidan o’ting",
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
                              onPressed: () => Navigator.push(
                                  context,
                                  PageTransition(
                                    child: IdentificationProfel(
                                        userHashId: widget.userHashId),
                                    type: PageTransitionType.fade,
                                  )),
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
                    height: 30.h,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Information_section_profile(
                number: widget.number ?? "Yuklanmoqda",
                jins: widget.jins ?? "Yuklanmoqda",
                mamlakat: widget.davlat ?? "Yuklanmoqda",
                server: widget.server ?? "Yuklanmoqda",
                email: widget.email ?? "",
              ),
            ),
          ],
        ),
        Positioned(
            left: 75.w,
            right: 75.w,
            bottom: 15.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B0000),
                minimumSize: const Size(250, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(PageTransition(
                    child: Profile_settings(
                        userId: widget.userId, userHashId: widget.userHashId),
                    type: PageTransitionType.bottomToTop));
              },
              child: Text(
                "Tahrirlash",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    letterSpacing: 1.5),
              ),
            )),
      ],
    );
  }
}
