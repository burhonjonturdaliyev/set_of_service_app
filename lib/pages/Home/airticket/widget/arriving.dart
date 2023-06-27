// ignore_for_file: must_be_immutable, unnecessary_null_comparison, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class Arriving extends StatefulWidget {
  Arriving({
    Key? key,
    required this.ketishSanasi,
    required this.qaytishSanasi,
  }) : super(key: key);

  TextEditingController ketishSanasi;
  TextEditingController qaytishSanasi;

  @override
  _ArrivingState createState() => _ArrivingState();
}

class _ArrivingState extends State<Arriving> {
  TextEditingController birinchisi = TextEditingController();
  TextEditingController ikkinchisi = TextEditingController();

  kalendar(
    BuildContext context,
    TextEditingController name,
  ) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime.now(),
      maxTime: DateTime(2024),
      theme: DatePickerTheme(
        backgroundColor: const Color(0xff800000), // Set the background color
        headerColor: const Color(0xff800000), // Set the header text color
        itemStyle: TextStyle(
          color: Colors.white, // Set the date text color
          fontWeight: FontWeight.bold,
          fontSize: 18.0.sp,
        ),
        cancelStyle: TextStyle(
          color: Colors.white, // Set the done button text color
          fontSize: 16.0.sp,
          fontWeight: FontWeight.bold,
        ),
        doneStyle: TextStyle(
          color: Colors.white, // Set the done button text color
          fontSize: 16.0.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      onChanged: (date) {
        setState(() {
          name.text = DateFormat("yyyy-MM-dd HH:mm").format(date);
        });
      },
      onConfirm: (date) {
        setState(() {
          name.text = DateFormat("yyyy-MM-dd HH:mm").format(date);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 355.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21.w),
            color: const Color.fromARGB(255, 243, 236, 235),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          readOnly: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Iltimos Ketish sanasini kiriting";
                            }
                            return null;
                          },
                          onTap: () {
                            kalendar(
                              context,
                              widget.ketishSanasi,
                            );
                          },
                          controller: widget.ketishSanasi,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.date_range_outlined,
                              size: 30.w,
                            ),
                            labelText: "Ketish sanasi:",
                            labelStyle: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 15.sp,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21.w),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          readOnly: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Iltimos qaytish sanasini kiriting";
                            }
                            return null;
                          },
                          onTap: () {
                            kalendar(
                              context,
                              widget.qaytishSanasi,
                            );
                          },
                          controller: widget.qaytishSanasi,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.date_range_outlined,
                              size: 30.w,
                            ),
                            labelText: "Qaytish sanasi:",
                            labelStyle: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 15.sp,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21.w),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
