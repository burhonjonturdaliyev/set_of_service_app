import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/pages/Home/airticket/page/air_ticket_list.dart';
import 'package:set_of_service_app/pages/Home/airticket/widget/counting_passangers.dart';
import 'package:set_of_service_app/pages/password/password.dart';

// ignore: camel_case_types
class Avia_bilet extends StatefulWidget {
  const Avia_bilet({Key? key}) : super(key: key);

  @override
  State<Avia_bilet> createState() => _Avia_biletState();
}

class _Avia_biletState extends State<Avia_bilet> {
  TextEditingController ketishSanasi = TextEditingController();
  TextEditingController qaytishSanasi = TextEditingController();
  String? country1;
  String? country2;
  String? city1;
  String? city2;
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
            fit: BoxFit.cover,
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
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Qayerdan:",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                        fontFamily: "Inter"),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 5.h),
                            CSCPicker(
                              currentCountry: country1,
                              currentState: city1,
                              dropdownItemStyle: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Inter",
                                  fontSize: 14.sp),
                              flagState: CountryFlag.DISABLE,
                              searchBarRadius: 21,
                              showCities: false,
                              countryDropdownLabel: "Davlatlar",
                              stateDropdownLabel: "Shaharlar",
                              onCountryChanged: (country) {
                                setState(() {
                                  country1 = country;
                                });
                              },
                              onCityChanged: (city) {},
                              onStateChanged: (state) {
                                setState(() {
                                  city1 = state;
                                });
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                              child: Row(
                                children: [
                                  Visibility(
                                    visible: country1 == null ? false : true,
                                    child: Expanded(
                                      child: Text("$country1 davlati"),
                                    ),
                                  ),
                                  Visibility(
                                    visible: city1 == null ? false : true,
                                    child: Expanded(
                                      child: Text("$city1 shahri"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                              color: Colors.black38,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Qayerga:",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                        fontFamily: "Inter"),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 5.h),
                            CSCPicker(
                              currentCountry: country2,
                              currentState: city2,
                              dropdownItemStyle: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Inter",
                                  fontSize: 14.sp),
                              flagState: CountryFlag.DISABLE,
                              searchBarRadius: 21,
                              showCities: false,
                              countryDropdownLabel: "Davlatlar",
                              stateDropdownLabel: "Shaharlar",
                              onCountryChanged: (country) {
                                setState(() {
                                  country2 = country;
                                });
                              },
                              onCityChanged: (city) {},
                              onStateChanged: (state) {
                                setState(() {
                                  city2 = state;
                                });
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                              child: Row(
                                children: [
                                  Visibility(
                                    visible: country2 == null ? false : true,
                                    child: Expanded(
                                      child: Text("$country2 davlati"),
                                    ),
                                  ),
                                  Visibility(
                                    visible: city2 == null ? false : true,
                                    child: Expanded(
                                      child: Text("$city2 shahri"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 355.w,
                    height: 230.h,
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
                                    if (ketishSanasi.text.length != 10) {
                                      return "To'liq sanani kiriting";
                                    }
                                  },
                                  onTap: () async {
                                    DateTime? choose = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now());
                                    if (choose != null) {
                                      setState(() {
                                        ketishSanasi.text =
                                            DateFormat("yyyy-MM-dd")
                                                .format(choose);
                                      });
                                    }
                                  },
                                  controller: ketishSanasi,
                                  keyboardType: TextInputType.none,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10)
                                  ],
                                  decoration: InputDecoration(
                                      label: Text(
                                        "Ketish sanasi:",
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            fontSize: 15.sp),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(21.w),
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
                                    if (qaytishSanasi.text.length != 10) {
                                      return "To'liq sanani kiriting";
                                    }
                                  },
                                  onTap: () async {
                                    DateTime? choose = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now());
                                    if (choose != null) {
                                      setState(() {
                                        qaytishSanasi.text =
                                            DateFormat("yyyy-MM-dd")
                                                .format(choose);
                                      });
                                    }
                                  },
                                  controller: qaytishSanasi,
                                  keyboardType: TextInputType.none,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10)
                                  ],
                                  decoration: InputDecoration(
                                      label: Text(
                                        "Qaytish sanasi:",
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            fontSize: 15.sp),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(21.w),
                                      )),
                                )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
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
                    onLongPress: () => Navigator.push(
                        context,
                        PageTransition(
                            child: Air_ticket_list(),
                            type: PageTransitionType.fade,
                            curve: Curves.decelerate,
                            childCurrent: Avia_bilet())),
                    onPressed: () {
                      if (country1 == null) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: const Color(0xFF8B0000),
                              content: SizedBox(
                                  height: 85.h,
                                  width: 60.h,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Qayerdan Ketishingizni kiriting",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Inter",
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 243, 236, 235)),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("OK",
                                              style: TextStyle(
                                                  fontFamily: "Inter",
                                                  color:
                                                      const Color(0xFF8B0000),
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold)))
                                    ],
                                  )),
                            );
                          },
                        );
                      } else if (country2 == null) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: const Color(0xFF8B0000),
                              content: SizedBox(
                                  height: 85.h,
                                  width: 60.h,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Qayerga Qaytishingizni kiriting",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Inter",
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 243, 236, 235)),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("OK",
                                              style: TextStyle(
                                                  fontFamily: "Inter",
                                                  color:
                                                      const Color(0xFF8B0000),
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold)))
                                    ],
                                  )),
                            );
                          },
                        );
                      }
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
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: const Color(0xFF8B0000),
      //   child: Icon(
      //     Icons.restart_alt_rounded,
      //     color: Colors.white,
      //     size: 35.w,
      //   ),
      //   onPressed: () {
      //     setState(() {
      //       var temp = country1;
      //       country1 = country2;
      //       country2 = temp;
      //       var temp1 = city1;
      //       city1 = city2;
      //       city2 = temp1;
      //     });
      //   },
      // ),
    );
  }
}
