// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
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
    // ignore: non_constant_identifier_names
    final Response = await newFunctions().getInfoNew(context, widget.type);
    setState(() {
      Response != null ? information = Response : Response == null;
    });
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
        centerTitle: true,
        title: Text(
          "${widget.name} xabarlar",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              fontFamily: "Inter"),
        ),
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
                itemBuilder: (context, index) =>
                    itemshow(information[index], context),
              )
            : const Center(
                child: Text("Hozircha yangiliklar mavjud emas!"),
              ),
      ),
    );
  }
}

Widget itemshow(infoNew info, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.0.h, left: 8.w, right: 8.w, top: 4.h),
    child: Container(
      decoration: const BoxDecoration(color: Colors.white70),
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.w),
            topRight: Radius.circular(12.w),
          ),
          child: Image.network(
            "https://media.istockphoto.com/id/1135322304/photo/girl-carrying-a-school-bag.jpg?s=2048x2048&w=is&k=20&c=uklhuWev69_O-uI6hILvyfmNJOoYcaFm8nyV9yp2xsg=",
            errorBuilder: (context, error, stackTrace) => SizedBox(
              height: 120.h,
              width: 280.w,
              child: const Center(
                child: Text("Serverga bog'lanib bulmayapti"),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Expanded(child: Text(info.title)),
          ],
        ),
        Row(
          children: [
            Expanded(child: Text(info.description)),
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(DateFormat("dd-MMMM, yyyy")
                .format(DateTime.parse(info.createdAt)))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.comment_outlined,
                  color: Colors.black54,
                  size: 22.w,
                ),
                label: Text(
                  "Komment",
                  style: TextStyle(
                      color: Colors.black54,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp),
                ))
          ],
        )
      ]),
    ),
  );
}
