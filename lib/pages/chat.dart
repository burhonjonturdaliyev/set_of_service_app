// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/Widgets/chat_widgets.dart';
import 'package:set_of_service_app/main.dart';
import 'package:set_of_service_app/models/chat_model.dart';

class Chat extends StatefulWidget {
  Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<Chat_model> textlist = [
    Chat_model(id: false, text: "Salom"),
    Chat_model(id: true, text: "Qale"),
    Chat_model(id: true, text: "Yaxshimi"),
    Chat_model(id: false, text: "Ha yaxshi"),
  ];
  TextEditingController _controller = TextEditingController();
  final _scroller = ScrollController();

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
                      textlist
                          .add(Chat_model(id: true, text: _controller.text));

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
    );
  }
}
