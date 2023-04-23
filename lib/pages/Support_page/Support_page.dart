// ignore_for_file: camel_case_types, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/models/chat_model.dart';
import 'package:http/http.dart' as http;
import 'package:set_of_service_app/pages/Support_page/functions/get_message.dart';
import 'package:set_of_service_app/pages/Support_page/models/support_models.get.dart';
import 'package:set_of_service_app/pages/Support_page/models/support_models_send.dart';

import '../../Widgets/chat_widgets.dart';

class Support_center extends StatefulWidget {
  const Support_center({super.key});

  @override
  State<Support_center> createState() => _Support_centerState();
}

class _Support_centerState extends State<Support_center> {
  List<Chat_model> textlist = [];
  List<support_get> support = [];
  final apiUrl = Uri.parse('http://185.196.213.43:7088/support-chats');

  final TextEditingController _controller = TextEditingController();
  Future<void> putUserMessage(Support_models_send send) async {
    final response = await http.post(
      apiUrl,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(send.toJson()),
    );
  }

  void fetchMessage() async {
    // final response = await SupportMessage.fetchMessage();
    setState(() {
      // support = response;
    });
  }

  @override
  void initState() {
    fetchMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff8B0000),
        title: Text(
          "Support-center",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 5,
            fontFamily: "Inter",
          ),
        ),
      ),
      body: support.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xff8A0000),
              ),
            )
          : Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffFDDADA),
                    image: DecorationImage(
                        image: AssetImage("image/back_screen.png"),
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.bottomCenter),
                  ),
                  child: Column(
                    children: [
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
                        color: const Color(0xff8A0000),
                        border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(105, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(24)),
                    child: Row(children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 12.w, bottom: 4.h),
                          child: TextFormField(
                            controller: _controller,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Inter",
                                fontSize: 16.sp),
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
            ),
    );
  }
}
