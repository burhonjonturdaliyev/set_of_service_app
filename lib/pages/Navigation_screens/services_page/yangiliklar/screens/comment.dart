// ignore_for_file: unused_local_variable, non_constant_identifier_names, unrelated_type_equality_checks, avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:set_of_service_app/const_api/api.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/function/newFunctions.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/models/edit_comment_model.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/models/newsCommentModels.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class CommentsNews extends StatefulWidget {
  CommentsNews(
      {super.key,
      required this.id,
      required this.createdAt,
      required this.createdBy,
      required this.updatedAt,
      required this.deleted,
      required this.title,
      required this.description,
      required this.newsType,
      required this.photo});

  int? id;
  String? createdAt;
  int? createdBy;
  String? updatedAt;
  bool? deleted;
  String? title;
  String? description;
  String? newsType;
  String? photo;

  @override
  State<CommentsNews> createState() => _CommentsNewsState();
}

class _CommentsNewsState extends State<CommentsNews> {
  bool edit_qilish = false;
  int? userId;
  int? commentId;
  final ScrollController _controller = ScrollController();
  final TextEditingController _kommentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  SharedPreferences? logindata;

  Timer? timer;
  List<getting_komment_model> newComments = [];
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

  Future<void> getSharedPreferencesInstance() async {
    logindata = await SharedPreferences.getInstance();
    int? id = logindata?.getInt("id");
    if (id != null) {
      setState(() {
        userId = id;
      });
    }
  }

  Future<void> getComment() async {
    final Responce = await newFunctions()
        .getComments(context, "${Api().getComment}${widget.id}");
    if (mounted) {
      setState(() {
        Responce != null ? newComments = Responce : null;
      });
    }
  }

  Future<void> putUserMessage(comment_adding_model send) async {
    final response = await http.post(
      Uri.parse(Api().putComment),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(send.toJson()),
    );
  }

