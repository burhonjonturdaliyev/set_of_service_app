import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/pages/Home/airticket/page/air_ticket_list.dart';
import 'package:set_of_service_app/pages/Home/airticket/page/country_picker.dart';
import 'package:set_of_service_app/pages/Home/airticket/widget/arriving.dart';
import 'package:set_of_service_app/pages/Home/airticket/widget/counting_passangers.dart';

// ignore: camel_case_types
class Avia_bilet extends StatefulWidget {
  const Avia_bilet({Key? key}) : super(key: key);

  @override
  State<Avia_bilet> createState() => _Avia_biletState();
}

class _Avia_biletState extends State<Avia_bilet> {
  TextEditingController ketishSanasi = TextEditingController();
  TextEditingController qaytishSanasi = TextEditingController();
  TextEditingController country1 = TextEditingController();
  TextEditingController country2 = TextEditingController();

  final _formfield = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFDDADA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000),
        centerTitle: true,
        title: Text(
          "Air ticket",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Inter",
            fontSize: 20.sp,
            letterSpacing: 5.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: 375.w,
        height: 812.h,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("image/back_screen.png"),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formfield,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 355.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.w),
                        color: const Color.fromARGB(255, 243, 236, 235),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Country_picker(
                          country1: country1,
                          country2: country2,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 355.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21.w),
                      color: const Color.fromARGB(255, 243, 236, 235),
                    ),
                    child: Arriving(
                        ketishSanasi: ketishSanasi,
                        qaytishSanasi: qaytishSanasi),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 355.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21.w),
                      color: const Color.fromARGB(255, 243, 236, 235),
                    ),
                    child: Center(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                      child: Counting(),
                    )),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(355.w, 66.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21.w)),
                        backgroundColor: const Color(0xFF8B0000)),
                    onPressed: () {
                      if (_formfield.currentState!.validate()) {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: Air_ticket_list(),
                                type: PageTransitionType.fade,
                                curve: Curves.decelerate,
                                childCurrent: Avia_bilet()));
                      }
                    },
                    child: Text(
                      "Keyingisi",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF8B0000),
        child: Icon(
          Icons.restart_alt_rounded,
          color: Colors.white,
          size: 35.w,
        ),
        onPressed: () {
          setState(() {
            var temp = country1;
            country1 = country2;
            country2 = temp;
          });
        },
      ),
    );
  }
}
