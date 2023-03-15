import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Kartaga extends StatelessWidget {
  Kartaga({super.key});

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 11.0.h, left: 11.w, right: 11.w),
                  child: Text(
                    "Kartaga pul o'tkazish",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Divider(
              thickness: 1.w,
              color: const Color(0xFF8B0000),
            ),
            Center(
              child: Container(
                width: 354.w,
                height: 84.h,
                decoration: BoxDecoration(
                  color: const Color(0xff8A0000),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.visibility_outlined,
                            size: 35.w,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SOS hisobingiz",
                          style: TextStyle(
                            fontFamily: "Inter",
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "0.00 yena",
                          style: TextStyle(
                            fontFamily: "Inter",
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 105.w,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_circle_outline_rounded,
                            color: Colors.white,
                            size: 36.67.w,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 11.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 33.w,
                ),
                Text(
                  "Qabul qiluvchi",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 10.sp,
                  ),
                )
              ],
            ),
            Container(
              width: 354.w,
              height: 84.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21.w),
                  border: Border.all(width: 1, color: Colors.black12)),
              child: Expanded(
                  child: Center(
                child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.wallet_outlined),
                      hintText: "Qabul qiluvchi karta raqami"),
                ),
              )),
            )
          ],
        )
      ],
    );
  }
}