  void checkListForUpdates() {
    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      getComment();
    });
  }

  scrolling() {
    if (newComments.isNotEmpty) {
      _controller.jumpTo(_controller.position.maxScrollExtent + 100.h);
    }
  }

  @override
  void initState() {
    getSharedPreferencesInstance();
    getComment();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xFF8B0000),
          title: Text(
            "Izohlar bo'limi",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                fontFamily: "Inter"),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              "image/back_screen.png",
            ),
            fit: BoxFit.fitHeight,
          )),
          child: newComments.isEmpty
              ? Stack(
                  children: [
                    Positioned(
                        left: 0.w,
                        right: 0.w,
                        bottom: 0.h,
                        top: 0.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Birinchi izohni siz qoldirishingiz mumkin!",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "Inter",
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        )),
                    textfield(),
                  ],
                )
              : Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        width: 375.w,
                        height: 745.h,
                        child: ListView.builder(
                          controller: _controller,
                          itemCount: newComments.length,
                          itemBuilder: (context, index) => designCommets(
                              newComments[index], colors[index % 20]),
                        ),
                      ),
                    ),
                    textfield()
                  ],
                ),
        ));
  }

  Widget textfield() {
    return Positioned(
      bottom: 5.h,
      left: 5.w,
      right: 5.w,
      child: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xFF8B0000),
              borderRadius: BorderRadius.circular(33.w)),
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
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
                  maxLines: 1,
                  controller: _kommentController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Izoh yozish",
                      hintStyle: TextStyle(
                          color: Colors.white60,
                          fontSize: 16.sp,
                          fontFamily: "Inter")),
                )),
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      final value = _kommentController.text;
                      if (value.isNotEmpty) {
                        edit_qilish
                            ? {
                                await edit(edit_comment_model(
                                    id: commentId,
                                    message: _kommentController.text,
                                    newsId: widget.id,
                                    userId: userId)),
                                edit_qilish = false
                              }
                            : {
                                await putUserMessage(comment_adding_model(
                                    message: _kommentController.text,
                                    newsId: widget.id,
                                    userId: userId))
                              };
                        await getComment();
                        await scrolling();
                        setState(() {
                          _kommentController.clear();
                        });
                      }
                    }
                  },
                  child: CircleAvatar(
                    radius: 24.w,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      "image/telegram.png",
                      color: Colors.white,
                      width: 30.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget designCommets(getting_komment_model comment, colors) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: comment.createdBy != userId
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Visibility(
            visible: comment.createdBy == userId ? true : false,
            child: Row(
              children: [
                Text(
                  DateFormat("HH:mm, dd-MMMM")
                      .format(DateTime.parse(comment.createdAt!)),
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 11.sp,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 5.w,
                ),
              ],
            ),
          ),
          Visibility(
              visible: comment.edited! && comment.createdBy == userId,
              child: Row(
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.black,
                    size: 16.w,
                  )
                ],
              )),
          Visibility(
            visible: comment.createdBy != userId ? true : false,
            child: CircleAvatar(
              backgroundColor: Color(
                colors,
              ),
              child: Text(
                comment.userName![0],
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
          Container(
            constraints: BoxConstraints(maxWidth: 200.w),
            decoration: BoxDecoration(
                color: comment.createdBy != userId
                    ? const Color.fromARGB(193, 231, 90, 75)
                    : const Color.fromARGB(167, 161, 82, 73),
                borderRadius: comment.createdBy == userId
                    ? BorderRadius.only(
                        topLeft: Radius.circular(13.w),
                        topRight: Radius.circular(13.w),
                        bottomLeft: Radius.circular(13.w))
                    : BorderRadius.only(
                        topLeft: Radius.circular(13.w),
                        topRight: Radius.circular(13.w),
                        bottomRight: Radius.circular(13.w)),

                //BorderRadius.circular(23.w),
                border: Border.all(width: 1, color: Colors.black26)),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10.w, right: 10.w, bottom: 10.h, top: 5.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: comment.createdBy != userId ? true : false,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 2.h, left: 3.w, right: 3.w),
                              child: Text(
                                comment.userName!,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: "Inter",
                                    fontSize: 10.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            comment.message!,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Inter",
                                fontSize: 12.35.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Visibility(
              visible: comment.edited! && comment.createdBy != userId,
              child: Row(
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.black,
                    size: 16.w,
                  )
                ],
              )),
          Visibility(
            visible: comment.createdBy != userId ? true : false,
            child: Row(
              children: [
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  DateFormat("HH:mm dd-MMMM")
                      .format(DateTime.parse(comment.createdAt!)),
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 10.sp,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 22.w,
            child: Visibility(
                visible: comment.createdBy == userId ? true : false,
                child: PopupMenuButton<int>(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Text(
                        'Tahrirlash',
                        style: TextStyle(fontFamily: "Inter", fontSize: 14.sp),
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text(
                        'O\'chirish',
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: "Inter",
                            fontSize: 14.sp),
                      ),
                    ),
                  ],
                  onSelected: (value) {
                    switch (value) {
                      case 1:
                        {
                          setState(() {
                            _kommentController.text = comment.message!;
                            commentId = comment.id;
                            edit_qilish = true;
                          });
                        }
                        break;
                      case 2:
                        deleteNote(comment.id);
                        break;
                    }
                  },
                )),
          ),
        ],
      ),
    );
  }

  deleteNote(commentId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SizedBox(
          height: 85.h,
          width: 60.w,
          child: Column(
            children: [
              Text(
                "Xabaringizni o'chirishni xoxlaysizmi?",
                style: TextStyle(fontFamily: "Inter", fontSize: 16.sp),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF8B0000)),
                      onPressed: () async {
                        Navigator.pop(context);
                        await delete(commentId);
                        await getComment();
                      },
                      child: Text(
                        "Ha",
                        style: TextStyle(fontFamily: "Inter", fontSize: 13.sp),
                      )),
                  SizedBox(
                    width: 10.w,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 194, 79, 79)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Yo'q",
                        style: TextStyle(fontFamily: "Inter", fontSize: 13.sp),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  delete(commentId) async {
    final uri = '${Api().deleteComment}$userId/$commentId';
    final url = Uri.parse(uri);
    final response = await http.delete(url);
  }

  Future<void> edit(edit_comment_model send) async {
    final uri = Api().editComment;
    final url = Uri.parse(uri);

    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(send.toJson()),
    );
    print(response.statusCode);
    print(response.body);
  }
}
