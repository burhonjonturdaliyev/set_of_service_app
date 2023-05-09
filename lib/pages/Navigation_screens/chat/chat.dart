// ignore_for_file: prefer_final_fields, prefer_const_constructors_in_immutables

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Navigation_screens/chat/design/design_of_chat.dart';

import 'package:set_of_service_app/pages/Navigation_screens/chat/models/chat_models.dart';
import 'package:set_of_service_app/pages/Navigation_screens/chat/models/user_send_models.dart';

class Chat extends StatefulWidget {
  Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final _formkey = GlobalKey<FormState>();

  List<chat_models> models = [];
  Timer? timer;
  //List<user_send> send = [];

  Future<void> putUserMessage(user_send send) async {
    final response = await http.post(
      Uri.parse('http://185.196.213.43:7088/api/chat'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(send.toJson()),
    );
    print(response.body);
  }

  void checkListForUpdates() {
    timer = Timer.periodic(const Duration(minutes: 3), (timer) {
      fetchMessage();
    });
  }

  Future<void> fetchMessage() async {
    try {
      print("Loading started");
      const uri = "http://185.196.213.43:7088/api/chat";
      final url = Uri.parse(uri);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final body = response.body;

        final json = jsonDecode(body);
        //print(json);
        final result = json["object"] as List<dynamic>;
        final chates = result
            .map(
              (e) => chat_models(
                  message: e["message"],
                  username: e["username"],
                  userId: e["userId"] as int,
                  edited: e["edited"] as bool),
            )
            .toList();
        setState(() {
          models = chates;
        });
      } else {}
    } catch (e) {
      print("Error occurred => $e");
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

  TextEditingController _controller = TextEditingController();

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
                    child: Chat_design(
                      chat_model: models,
                    )),
              ),
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
                      controller: _controller,
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
                      //  checkListForUpdates();
                      if (_formkey.currentState!.validate()) {
                        final value = _controller.text;
                        if (value.isNotEmpty) {
                          // Perform the asynchronous work first
                          await putUserMessage(
                              user_send(message: value, userId: 2));
                          models.add(chat_models(
                              edited: false,
                              username: "Burkhonjon Turdialiev",
                              message: value,
                              userId: 2));
                          // Update the state synchronously
                          setState(() {
                            _controller.clear();
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
}
