import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Support_page/models/support_models.get.dart';

class SupportDesign extends StatefulWidget {
  SupportDesign({super.key, required this.models, required this.userId});
  int userId;
  List<Data> models;

  @override
  State<SupportDesign> createState() => _SupportDesignState();
}

class _SupportDesignState extends State<SupportDesign> {
  final ScrollController _controller = ScrollController();
  @override
  void initState() {
    _scrollToBottom();
    super.initState();
  }

  void checkListForUpdates() {
    Timer.periodic(const Duration(microseconds: 150), (timer) {
      _scrollToBottom();
    });
  }

  @override
  void didUpdateWidget(covariant SupportDesign oldWidget) {
    super.didUpdateWidget(oldWidget);
    _scrollToBottom();
  }

  void _scrollToBottom() {
    if (_controller.hasClients) {
      _controller.animateTo(
        _controller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 150),
        curve: Curves.slowMiddle,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: widget.models.isEmpty
          ? const Center(
              child: Text("Hozirda hech qanday suhbat mavjud emas!"),
            )
          : ListView.builder(
              controller: _controller,
              itemCount: widget.models.length,
              itemBuilder: (context, index) =>
                  items_design(widget.models[index]),
            ),
    );
  }

  Widget items_design(Data chat) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: chat.dialogs.accountType == "CLIENT"
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
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
                    borderRadius: chat.dialogs.accountType == "ADMIN"
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
                              chat.dialogs.accountType,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "Inter",
                                  fontSize: 12.sp),
                            ),
                          ),
                          Text(chat.dialogs.message),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
