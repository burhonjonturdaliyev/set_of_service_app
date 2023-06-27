// ignore_for_file: prefer_final_fields, prefer_const_constructors_in_immutables, unused_local_variable, non_constant_identifier_names, must_be_immutable, avoid_print, duplicate_ignore

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:set_of_service_app/const_api/api.dart';
import 'package:set_of_service_app/pages/Navigation_screens/chat/functions/getMessage.dart';

import 'package:set_of_service_app/pages/Navigation_screens/chat/models/chat_models.dart';
import 'package:set_of_service_app/pages/Navigation_screens/chat/models/user_send_models.dart';

class Chat extends StatefulWidget {
  Chat({super.key, required this.userId});
  int userId;

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final _formkey = GlobalKey<FormState>();

  List<chat_models> models = [];
  List<int> colors = [
    0xFFFFC107, // Amber
    0xFFF44336, // Red
    0xFFE91E63, // Pink
    0xFF9C27B0, // Purple
    0xFF673AB7, // Deep Purple
    0xFF3F51B5, // Indigo
    0xFF2196F3, // Blue
    0xFF03A9F4, // Light Blue
    0xFF00BCD4, // Cyan
    0xFF009688, // Teal
    0xFF4CAF50, // Green
    0xFF8BC34A, // Light Green
    0xFFFF9800, // Orange
    0xFF795548, // Brown
    0xFF607D8B, // Blue Grey
    0xFF9E9E9E, // Grey
    0xFFE91E63, // Pink
    0xFF673AB7, // Deep Purple
    0xFF03A9F4, // Light Blue
    0xFF4CAF50, // Green
  ];
  final ScrollController _controller = ScrollController();
  late String xabarlar;

  Timer? timer;

  Future<void> putUserMessage(user_send send) async {
    try {
      final response = await http.post(
        Uri.parse(Api().globatChatPut),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(send.toJson()),
      );
      if (response.statusCode == 200) {
        setState(() {
          _controllerText.clear();
        });
        await fetchMessage();
        await scrolling();
      } else {
        // ignore: avoid_print
        print(response.statusCode);
      }
    } catch (e) {
      print("Here is mistake: $e");
    }
  }

  void checkListForUpdates() {
    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      fetchMessage();
    });
  }

  scrolling() {
    if (models.isNotEmpty && models.length >= 8) {
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
                            items_design(models[index], colors[index % 20]),
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
                        xabarlar = _controllerText.text;
                        if (xabarlar.isNotEmpty) {
                          await putUserMessage(user_send(
                              message: xabarlar, userId: widget.userId));
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

  Widget items_design(chat_models chat, colors) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: chat.userId == widget.userId
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Visibility(
                    visible: chat.userId != widget.userId ? true : false,
                    child: CircleAvatar(
                      backgroundColor: Color(
                        colors,
                      ),
                      child: Text(
                        chat.username[0],
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.bold,
                            fontSize: 22.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Visibility(
                    visible: chat.userId == widget.userId ? true : false,
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
                        color: const Color.fromARGB(234, 228, 201, 201),
                        // chat.userId == widget.userId
                        borderRadius: BorderRadius.only(
                            bottomRight: chat.userId != widget.userId
                                ? Radius.circular(15.w)
                                : Radius.zero,
                            bottomLeft: chat.userId == widget.userId
                                ? Radius.circular(15.w)
                                : Radius.zero,
                            topLeft: Radius.circular(15.w),
                            topRight: Radius.circular(15.w)),
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
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Inter",
                                      fontSize: 9.sp),
                                ),
                              ),
                              Text(
                                chat.message,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Inter",
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: chat.userId != widget.userId ? true : false,
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
