// ignore_for_file: camel_case_types

import 'dart:async';
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
  bool animator = false;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  // ignore: non_constant_identifier_names
  infor_message() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFF8B0000),
        duration: const Duration(seconds: 5),
        content: Text(
          "O'zbekiston Respublikasi Markaziy bankining ${DateFormat('MM.dd.yyyy ').format(currency[0].date)} hisobotiga ko'ra!",
          textAlign: TextAlign.center,
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
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
        currency =
            currency.where((model) => model.nbu_buy_price != "").toList();
        currency.sort((a, b) =>
            double.parse(a.cb_price).compareTo(double.parse(b.cb_price)));
      });
      infor_message();
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  fit: BoxFit.fill)),
          child: currency.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1.5.h, bottom: 1.5.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                                height: 25.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.w),
                                    color: const Color(0xFF8B0000)),
                                child: Center(
                                    child: Text(
                                  "Olish",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Inter",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ))),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                            child: Container(
                                height: 25.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.w),
                                    color: const Color(0xFF8B0000)),
                                child: Center(
                                  child: Text(
                                    "Valyuta",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Inter",
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                            child: Container(
                              height: 25.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.w),
                                  color: const Color(0xFF8B0000)),
                              child: Center(
                                child: Text(
                                  "Sotish",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Inter",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
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
              top: 15.h,
              left: 10.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("${currency.nbu_buy_price} so'm"),
                ],
              ),
            ),
            Positioned(
              top: 3.h,
              left: 0.w,
              right: 0.w,
              child: Column(
                children: [
                  code == "EU"
                      ? Image(
                          image: const AssetImage("image/flag/euro.png"),
                          width: 25.w,
                          height: 25.h,
                        )
                      : CountryFlags.flag(
                          code,
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
              top: 15.h,
              left: 260.w,
              child: Row(
                children: [
                  Text("${currency.nbu_cell_price} so'm"),
                ],
              ),
            ),
          ],
        )),
  );
}
