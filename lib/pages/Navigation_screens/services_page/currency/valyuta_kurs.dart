// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/currency/models/currency_models.dart';

class Valyuta_kursi extends StatefulWidget {
  const Valyuta_kursi({super.key});

  @override
  State<Valyuta_kursi> createState() => _Valyuta_kursiState();
}

class _Valyuta_kursiState extends State<Valyuta_kursi> {
  List<Currency_model> currency = [];

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> fetchUser() async {
    try {
      const uri = "https://nbu.uz/uz/exchange-rates/json/";
      final url = Uri.parse(uri);
      final response = await http.get(url);
      final body = response.body;
      final json = jsonDecode(body) as List<dynamic>;
      final result = json.map((e) {
        final date = DateFormat('dd.MM.yyyy').parse(e["date"]);
        return Currency_model(
            title: e["title"],
            code: e["code"],
            cb_price: e["cb_price"],
            nbu_buy_price: e["nbu_buy_price"],
            nbu_cell_price: e["nbu_cell_price"],
            date: date);
      }).toList();
      setState(() {
        currency = result;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFDDADA),
        appBar: AppBar(
          backgroundColor: const Color(0xFF8B0000),
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Valyuta kursi",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                letterSpacing: 5.w,
                fontWeight: FontWeight.bold,
                fontFamily: "Inter"),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("image/back_screen.png"),
                  fit: BoxFit.cover)),
          child: currency.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Container(
                      height: 35.h,
                      decoration: const BoxDecoration(color: Color(0xFF8B0000)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Valyuta nomi",
                            style: TextStyle(
                              fontFamily: "Inter",
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: 65.w,
                          ),
                          SizedBox(
                            width: 65.w,
                          ),
                          Text(
                            "Kurs",
                            style: TextStyle(
                              fontFamily: "Inter",
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: RefreshIndicator(
                        color: const Color(0xFF8B0000),
                        onRefresh: fetchUser,
                        child: ListView.builder(
                          itemCount: currency.length,
                          itemBuilder: (context, index) {
                            return builder_items(currency[index]);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
        ));
  }
}

Widget builder_items(Currency_model currency) {
  final String code = currency.code.substring(0, currency.code.length - 1);
  final date_format = DateFormat('MMMM-dd, yyyy ').format(currency.date);

  return Padding(
    padding: EdgeInsets.only(left: 1.0.w, right: 1.w, top: 1.h),
    child: Container(
        width: 375.w,
        height: 50.h,
        margin: const EdgeInsets.only(left: 1, right: 1),
        decoration: BoxDecoration(
            color: const Color.fromARGB(177, 228, 201, 201),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1, color: Colors.black12)),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 10.w,
              child: Row(
                children: [
                  CountryFlags.flag(
                    code.toLowerCase(),
                    height: 25.h,
                    width: 25.w,
                    borderRadius: 0,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(currency.code),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 220.w,
              child: Row(
                children: [
                  Text("${currency.cb_price} so'm"),
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                right: 10,
                child: Text(
                  date_format,
                  style: TextStyle(
                      color: Colors.black54,
                      fontFamily: "Inter",
                      fontSize: 11.sp,
                      fontWeight: FontWeight.normal),
                ))
          ],
        )),
  );
}
