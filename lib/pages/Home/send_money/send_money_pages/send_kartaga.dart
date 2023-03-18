import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Home/send_money/confirm/confirm_tranzactions.dart';

class Kartaga extends StatefulWidget {
  Kartaga({super.key});

  @override
  State<Kartaga> createState() => _KartagaState();
}

class _KartagaState extends State<Kartaga> {
  bool visible = true;
  double money = 0.00;
  TextEditingController card_number = TextEditingController();
  TextEditingController transfer_amount = TextEditingController();
  TextEditingController comments = TextEditingController();
  final _formfield = GlobalKey<FormState>();

  @override
  void visib_check() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 11.0.h, left: 11.w),
              child: Row(
                children: [
                  Text(
                    "Karta pul yuborish",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              color: Color(0xff8B0000),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 84.h,
                  width: 354.w,
                  decoration: BoxDecoration(
                      color: const Color(0xff8A0000),
                      borderRadius: BorderRadius.circular(40)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.0.w, right: 30.w),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: visib_check,
                              icon: Icon(
                                visible == true
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
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
                              visible ? "$money yena" : "**** yena",
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
                          width: 85.w,
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
                )
              ],
            ),
            SizedBox(
              height: 11.h,
            ),
            Form(
                key: _formfield,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 33.w,
                        ),
                        Text(
                          "Qabul qiluvchi:",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Inter",
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      height: 84.h,
                      width: 354.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21.w),
                          color: Colors.transparent,
                          border:
                              Border.all(width: 1.5.w, color: Colors.black38)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Karta raqamni kiriting";
                              }
                              if (card_number.text.length != 16) {
                                return "Kartaning barcha raqamlarini kiriting";
                              }
                            },
                            controller: card_number,
                            style: TextStyle(
                                fontFamily: "Inter",
                                color: Colors.black,
                                fontSize: 18.sp),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(16)
                            ],
                            maxLines: 1,
                            // maxLength: 16,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Qabul qiluvchi karta raqami",
                                hintStyle: const TextStyle(
                                    color: Colors.black38,
                                    fontSize: 12,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w500),
                                prefixIcon: Icon(
                                  Icons.credit_card_outlined,
                                  color: Colors.black,
                                  size: 41.w,
                                )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 33.w,
                        ),
                        Text(
                          "Transfer summasi:",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Inter",
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      height: 84.h,
                      width: 354.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21.w),
                          color: Colors.transparent,
                          border:
                              Border.all(width: 1.5.w, color: Colors.black38)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Transfer summasini kiriting!";
                              }
                              if (int.parse(transfer_amount.text) < 2000) {
                                return "Eng kamida 2000 yena kiriting!";
                              }
                            },
                            controller: transfer_amount,
                            style: TextStyle(
                                fontFamily: "Inter",
                                color: Colors.black,
                                fontSize: 18.sp),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Transfer summasi minimal 2000 yena",
                              hintStyle: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 12,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 7.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 33.w,
                ),
                Text(
                  "Comment",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w300),
                )
              ],
            ),
            Container(
              height: 135.h,
              width: 354.w,
              decoration: BoxDecoration(
                  border: Border.all(width: 2.w, color: Colors.black38),
                  borderRadius: BorderRadius.circular(21.w)),
              child: Padding(
                padding: EdgeInsets.only(left: 10.0.w, right: 10.w),
                child: TextFormField(
                  controller: comments,
                  maxLines: 5,
                  style: TextStyle(
                      fontFamily: "Inter",
                      color: Colors.black,
                      fontSize: 18.sp),
                  inputFormatters: [LengthLimitingTextInputFormatter(2000)],
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 26.h,
            ),
            GestureDetector(
              onTap: () {
                if (_formfield.currentState!.validate()) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: Colors.white,
                      content: Confirm_tranzactions(
                          name: "Burhonjon Turdialiev",
                          number: card_number.text,
                          yuborish_summa: transfer_amount.text,
                          qabul_qilish_summa:
                              "${(int.parse(transfer_amount.text)) * 70} sum",
                          kurs: "70 sum",
                          komissiya: "100 yena"),
                    ),
                  );
                }
              },
              child: Container(
                width: 300.w,
                height: 64.h,
                decoration: BoxDecoration(
                    color: const Color(0xff8A0000),
                    borderRadius: BorderRadius.circular(21.w),
                    border: Border.all(width: 1.w, color: Colors.black87)),
                child: Center(
                  child: Text(
                    "Keyingisi",
                    style: TextStyle(
                        fontFamily: "Inter",
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // children: [
                  //   IconButton(
                  //       onPressed: visib_check,
                  //       icon: Icon(
                  //         visible == true
                  //             ? Icons.visibility_outlined
                  //             : Icons.visibility_off_outlined,
                  //         color: Colors.white,
                  //         size: 35.w,
                  //       )),
                  //   SizedBox(
                  //     width: 12.w,
                  //   ),
                  //   Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         "SOS hisobingiz",
                  //         style: TextStyle(
                  //           fontFamily: "Inter",
                  //           color: Colors.white,
                  //           fontSize: 16.sp,
                  //           fontWeight: FontWeight.w700,
                  //         ),
                  //       ),
                  //       Text(
                  //         visible ? "$money yena" : "**** yena",
                  //         style: TextStyle(
                  //           fontFamily: "Inter",
                  //           color: Colors.white,
                  //           fontSize: 16.sp,
                  //           fontWeight: FontWeight.w700,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  //   Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       IconButton(
                  //           onPressed: () {},
                  //           icon: Icon(
                  //             Icons.add_circle_outline_outlined,
                  //             size: 45.w,
                  //           )),
                  //     ],
                  //   )
                  // ]