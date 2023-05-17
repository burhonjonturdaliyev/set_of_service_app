// ignore_for_file: prefer_final_fields, prefer_const_constructors_in_immutables, unused_local_variable, non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:set_of_service_app/pages/Navigation_screens/chat/functions/getMessage.dart';

import 'package:set_of_service_app/pages/Navigation_screens/chat/models/chat_models.dart';
import 'package:set_of_service_app/pages/Navigation_screens/chat/models/user_send_models.dart';

class Chat extends StatefulWidget {
  Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final _formkey = GlobalKey<FormState>();
  final int id = 2;
  List<chat_models> models = [];
  final ScrollController _controller = ScrollController();

  Timer? timer;

  Future<void> putUserMessage(user_send send) async {
    final response = await http.post(
      Uri.parse('http://185.196.213.43:7088/api/chat'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(send.toJson()),
    );
  }

  void checkListForUpdates() {
    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      fetchMessage();
    });
  }

  scrolling() {
    if (models.isNotEmpty) {
      _controller.jumpTo(_controller.position.maxScrollExtent + 100.h);
    }
  }

  Future<void> fetchMessage() async {
    final Response = await getMessage().fetchMessage(context);
    if (mounted) {
      Response != null ? models = Response : null;
    }
  }

  @override
  void initState() {
    fetchMessage();
    checkListForUpdates();

    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  TextEditingController _controllerText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Stack(
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
                child: models.isEmpty
                    ? const Center(
                        child: Text(
                            "Hozirda hech qanday yozishmalar mavjud emas!"))
                    : ListView.builder(
                        controller: _controller,
                        itemCount: models.length,
                        itemBuilder: (context, index) =>
                            items_design(models[index]),
                      ),
              )),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return null;
                        }
                        return null;
                      },
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Inter",
                          fontSize: 16.sp),
                      controller: _controllerText,
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
                    onTap: () async {
                      if (_formkey.currentState!.validate()) {
                        final value = _controllerText.text;
                        if (value.isNotEmpty) {
                          await putUserMessage(
                              user_send(message: value, userId: 2));
                          await fetchMessage();
                          await scrolling();
                          setState(() {
                            _controllerText.clear();
                          });
                        }
                      }
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

  Widget items_design(chat_models chat) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment:
            chat.userId == id ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Visibility(
                    visible: chat.userId == id ? true : false,
                    child: Row(
                      children: [
                        Text(
                          DateFormat("HH:mm, MMMM").format(chat.createdAt!),
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: 250.w),
                    decoration: BoxDecoration(
                        color: chat.userId == id
                            ? const Color.fromARGB(193, 231, 90, 75)
                            : const Color.fromARGB(255, 63, 187, 63),
                        // gradient: chat.userId == id
                        //     ? const LinearGradient(
                        //         begin: Alignment.topLeft,
                        //         end: Alignment.bottomRight,
                        //         colors: [
                        //             Colors.white,
                        //             Colors.blue,
                        //           ])
                        //     : const LinearGradient(
                        //         begin: Alignment.topLeft,
                        //         end: Alignment.bottomRight,
                        //         colors: [
                        //             Colors.white,
                        //             Colors.red,
                        //           ]),
                        borderRadius: chat.userId != id
                            ? BorderRadius.only(
                                bottomLeft: Radius.circular(33.w),
                                topRight: Radius.circular(33.w),
                                bottomRight: Radius.circular(33.w),
                              )
                            : BorderRadius.only(
                                topLeft: Radius.circular(33.w),
                                topRight: Radius.circular(33.w),
                                bottomLeft: Radius.circular(33.w),
                              ),
                        border: Border.all(width: 1, color: Colors.black26)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 2.h, left: 3.w, right: 3.w),
                                child: Text(
                                  chat.username,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontFamily: "Inter",
                                      fontSize: 12.sp),
                                ),
                              ),
                              Text(chat.message),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: chat.userId != id ? true : false,
                    child: Row(
                      children: [
                        Text(
                          DateFormat("HH:mm, MMMM").format(chat.createdAt!),
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget editable() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          Icons.edit,
          color: Colors.black54,
          size: 9.w,
        ),
        SizedBox(
          width: 2.w,
        ),
        Text(
          "Tahrirlandi",
          style: TextStyle(
              fontFamily: "Inter", fontSize: 9.sp, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
