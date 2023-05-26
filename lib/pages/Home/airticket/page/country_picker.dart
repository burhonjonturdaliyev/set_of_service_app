// ignore_for_file: must_be_immutable, camel_case_types

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Country_picker extends StatefulWidget {
  Country_picker({super.key, required this.country1, required this.country2});
  TextEditingController country1;
  TextEditingController country2;

  @override
  State<Country_picker> createState() => _Country_pickerState();
}

class _Country_pickerState extends State<Country_picker> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                readOnly: true,
                controller: widget.country1,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Iltimos Qayerdan ketayotganingizni kiriting";
                  }
                  return null;
                },
                onTap: () {
                  showCountryPicker(
                      context: context,
                      showPhoneCode: false,
                      onSelect: (Country country) {
                        setState(() {
                          widget.country1.text = country.name;
                        });
                      },
                      countryListTheme: CountryListThemeData(
                          bottomSheetHeight:
                              MediaQuery.of(context).size.height * .75,
                          borderRadius: BorderRadius.circular(21.w)));
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.airplanemode_on_rounded,
                      size: 30.w,
                    ),
                    label: Text(
                      "Qayerdan",
                      style: TextStyle(fontFamily: "Inter", fontSize: 15.sp),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21))),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        height: 10.w,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                readOnly: true,
                controller: widget.country2,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Iltimos Qayerga ketayotganingizni kiriting";
                  }
                  return null;
                },
                onTap: () {
                  showCountryPicker(
                      context: context,
                      showPhoneCode: false,
                      onSelect: (Country country) {
                        setState(() {
                          widget.country2.text = country.name;
                        });
                      },
                      countryListTheme: CountryListThemeData(
                          bottomSheetHeight:
                              MediaQuery.of(context).size.height * .75,
                          borderRadius: BorderRadius.circular(21.w)));
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.airplanemode_on_rounded,
                      size: 30.w,
                    ),
                    label: Text(
                      "Qayerga",
                      style: TextStyle(fontFamily: "Inter", fontSize: 15.sp),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21))),
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
