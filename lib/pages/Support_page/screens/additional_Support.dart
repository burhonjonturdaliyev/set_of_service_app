// ignore_for_file: must_be_immutable, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:set_of_service_app/pages/Support_page/models/support_models.get.dart';
import 'package:http/http.dart' as http;

import '../../../const_api/api.dart';

class AdditionalSupport extends StatefulWidget {
  AdditionalSupport({
    super.key,
    required this.index,
  });

  late int index;

  @override
  State<AdditionalSupport> createState() => _AdditionalSupportState();
}

class _AdditionalSupportState extends State<AdditionalSupport> {
  List<Dialogs> models = [];
  Future<void> getItems() async {
    try {
      final uri = "${Api().supportGet}1";
      final url = Uri.parse(uri);
      final responce = await http.get(url);
      if (responce.statusCode == 200) {
        final body = responce.body;
        final json = jsonDecode(body);
        final result =
            json['object']['delete'][widget.index]['dialogs'] as List<dynamic>;

        final delete = result
            .map((e) => Dialogs(
                createdAt: e['createdAt'],
                userId: e['userId'],
                fistName: e['fistName'],
                lastName: e['lastName'],
                accountType: e['accountType'],
                message: e['message']))
            .toList();
        if (mounted) {
          setState(() {
            models = delete;
          });
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error: $e"),
      ));
    }
  }

  @override
  void initState() {
    getItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff8B0000),
        title: Text(
          "Arxiv",
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
                image: AssetImage('image/back_screen.png'),
                fit: BoxFit.fitHeight)),
        child: models.isEmpty
            ? const Center(child: Text("Uzur brat Serverda xatolik bor shekil"))
            : ListView.builder(
                itemCount: models.length,
                itemBuilder: (context, index) => itemsDesign(models[index]),
              ),
      ),
    );
  }

  Widget itemsDesign(Dialogs models) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: models.accountType == "CLIENT"
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
                    visible: models.accountType == "CLIENT" ? true : false,
                    child: Row(
                      children: [
                        Text(
                          DateFormat("HH:mm, MMMM")
                              .format(DateTime.parse(models.createdAt)),
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
                        color: models.accountType != "ADMIN"
                            ? const Color.fromARGB(193, 231, 90, 75)
                            : const Color.fromARGB(255, 63, 187, 63),
                        borderRadius: models.accountType == "ADMIN"
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
                                  "${models.fistName} ${models.lastName}",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontFamily: "Inter",
                                      fontSize: 12.sp),
                                ),
                              ),
                              Text(models.message),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: models.accountType == "ADMIN" ? true : false,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          DateFormat("HH:mm, MMMM")
                              .format(DateTime.parse(models.createdAt)),
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
