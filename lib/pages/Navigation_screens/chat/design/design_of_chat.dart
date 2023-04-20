// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Navigation_screens/chat/models/chat_models.dart';

class Chat_design extends StatefulWidget {
  Chat_design({
    super.key,
    required this.chat_model,
  });
  List<chat_models> chat_model;

  @override
  State<Chat_design> createState() => _Chat_designState();
}

class _Chat_designState extends State<Chat_design> {
  final int id = 2;
  final ScrollController _controller = ScrollController();
  @override
  void initState() {
    _scrollToBottom();
    super.initState();
  }

  void checkListForUpdates() {
    Timer.periodic(const Duration(microseconds: 250), (timer) {
      _scrollToBottom();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Chat_design oldWidget) {
    super.didUpdateWidget(oldWidget);
    _scrollToBottom();
  }

  void _scrollToBottom() {
    if (_controller.hasClients) {
      _controller.animateTo(
        _controller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 50),
        curve: Curves.slowMiddle,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: widget.chat_model.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF8B0000),
              ),
            )
          : ListView.builder(
              controller: _controller,
              itemCount: widget.chat_model.length,
              itemBuilder: (context, index) =>
                  items_design(widget.chat_model[index]),
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
              Container(
                constraints: BoxConstraints(maxWidth: 250.w),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white,
                          Colors.red,
                        ]),
                    borderRadius: chat.userId != id
                        ? BorderRadius.only(
                            topLeft: Radius.circular(33.w),
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
              Row(
                children: [chat.edited ? editable() : const SizedBox.shrink()],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget editable() {
    return Row(
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
        SizedBox(
          width: 10.w,
        )
      ],
    );
  }
}
