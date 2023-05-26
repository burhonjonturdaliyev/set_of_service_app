// ignore_for_file: must_be_immutable, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Review_widget extends StatefulWidget {
  Review_widget({super.key, required this.final_value});
  double final_value = 5;

  @override
  State<Review_widget> createState() => _Review_widgetState();
}

class _Review_widgetState extends State<Review_widget> {
  //int final_value=value;
  int value = 0;
  int value1 = 1;
  int value2 = 2;
  int value3 = 3;
  int value4 = 4;
  int value5 = 5;
  bool trues1 = false;
  bool trues2 = false;
  bool trues3 = false;
  bool trues4 = false;
  bool trues5 = false;
  bool submit = true;
  void ratecheck() {
    if (value1 == value) {
      trues1 = true;
      trues2 = false;
      trues3 = false;
      trues4 = false;
      trues5 = false;
    } else if (value2 == value) {
      trues1 = true;
      trues2 = true;
      trues3 = false;
      trues4 = false;
      trues5 = false;
    } else if (value3 == value) {
      trues1 = true;
      trues2 = true;
      trues3 = true;
      trues4 = false;
      trues5 = false;
    } else if (value4 == value) {
      trues1 = true;
      trues2 = true;
      trues3 = true;
      trues4 = true;
      trues5 = false;
    } else if (value5 == value) {
      trues1 = true;
      trues2 = true;
      trues3 = true;
      trues4 = true;
      trues5 = true;
    }
  }

  @override
  void initState() {
    ratecheck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return submit
        ? Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            IconButton(
                onPressed: submit
                    ? () {
                        setState(() {
                          value = value1;
                        });
                        ratecheck();
                      }
                    : null,
                icon: Icon(
                  trues1 ? Icons.star : Icons.star_border_outlined,
                  color: trues1 ? Colors.yellow : Colors.black38,
                )),
            IconButton(
                onPressed: submit
                    ? () {
                        setState(() {
                          value = value2;
                        });
                        ratecheck();
                      }
                    : null,
                icon: Icon(
                  trues2 ? Icons.star : Icons.star_border_outlined,
                  color: trues2 ? Colors.yellow : Colors.black38,
                )),
            IconButton(
                onPressed: submit
                    ? () {
                        setState(() {
                          value = value3;
                        });
                        ratecheck();
                      }
                    : null,
                icon: Icon(
                  trues3 ? Icons.star : Icons.star_border_outlined,
                  color: trues3 ? Colors.yellow : Colors.black38,
                )),
            IconButton(
                onPressed: submit
                    ? () {
                        setState(() {
                          value = value4;
                        });
                        ratecheck();
                      }
                    : null,
                icon: Icon(
                  trues4 ? Icons.star : Icons.star_border_outlined,
                  color: trues4 ? Colors.yellow : Colors.black38,
                )),
            IconButton(
                onPressed: submit
                    ? () {
                        setState(() {
                          value = value5;
                        });
                        ratecheck();
                      }
                    : null,
                icon: Icon(
                  trues5 ? Icons.star : Icons.star_border_outlined,
                  color: trues5 ? Colors.yellow : Colors.black38,
                )),
            SizedBox(
              width: 5.w,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    submit = false;
                  });
                },
                child: const Text("Submit"))
          ])
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Feedback uchun rahmat!",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp),
              )
            ],
          );
  }
}
