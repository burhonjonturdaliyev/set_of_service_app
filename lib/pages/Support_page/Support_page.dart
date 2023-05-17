// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names, unused_local_variable

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:set_of_service_app/pages/Support_page/functions/get_message.dart';
import 'package:set_of_service_app/pages/Support_page/models/support_models.get.dart';
import 'package:set_of_service_app/pages/Support_page/models/support_models_send.dart';

import '../../const_api/api.dart';

class Support_center extends StatefulWidget {
  const Support_center({super.key});

  @override
  State<Support_center> createState() => _Support_centerState();
}

class _Support_centerState extends State<Support_center> {
  int userId = 1;
  int? IDsi;

  List<Data> support = [];
  List<Id> id = [];

  final _formKey = GlobalKey<FormState>();

  final ScrollController _controllerList = ScrollController();

  final apiUrl = Uri.parse(Api().supportPut);

  final TextEditingController _controller = TextEditingController();

  Timer? timer;
  checkListForUpdates() {
    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      fetchMessage();
    });
  }

  Future<void> putUserMessage(PostSupport send) async {
    final response = await http.post(
      apiUrl,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(send.toJson()),
    );
  }

  // Future<void> getId() async {
  //   final url = "${Api().supportGet}$userId";
  //   final uri = Uri.parse(url);
  //   try {
  //     http.Response response = await http.get(uri);
  //     if (response.statusCode == 200) {
  //       final body = response.body;
  //       final json = jsonDecode(body);
  //       final result = json["object"]["active"] as List<dynamic>;
  //       if (result.isNotEmpty) {
  //         setState(() {
  //           IDsi = json["object"]["active"][0]["id"] as int;
  //         });
  //       }
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text("Error: $e"),
  //     ));

  //     Text("Error is here => $e");
  //   }
  // }

  Future<void> fetchMessage() async {
    final Response = await Support_Api.fetchMessage(context, userId);
    if (mounted) {
      setState(() {
        Response != null ? support = Response : null;
      });
    }
  }

  cheking() {
    if (IDsi != null) {
      putUserMessage(PostSupport(
        id: IDsi,
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

  scrolling() {
    if (support.isNotEmpty) {
      _controllerList.jumpTo(_controllerList.position.maxScrollExtent + 100.h);
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
    super.dispose();
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
                      child: support.isEmpty
                          ? const Center(
                              child: Text(
                                  "Hozirda hech qanday suhbat mavjud emas!"),
                            )
                          : RefreshIndicator(
                              onRefresh: fetchMessage,
                              child: ListView.builder(
                                controller: _controllerList,
                                itemCount: support.length,
                                itemBuilder: (context, index) =>
                                    items_design(support[index]),
                              ),
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
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          await cheking();
                          await fetchMessage();
                          scrolling();
                          _controller.clear();
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Visibility(
                    visible:
                        chat.dialogs.accountType == "CLIENT" ? true : false,
                    child: Row(
                      children: [
                        Text(
                          DateFormat("HH:mm, MMMM")
                              .format(DateTime.parse(chat.dialogs.createdAt)),
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: 250.w),
                    decoration: BoxDecoration(
                        color: chat.dialogs.accountType != "ADMIN"
                            ? const Color.fromARGB(193, 231, 90, 75)
                            : const Color.fromARGB(255, 63, 187, 63),
                        borderRadius: chat.dialogs.accountType == "ADMIN"
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
                                    top: 1.h, left: 3.w, right: 3.w),
                                child: Text(
                                  "${chat.dialogs.fistName} ${chat.dialogs.lastName}",
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
                  Visibility(
                    visible: chat.dialogs.accountType == "ADMIN" ? true : false,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          DateFormat("HH:mm, MMMM")
                              .format(DateTime.parse(chat.dialogs.createdAt)),
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w600),
                        ),
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
}
