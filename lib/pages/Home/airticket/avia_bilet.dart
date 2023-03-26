import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: camel_case_types
class Avia_bilet extends StatefulWidget {
  const Avia_bilet({Key? key}) : super(key: key);

  @override
  State<Avia_bilet> createState() => _Avia_biletState();
}

class _Avia_biletState extends State<Avia_bilet> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  String? country1;
  String? country2;
  String? city1;
  String? city2;

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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 355.w,
                  height: 250.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21.w),
                    color: const Color(0xffFBE5E2),
                  ),
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
                      Visibility(
                        visible: city1 == null ? false : true,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                  "Siz tanlagan joy: $country1 davlati, $city1 shahar"),
                            )
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
                            Expanded(
                              child: TextFormField(
                                controller: _controller2,
                                initialValue: _controller2.text.isEmpty
                                    ? null
                                    : _controller2.text,
                                readOnly: true,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    fontFamily: "Inter"),
                                onTap: openChoice,
                                keyboardType: TextInputType.none,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(21.w)),
                                  label: const Text("Qayerga"),
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      fontFamily: "Inter"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
            var temp1 = city1;
            city1 = city2;
            city2 = temp1;
          });
        },
      ),
    );
  }

  Future openChoice() => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            width: 320,
            height: 100,
            child: Column(
              children: [
                CSCPicker(
                  dropdownItemStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 14.sp),
                  flagState: CountryFlag.DISABLE,
                  searchBarRadius: 21,
                  showCities: false,
                  countryDropdownLabel: "Davlatlar",
                  stateDropdownLabel: "Shaharlar",
                  currentState: city2,
                  currentCountry: country2,
                  onCountryChanged: (value) {
                    setState(() {
                      country2 = value;
                    });
                  },
                  onCityChanged: (value) {},
                  onStateChanged: (value) {
                    setState(() {
                      city2 = value;
                    });
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      _controller2.clear();
                      _controller2.text = (country2! + (city2 ?? ""));
                      Navigator.pop(context);
                    },
                    child: Text("Saqlash"))
              ],
            ),
          ),
        );
      });
}
