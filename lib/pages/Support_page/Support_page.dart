// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/models/chat_model.dart';

import '../../Widgets/chat_widgets.dart';

class Support_center extends StatefulWidget {
  const Support_center({super.key});

  @override
  State<Support_center> createState() => _Support_centerState();
}

class _Support_centerState extends State<Support_center> {
  List<Chat_model> textlist = [];
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff8A0000),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xffFDDADA),
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
                          color: const Color(0xff8B0000),
                          borderRadius: BorderRadius.circular(5.w)),
                      child: Center(
                        child: Text(
                          "Chat",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 5,
                              fontFamily: "Inter"),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SafeArea(
                      minimum: EdgeInsets.only(bottom: 60.h),
                      child: Container_design(
                        textlist: textlist,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 7.w,
              bottom: 10.h,
              child: Container(
                width: 361.w,
                height: 50.h,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(204, 138, 246, 233),
                    border: Border.all(
                        width: 1, color: const Color.fromARGB(105, 0, 0, 0)),
                    borderRadius: BorderRadius.circular(24)),
                child: Row(children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 12.w, bottom: 4.h),
                      child: TextFormField(
                        controller: _controller,
                        maxLines: 1,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            // labelText: 'Name',
                            hintText: "Matn yozish ...",
                            hintStyle: TextStyle(
                                color: Colors.black26,
                                fontSize: 16.sp,
                                fontFamily: "Inter")),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0.w),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          textlist.add(Chat_model(
                              id: true,
                              text: _controller.text,
                              time: DateTime.now()));

                          _controller.clear();
                        });
                      },
                      child: Image.asset(
                        "image/telegram.png",
                        width: 24,
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
