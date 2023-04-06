import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/models/comment_models.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/models/yangiliklar_models.dart';

class News_comments extends StatefulWidget {
  News_comments({
    super.key,
    required this.yangilik,
  });
  final yangiliklar_models yangilik;

  @override
  State<News_comments> createState() => _News_commentsState();
}

class _News_commentsState extends State<News_comments> {
  TextEditingController send_message = TextEditingController();
  List<comment_models> comment = [];
  Future<void> _fetchComment() async {
    try {
      debugPrint("Yuklash boshlandi");
      const uri = "https://randomuser.me/api/?results=25";
      // final uri = widget.yangilik.list_url;
      final url = Uri.parse(uri);
      final response = await http.get(url);
      final body = response.body;
      final json = jsonDecode(body);
      final transforming = json["results"] as List<dynamic>;
      final result = transforming.map((e) {
        final name = e["name"]["first"];
        return comment_models(
            name: name,
            message: e["country"],
            check_id: false,
            time: e["dob"]["date"]);
      }).toList();

      setState(() {
        comment = result;
      });

      debugPrint("Yuklash tugatildi");
    } catch (e) {
      print("XAto $e");
    }
  }

  _addingElement() {
    comment.add(comment_models(
        name: "Burkhonjon",
        message: send_message.text,
        check_id: true,
        time: DateTime.now()));
  }

  @override
  void initState() {
    _fetchComment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: comment.isEmpty ? Colors.white : const Color(0xFF8B0000),
      body: comment.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Container(
                width: 375.w,
                height: 812.h,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("image/back_screen.png"),
                        fit: BoxFit.cover)),
                child: Column(children: [
                  _image_provider(widget.yangilik),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 5.w, right: 5.w, bottom: 10.h),
                      child: _info_provider(widget.yangilik)),
                  Expanded(child: _comment_provider()),
                  send_message_provider()
                ]),
              ),
            ),
    );
  }

  _image_provider(yangiliklar_models yangilik) {
    return Container(
      width: 375.w,
      height: 215.h,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                yangilik.foto,
              ),
              fit: BoxFit.cover)),
    );
  }

  _info_provider(yangiliklar_models yangilik) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        yangilik.info,
        textAlign: TextAlign.justify,
      ),
    );
  }

  _comment_provider() {
    return Container(
      height: 300.h,
      width: double.infinity,
      decoration: const BoxDecoration(color: Color.fromARGB(22, 244, 67, 54)),
      child: ListView.builder(
        itemCount: comment.length,
        itemBuilder: (context, index) {
          return Container();
        },
      ),
    );
  }

  send_message_provider() {
    return Container(
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 191, 191, 191),
          borderRadius: BorderRadius.circular(21.w)),
      child: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 5.w),
        child: Row(children: [
          Expanded(
            child: TextFormField(
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Inter",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal),
              controller: send_message,
              decoration: InputDecoration(
                  hintStyle: TextStyle(
                      color: Colors.black54,
                      fontFamily: "Inter",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300),
                  hintText: "Komment qoldirish",
                  border: InputBorder.none),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                send_message.clear();
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Center(
                child: Image.asset(
                  "image/telegram.png",
                  width: 24,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
