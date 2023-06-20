// ignore_for_file: file_names, must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/pages/Support_page/models/support_models.get.dart';
import 'package:http/http.dart' as http;
import 'package:set_of_service_app/pages/Support_page/screens/additional_Support.dart';
import '../../../const_api/api.dart';

class DeleteMessageSupport extends StatefulWidget {
  DeleteMessageSupport({super.key, required this.userId});
  int userId;

  @override
  State<DeleteMessageSupport> createState() => _DeleteMessageSupportState();
}

class _DeleteMessageSupportState extends State<DeleteMessageSupport> {
  List<DeleteModels> models = [];
  Future<void> fetchDelete() async {
    try {
      final uri = "${Api().supportGet}${widget.userId}";
      final url = Uri.parse(uri);
      final responce = await http.get(url);
      if (responce.statusCode == 200) {
        final body = responce.body;
        final json = jsonDecode(body);
        final result = json['object']['delete'] as List<dynamic>;
        final delete = result
            .map((e) => DeleteModels(
                id: e["id"],
                createdAt: e["createdAt"],
                createdBy: e['createdBy'],
                updatedAt: e['updatedAt'],
                deleted: e['deleted'],
                userId: e['userId'],
                status: e['status']))
            .toList();
        if (mounted) {
          setState(() {
            models = delete;
          });
        }
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  @override
  void initState() {
    fetchDelete();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff8B0000),
        centerTitle: true,
        title: Text(
          "Tugatilgan chatlar",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 5,
            fontFamily: "Inter",
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/back_screen.png"),
                fit: BoxFit.fitHeight)),
        child: models.isEmpty
            ? const Center(
                child: Text("Arxivlangan xabarlar mavjud emas!"),
              )
            : ListView.builder(
                itemCount: models.length,
                itemBuilder: (context, index) =>
                    itemsDesign(models[index], index),
              ),
      ),
    );
  }

  Widget itemsDesign(DeleteModels models, index) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 5.w, right: 5.w),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            PageTransition(
                child: AdditionalSupport(index: index),
                type: PageTransitionType.leftToRightWithFade,
                curve: Curves.bounceInOut)),
        child: Container(
          height: 50.h,
          width: MediaQuery.of(context).size.width * 90,
          decoration: BoxDecoration(
              color: const Color.fromARGB(177, 228, 201, 201),
              borderRadius: BorderRadius.circular(13.w)),
          child: Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              Icon(
                Icons.calendar_month_outlined,
                color: Colors.black54,
                size: 25.w,
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(DateFormat('dd-MMMM, yyyy')
                  .format(DateTime.parse(models.createdAt.toString())))
            ],
          ),
        ),
      ),
    );
  }
}
