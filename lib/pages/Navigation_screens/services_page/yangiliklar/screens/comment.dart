// ignore_for_file: unused_local_variable, non_constant_identifier_names, unrelated_type_equality_checks

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/function/newFunctions.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/models/newsCommentModels.dart';

// ignore: must_be_immutable
class CommentsNews extends StatefulWidget {
  CommentsNews(
      {super.key,
      required this.id,
      required this.createdAt,
      required this.description,
      required this.title,
      required this.photo,
      required this.countryInfoType});

  int id;
  String createdAt;
  String title;
  String description;
  String countryInfoType;
  int photo;

  @override
  State<CommentsNews> createState() => _CommentsNewsState();
}

class _CommentsNewsState extends State<CommentsNews> {
  int userId = 1;
  final ScrollController _controller = ScrollController();
  final TextEditingController _kommentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Timer? timer;
  List<newCommentModels> newComments = [
    newCommentModels(
        id: 2,
        createdAt: "2012-12-31T22:00:00.000Z",
        message: "Hi",
        name: "Abdusattor"),
    newCommentModels(
        id: 3,
        createdAt: "2012-12-31T22:00:00.000Z",
        message: "Salom",
        name: "Bahrom"),
    newCommentModels(
        id: 4,
        createdAt: "2012-12-31T22:00:00.000Z",
        message: "Rostmikan",
        name: "Do'stmuhammad"),
    newCommentModels(
        id: 5,
        createdAt: "2012-12-31T22:00:00.000Z",
        message: "Shunaqa busa kere",
        name: "Sirli odam"),
    newCommentModels(
        id: 1,
        createdAt: "2012-12-31T22:00:00.000Z",
        message: "Shunaqa busa kere",
        name: "Burhonjon"),
  ];
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

  Future<void> getComment() async {
    final Responce = await newFunctions().getComments(context, "link");
    if (mounted) {
      setState(() {
        Responce != null ? newComments = Responce : null;
      });
    }
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
          child: RefreshIndicator(
            onRefresh: getComment,
            child: newComments.isEmpty
                ? Center(
                    child: Lottie.asset("animations/empty.json",
                        repeat: false, width: 300.w, height: 180.h))
                : Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: SizedBox(
                          width: 375.w,
                          height: 750.h,
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
          ),
        ));
  }

  Widget textfield() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
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
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      print(
                        "Bosildi",
                      );
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

  Widget designCommets(newCommentModels comment, colors) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: comment.id != userId
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Visibility(
            visible: comment.id == userId ? true : false,
            child: Row(
              children: [
                Text(
                  DateFormat("HH:mm, dd-MMMM")
                      .format(DateTime.parse(comment.createdAt)),
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
            visible: comment.id != userId ? true : false,
            child: CircleAvatar(
              backgroundColor: Color(
                colors,
              ),
              child: Text(
                comment.name[0],
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
            constraints: BoxConstraints(maxWidth: 250.w),
            decoration: BoxDecoration(
                color: comment.id != userId
                    ? const Color.fromARGB(193, 231, 90, 75)
                    : const Color.fromARGB(255, 63, 187, 63),
                borderRadius: BorderRadius.circular(23.w),
                border: Border.all(width: 1, color: Colors.black26)),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: comment.id != userId ? true : false,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 2.h, left: 3.w, right: 3.w),
                              child: Text(
                                comment.name,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: "Inter",
                                    fontSize: 12.sp),
                              ),
                            ),
                          ),
                          Text(comment.message),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Visibility(
            visible: comment.id != userId ? true : false,
            child: Row(
              children: [
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  DateFormat("HH:mm dd-MMMM")
                      .format(DateTime.parse(comment.createdAt)),
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 11.sp,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
