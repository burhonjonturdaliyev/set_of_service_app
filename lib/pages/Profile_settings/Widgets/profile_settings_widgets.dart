// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class Profile_setting_widgets extends StatefulWidget {
  TextEditingController ism;
  TextEditingController familya;
  TextEditingController nomer;
  TextEditingController sana;
  TextEditingController davlat;
  Profile_setting_widgets(
      {super.key,
      required this.ism,
      required this.familya,
      required this.nomer,
      required this.sana,
      required this.davlat});

  @override
  State<Profile_setting_widgets> createState() =>
      _Profile_setting_widgetsState();
}

// ignore: camel_case_types
class _Profile_setting_widgetsState extends State<Profile_setting_widgets> {
  // TextEditingController sana = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: widget.ism,
                decoration: InputDecoration(
                  labelText: "Ism",

                  //helperText: "",
                  hintText: "Ism",
                  hintStyle: TextStyle(
                      color: Colors.black26,
                      fontSize: 16.sp,
                      fontFamily: "Inter"),
                  //border: InputBorder.none
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: widget.familya,
                decoration: InputDecoration(
                  labelText: "Familya",

                  // helperText: "",
                  hintText: "Familya",
                  hintStyle: TextStyle(
                      color: Colors.black26,
                      fontSize: 16.sp,
                      fontFamily: "Inter"),
                  //border: InputBorder.none
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: widget.nomer,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Telefon nomer",
                  //helperText: "Telefon nomer",
                  hintText: "Telefon nomer",
                  hintStyle: TextStyle(
                      color: Colors.black26,
                      fontSize: 16.sp,
                      fontFamily: "Inter"),
                  //border: InputBorder.none
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: widget.sana,
                onTap: () async {
                  DateTime? choose = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now());
                  if (choose != null) {
                    setState(() {
                      widget.sana.text =
                          DateFormat("yyyy-MMMM-dd").format(choose);
                    });
                  }
                },
                decoration: InputDecoration(
                  labelText: "Sanani tanlang",
                  //helperText: "Tug'ilgan sana",
                  hintText: "Tug'ilgan sana",
                  hintStyle: TextStyle(
                      color: Colors.black26,
                      fontSize: 16.sp,
                      fontFamily: "Inter"),
                  //border: InputBorder.none
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: widget.davlat,
                decoration: InputDecoration(
                  //  helperText: "Qaysi davlat servislar",
                  labelText: "Qaysi davlat servislar",
                  // hintText: "Qaysi davlat servislar",
                  hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontFamily: "Inter"),

                  //border: InputBorder.none
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
