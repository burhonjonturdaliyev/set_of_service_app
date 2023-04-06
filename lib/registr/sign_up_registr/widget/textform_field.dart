import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Text_editions extends StatelessWidget {
  TextEditingController controller;
  String label;
  final _formkey = GlobalKey<FormState>();

  Text_editions({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      
      child: Expanded(
          child: TextFormField(
        style: TextStyle(fontFamily: "Inter", fontSize: 16.sp),
        validator: (value) {
          if (value!.isEmpty) {
            "Iltimos kerakli malumotni kiriting!";
          }
          return null;
        },
        controller: controller,
        inputFormatters: [LengthLimitingTextInputFormatter(16)],
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(33.w)),
          label: Text(label),
        ),
      )),
    );
  }
}
