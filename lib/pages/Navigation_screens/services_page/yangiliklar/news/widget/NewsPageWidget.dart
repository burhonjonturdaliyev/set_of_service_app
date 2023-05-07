// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/news/function/newFunctions.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/news/models/newsModels.dart';

class NewPageWidget extends StatefulWidget {
  NewPageWidget({super.key, required this.type, required this.name});

  String type;
  String name;

  @override
  State<NewPageWidget> createState() => _NewPageWidgetState();
}

class _NewPageWidgetState extends State<NewPageWidget> {
  List<infoNew> information = [];

  Future<void> getInfo() async {
    final Response = await newFunctions().getInfoNew(context, widget.type);
    setState(() {
      Response != null ? information = Response : Response == null;
    });
    print("Here is length: ${information.length}");
  }

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.name} xabarlar"),
        backgroundColor: const Color(0xFF8B0000),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/back_screen.png"),
                fit: BoxFit.fitHeight)),
        child: information.isNotEmpty
            ? ListView.builder(
                itemCount: information.length,
                itemBuilder: (context, index) => itemshow(information[index]),
              )
            : const Center(
                child: Text("Hozircha yangiliklar mavjud emas!"),
              ),
      ),
    );
  }
}

Widget itemshow(infoNew info) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.0.h, left: 8.w, right: 8.w, top: 4.h),
    child: Container(
      decoration: const BoxDecoration(color: Colors.white70),
      child: Column(children: [
        Container(
          height: 120.h,
          decoration: const BoxDecoration(color: Colors.black),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(info.title),
        Text(info.description),
      ]),
    ),
  );
}
