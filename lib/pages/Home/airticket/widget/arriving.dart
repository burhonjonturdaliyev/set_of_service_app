import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class Arriving extends StatefulWidget {
  Arriving(
      {super.key, required this.ketishSanasi, required this.qaytishSanasi});
  TextEditingController ketishSanasi;
  TextEditingController qaytishSanasi;

  @override
  State<Arriving> createState() => _ArrivingState();
}

class _ArrivingState extends State<Arriving> {
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Iltimos Ketish sanasini kiriting";
                          }
                          if (widget.ketishSanasi.text.length != 10) {
                            return "To'liq sanani kiriting";
                          }
                        },
                        onTap: () async {
                          DateTime? choose = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2030));
                          if (choose != null) {
                            setState(() {
                              widget.ketishSanasi.text =
                                  DateFormat("yyyy-MM-dd").format(choose);
                            });
                          }
                        },
                        controller: widget.ketishSanasi,
                        keyboardType: TextInputType.none,
                        inputFormatters: [LengthLimitingTextInputFormatter(10)],
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.date_range_outlined,
                              size: 30.w,
                            ),
                            label: Text(
                              "Ketish sanasi:",
                              style: TextStyle(
                                  fontFamily: "Inter", fontSize: 15.sp),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21.w),
                            )),
                      )),
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Iltimos qaytish sanasini kiriting";
                          }
                          if (widget.qaytishSanasi.text.length != 10) {
                            return "To'liq sanani kiriting";
                          }
                        },
                        onTap: () async {
                          DateTime? choose = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2030));
                          if (choose != null) {
                            setState(() {
                              widget.qaytishSanasi.text =
                                  DateFormat("yyyy-MM-dd").format(choose);
                            });
                          }
                        },
                        controller: widget.qaytishSanasi,
                        keyboardType: TextInputType.none,
                        inputFormatters: [LengthLimitingTextInputFormatter(10)],
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.date_range_outlined,
                              size: 30.w,
                            ),
                            label: Text(
                              "Qaytish sanasi:",
                              style: TextStyle(
                                  fontFamily: "Inter", fontSize: 15.sp),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21.w),
                            )),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
