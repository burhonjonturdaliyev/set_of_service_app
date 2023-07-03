// ignore_for_file: non_constant_identifier_names, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Paynet extends StatefulWidget {
  const Paynet({super.key});

  @override
  State<Paynet> createState() => _PaynetState();
}

class _PaynetState extends State<Paynet> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController number_controller = TextEditingController();
  TextEditingController money_controller = TextEditingController();
  TextEditingController comment_controller = TextEditingController();
  bool visible = true;
  double money = 0.00;
  void visib_check() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color(0xFF8B0000),
            title: Text(
              "Paynet",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  letterSpacing: 5.w),
            )),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("image/back_screen.png"),
                    fit: BoxFit.fitHeight)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Xizmat hali yo'lga qo'yilmagan!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                        fontSize: 25.sp),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    "404",
                    style: TextStyle(
                      color: const Color(0xff8B0000),
                      fontWeight: FontWeight.w700,
                      fontFamily: "Inter",
                      fontSize: 120.sp,
                    ),
                  )
                ])));
  }

  // Widget lastchanging(){
  //   return Container(
  //       width: double.infinity,
  //       height: double.infinity,
  //       decoration: const BoxDecoration(
  //           image: DecorationImage(
  //               image: AssetImage("image/back_screen.png"), fit: BoxFit.cover)),
  //       child: SingleChildScrollView(
  //           child: Column(
  //         children: [
  //           SizedBox(
  //             height: 37.h,
  //           ),
  //           Padding(
  //             padding: EdgeInsets.only(left: 11.0.w),
  //             child: Row(
  //               children: [
  //                 Text(
  //                   "Uzb raqamga paynet xizmati",
  //                   style: TextStyle(
  //                       color: Colors.black,
  //                       fontWeight: FontWeight.w700,
  //                       fontSize: 18.sp,
  //                       fontFamily: "Inter"),
  //                 )
  //               ],
  //             ),
  //           ),
  //           const Divider(
  //             thickness: 1,
  //             color: Color.fromARGB(255, 129, 13, 13),
  //           ),
  //           Container(
  //             width: 354.w,
  //             height: 84.h,
  //             decoration: BoxDecoration(
  //               color: const Color(0xFF8B0000),
  //               borderRadius: BorderRadius.circular(40),
  //             ),
  //             child: Row(
  //               children: [
  //                 SizedBox(
  //                   width: 10.w,
  //                 ),
  //                 Row(
  //                   children: [
  //                     IconButton(
  //                       onPressed: visib_check,
  //                       icon: Icon(
  //                         visible == true
  //                             ? Icons.visibility_outlined
  //                             : Icons.visibility_off_outlined,
  //                         size: 35.w,
  //                         color: Colors.white,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   width: 12.w,
  //                 ),
  //                 Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       "SOS hisobingiz",
  //                       style: TextStyle(
  //                         fontFamily: "Inter",
  //                         color: Colors.white,
  //                         fontSize: 16.sp,
  //                         fontWeight: FontWeight.w700,
  //                       ),
  //                     ),
  //                     Text(
  //                       visible ? "$money yena" : "**** yena",
  //                       style: TextStyle(
  //                         fontFamily: "Inter",
  //                         color: Colors.white,
  //                         fontSize: 16.sp,
  //                         fontWeight: FontWeight.w700,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   width: 105.w,
  //                 ),
  //                 Row(
  //                   children: [
  //                     IconButton(
  //                       onPressed: () {},
  //                       icon: Icon(
  //                         Icons.add_circle_outline_rounded,
  //                         color: Colors.white,
  //                         size: 36.67.w,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //           SizedBox(
  //             height: 11.h,
  //           ),
  //           Form(
  //             key: _formkey,
  //             child: Column(
  //               children: [
  //                 Row(
  //                   children: [
  //                     SizedBox(
  //                       width: 33.w,
  //                     ),
  //                     Text(
  //                       "Qabul qiluvchi:",
  //                       style: TextStyle(
  //                           color: Colors.black,
  //                           fontFamily: "Inter",
  //                           fontWeight: FontWeight.w300,
  //                           fontSize: 8.sp),
  //                     )
  //                   ],
  //                 ),
  //                 Container(
  //                   height: 104.h,
  //                   width: 354.w,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(21.w),
  //                       border: Border.all(width: 1, color: Colors.black)),
  //                   child: Padding(
  //                     padding: EdgeInsets.all(19.0.w),
  //                     child: Center(
  //                       child: TextFormField(
  //                         controller: number_controller,
  //                         validator: (value) {
  //                           if (value!.isEmpty) {
  //                             return "Iltimos telefon nomerni kiriting";
  //                           }
  //                           if (value.length > 9) {
  //                             return "Iltimos telefon nomerni oxirigacha kiriting";
  //                           }
  //                         },
  //                         style: TextStyle(
  //                             color: Colors.black,
  //                             fontFamily: "Inter",
  //                             fontSize: 20.sp,
  //                             fontWeight: FontWeight.bold),
  //                         keyboardType: TextInputType.number,
  //                         inputFormatters: [
  //                           FilteringTextInputFormatter.digitsOnly,
  //                           FilteringTextInputFormatter.singleLineFormatter,
  //                           LengthLimitingTextInputFormatter(9)
  //                         ],
  //                         decoration: InputDecoration(
  //                             prefix: Text(
  //                               "+998 ",
  //                               style: TextStyle(
  //                                   color: Colors.black,
  //                                   fontFamily: "Inter",
  //                                   fontSize: 20.sp,
  //                                   fontWeight: FontWeight.bold),
  //                             ),
  //                             prefixIcon: Icon(
  //                               Icons.phone_iphone_outlined,
  //                               size: 36.w,
  //                               color: Colors.black,
  //                             ),
  //                             prefixIconColor: Colors.black,
  //                             hintStyle: TextStyle(
  //                                 color: Colors.black26,
  //                                 fontFamily: "Inter",
  //                                 fontSize: 20.sp,
  //                                 fontWeight: FontWeight.bold),
  //                             hintText: "Raqamni kiriting",
  //                             border: InputBorder.none),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 7.h,
  //                 ),
  //                 Row(
  //                   children: [
  //                     SizedBox(
  //                       width: 33.w,
  //                     ),
  //                     Text(
  //                       "Paynet summasi",
  //                       style: TextStyle(
  //                           color: Colors.black,
  //                           fontFamily: "Inter",
  //                           fontWeight: FontWeight.w300,
  //                           fontSize: 8.sp),
  //                     ),
  //                   ],
  //                 ),
  //                 Container(
  //                   height: 104.h,
  //                   width: 354.w,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(21.w),
  //                       border: Border.all(width: 1, color: Colors.black)),
  //                   child: Padding(
  //                     padding: EdgeInsets.all(19.0.w),
  //                     child: Center(
  //                       child: TextFormField(
  //                         controller: money_controller,
  //                         validator: (value) {
  //                           if (value!.isEmpty) {
  //                             return "Paynet uchun summa kiriting";
  //                           }
  //                           if (int.parse(value) < 1000) {
  //                             return "1000 yenadan kam summa o'tkazilmaydi";
  //                           }
  //                         },
  //                         style: TextStyle(
  //                             color: Colors.black,
  //                             fontFamily: "Inter",
  //                             fontSize: 20.sp,
  //                             fontWeight: FontWeight.bold),
  //                         keyboardType: TextInputType.number,
  //                         inputFormatters: [
  //                           FilteringTextInputFormatter.digitsOnly,
  //                           FilteringTextInputFormatter.singleLineFormatter,
  //                           LengthLimitingTextInputFormatter(9)
  //                         ],
  //                         decoration: InputDecoration(

  //                             // prefixIconColor: Colors.black,
  //                             hintStyle: TextStyle(
  //                                 color: Colors.black26,
  //                                 fontFamily: "Inter",
  //                                 fontSize: 20.sp,
  //                                 fontWeight: FontWeight.bold),
  //                             hintText: "Paynet: Minimal 1000 yena",
  //                             border: InputBorder.none),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 7.w,
  //                 ),
  //                 Row(
  //                   children: [
  //                     SizedBox(
  //                       width: 33.w,
  //                     ),
  //                     Text(
  //                       "Comment",
  //                       style: TextStyle(
  //                           color: Colors.black,
  //                           fontFamily: "Inter",
  //                           fontWeight: FontWeight.w300,
  //                           fontSize: 8.sp),
  //                     )
  //                   ],
  //                 ),
  //                 Container(
  //                   width: 354.w,
  //                   height: 122.h,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(21.w),
  //                       border: Border.all(width: 1, color: Colors.black)),
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: TextFormField(
  //                       controller: comment_controller,
  //                       maxLines: 5,
  //                       style: TextStyle(
  //                           color: Colors.black,
  //                           fontSize: 15.sp,
  //                           fontFamily: "Inter",
  //                           fontWeight: FontWeight.w400),
  //                       inputFormatters: [
  //                         LengthLimitingTextInputFormatter(2000)
  //                       ],
  //                       decoration: const InputDecoration(
  //                         border: InputBorder.none,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 26.h,
  //                 ),
  //                 GestureDetector(
  //                   onTap: () {
  //                     if (_formkey.currentState!.validate()) {
  //                       showDialog(
  //                         context: context,
  //                         builder: (context) => AlertDialog(
  //                           content: Confirm_tranzactions(
  //                               name: "Burkhonjon Turdialiev",
  //                               number: number_controller.text,
  //                               yuborish_summa: money_controller.text,
  //                               qabul_qilish_summa:
  //                                   "${int.parse(money_controller.text) * 70} sum",
  //                               kurs: "70 yena",
  //                               komissiya: "100 yena"),
  //                         ),
  //                       );
  //                     }
  //                   },
  //                   child: Container(
  //                     width: 274.w,
  //                     height: 74.h,
  //                     decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(21.w),
  //                         color: const Color(0xFF8B0000)),
  //                     child: Center(
  //                       child: Text(
  //                         "Keyingisi",
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.w900,
  //                             fontFamily: "Inter",
  //                             fontSize: 24.sp),
  //                       ),
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         ],
  //       )),
  //     );
  // }
}
