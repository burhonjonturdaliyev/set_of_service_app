// ignore_for_file: camel_case_types, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:set_of_service_app/pages/Support_page/Widget/design_container.dart';
import 'package:set_of_service_app/pages/Support_page/functions/get_message.dart';
import 'package:set_of_service_app/pages/Support_page/models/support_models.get.dart';
import 'package:set_of_service_app/pages/Support_page/models/support_models_send.dart';

class Support_center extends StatefulWidget {
  const Support_center({super.key});

  @override
  State<Support_center> createState() => _Support_centerState();
}

class _Support_centerState extends State<Support_center> {
  int userId = 1;

  List<Data> support = [];
  List<Id> id = [];

  final _formKey = GlobalKey<FormState>();

  late int questionTicketId = id[0] as int;

  final apiUrl = Uri.parse('http://185.196.213.43:7088/api/support-chats');

  final TextEditingController _controller = TextEditingController();
  Future<void> putUserMessage(PostSupport send) async {
    final response = await http.post(
      apiUrl,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(send.toJson()),
    );
  }

  Future<void> getId() async {
    final Response = await Support_Api.fetchId(context, userId);
    setState(() {
      Response != null ? id = Response : null;
    });
    print("Here is length: ${id.length}");
  }

  Future<void> fetchMessage() async {
    final Response = await Support_Api.fetchMessage(context, userId);
    setState(() {
      Response != null ? support = Response : null;
    });
  }

  void cheking() {
    if (id.isNotEmpty) {
      putUserMessage(PostSupport(
        id: questionTicketId,
        userId: userId,
        dialogsa: Dialogsa(
          message: _controller.text,
          userId: userId,
        ),
      ));
    } else {
      putUserMessage(PostSupport(
        userId: userId,
        dialogsa: Dialogsa(
          message: _controller.text,
          userId: userId,
        ),
      ));
    }
  }

  @override
  void initState() {
    getId();
    fetchMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffFDDADA),
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
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
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
                        child: SupportDesign(
                          models: support,
                          userId: userId,
                          getMessage: fetchMessage,
                        )),
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
                        width: 1, color: const Color.fromARGB(105, 0, 0, 0)),
                    borderRadius: BorderRadius.circular(24)),
                child: Row(children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 12.w, bottom: 4.h),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {}
                          return null;
                        },
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
                        if (_formKey.currentState!.validate()) {}
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
      ),
    );
  }
}
