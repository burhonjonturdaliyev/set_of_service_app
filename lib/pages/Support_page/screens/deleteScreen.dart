// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Support_page/functions/get_message.dart';

class DeleteMessageSupport extends StatefulWidget {
  const DeleteMessageSupport({super.key});

  @override
  State<DeleteMessageSupport> createState() => _DeleteMessageSupportState();
}

class _DeleteMessageSupportState extends State<DeleteMessageSupport> {
  List<int> number = [];
  late int num;

  Future<void> fetchDelete() async {
    final size = Support_Api().fetchDelete(context, 1);
    if (mounted) {
      setState(() {
        // num=size.length => here  i should add if it has a item, it will add automatically numbers using for loop
        //like for(i=0, i>j{j is length of length of list dynamic}, i++){
        //here add function
        // function is
        // number.add(i);
        //}
        //

        //  additional function is we put list url link support.delete;
        // and than we create somee additional page so, what we need here. we just need a index of list which is added before in
      });
    }
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
    ));
  }
}
