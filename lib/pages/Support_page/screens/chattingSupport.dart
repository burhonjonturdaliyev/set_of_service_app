// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names, unused_local_variable, must_be_immutable, unnecessary_null_comparison, avoid_print, use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:set_of_service_app/pages/Support_page/functions/get_message.dart';
import 'package:set_of_service_app/pages/Support_page/models/support_models.get.dart';
import 'package:set_of_service_app/pages/Support_page/models/support_models_send.dart';
import 'package:set_of_service_app/registr/sign_in/Sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../const_api/api.dart';

class Support_center extends StatefulWidget {
  Support_center({super.key, required this.userId});
  int userId;

  @override
  State<Support_center> createState() => _Support_centerState();
}

class _Support_centerState extends State<Support_center> {
  int? IDsi;

  List<Data> support = [];
  List<Id> id = [];

  final _formKey = GlobalKey<FormState>();

  final ScrollController _controllerList = ScrollController();

  final TextEditingController _controller = TextEditingController();
  SharedPreferences? logindata;

  Timer? timer;
  checkListForUpdates() {
    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      fetchMessage();
    });
  }

  logut() async {
    logindata = await SharedPreferences.getInstance();
    logindata?.clear();
  }

  Future<void> putUserMessage(String message) async {
    try {
      final post = PostSupport(
        dialogsa: Dialogsa(message: message, userId: widget.userId),
        userId: widget.userId,
      );
      final postNotNull = PostSupport(
        dialogsa: Dialogsa(message: message, userId: widget.userId),
        userId: widget.userId,
        id: IDsi,
      );
      final response = await http.post(
        Uri.parse(Api().supportPut),
        headers: {'Content-Type': 'application/json'},
        body: IDsi == null
            ? jsonEncode(post.toJson())
            : jsonEncode(postNotNull.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        fetchMessage();
        scrolling();
        _controller.clear();
      } else if (response.statusCode == 403) {
        await logut();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => Sign_in(),
          ),
          (route) => false,
        );
      } else {
        String? xabar;
        print(response.statusCode);
        final body = response.body;
        final json = jsonDecode(body);
        print(body);
        setState(() {
          xabar = json['message'];
        });
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: const Color(0xff8B0000),
            content: SizedBox(
              height: 150.h,
              width: 150.w,
              child: Center(
                child: Text(
                  xabar ?? "Nimadir xato",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                    fontSize: 13.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      }
    } catch (e) {
      // Handle error
      print('Error: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: const Color(0xff8B0000),
          content: SizedBox(
            height: 150.h,
            width: 150.w,
            child: Center(
              child: Text(
                "Uzur sizning xabaringiz yuborilmadi!. Iltimos, internet aloqangizni qaytadan tekshiring!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w700,
                  fontSize: 13.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  getId() async {
    final url = "${Api().supportGet}${widget.userId}";
    final uri = Uri.parse(url);
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body;
        final json = jsonDecode(body);
        final result = json["object"]["active"] as List<dynamic>;
        print('Bu yerda ID :${json["object"]["active"][0]["id"]}');
        if (result.isNotEmpty) {
          setState(() {
            IDsi = json["object"]["active"][0]["id"] as int;
          });
          print("Set qilindi id: $IDsi");
        }
      } else if (response.statusCode == 403) {
        await logut();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => Sign_in(),
          ),
          (route) => false,
        );
      }
    } catch (e) {
      Text("Error is here => $e");
    }
  }

  Future<void> fetchMessage() async {
    final Response = await Support_Api.fetchMessage(context, widget.userId);
    if (mounted) {
      setState(() {
        Response != null ? support = Response : null;
      });
    }
  }

  scrolling() {
    if (support.isNotEmpty) {
      _controllerList.jumpTo(_controllerList.position.maxScrollExtent + 100.h);
    }
  }

  @override
  void initState() {
    getId();
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
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(bottom: 60.h),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
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
                        if (_controller != null) {
                          putUserMessage(_controller.text);
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
                          DateFormat("HH:mm, dd-MMMM")
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
                          DateFormat("HH:mm, dd-MMMM")
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
