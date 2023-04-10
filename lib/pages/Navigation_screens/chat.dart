// ignore_for_file: prefer_final_fields, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/Widgets/chat_widgets.dart';
import 'package:set_of_service_app/models/chat_model.dart';

class Chat extends StatefulWidget {
  Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<Chat_model> textlist = [
    Chat_model(
        id: false, text: "Salom", time: DateTime(2023, 1, 5, 15, 56, 0, 0)),
    Chat_model(id: true, text: "Qale", time: DateTime(2023, 1, 6, 9, 35, 0, 0)),
    Chat_model(
        id: true, text: "Yaxshimi", time: DateTime(2023, 1, 6, 9, 40, 0, 0)),
    Chat_model(
        id: false,
        text:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop ",
        time: DateTime(2023, 1, 7, 07, 00, 0, 0)),
  ];
  TextEditingController _controller = TextEditingController();

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
        Positioned(
          left: 7.w,
          bottom: 10.h,
          child: Container(
            width: 361.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: const Color(0xFF8B0000),
                border: Border.all(
                    width: 1, color: const Color.fromARGB(105, 0, 0, 0)),
                borderRadius: BorderRadius.circular(24)),
            child: Row(children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 12.w, bottom: 4.h),
                  child: TextFormField(
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Inter",
                        fontSize: 16.sp),
                    controller: _controller,
                    maxLines: 1,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        // labelText: 'Name',
                        hintText: "Matn yozish ...",
                        hintStyle: TextStyle(
                            color: Colors.white60,
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
                    color: Colors.white,
                  ),
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }
}
