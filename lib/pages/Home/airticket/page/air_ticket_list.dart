import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Home/airticket/page/models/Api_models.dart';
import 'package:set_of_service_app/pages/Home/airticket/page/models/air_ticket_model.dart';
import 'package:set_of_service_app/pages/Home/airticket/page/widget/ticket_builder.dart';

class Air_ticket_list extends StatefulWidget {
  Air_ticket_list({super.key});

  @override
  State<Air_ticket_list> createState() => _Air_ticket_listState();
}

class _Air_ticket_listState extends State<Air_ticket_list> {
  List<Ticket_list> ticket = [
    Ticket_list(
        turi: "Air ticket",
        nomi: "Uzbek tickets",
        manzil: " Tokyo , Edogawa ku , Kasai rinkoen 1-66",
        number: "0611"),
    Ticket_list(
        turi: "Air ticket",
        nomi: "Uzbek tickets",
        manzil: " Tokyo , Edogawa ku , Kasai rinkoen 1-66",
        number: "0611"),
    Ticket_list(
        turi: "Air ticket",
        nomi: "Uzbek tickets",
        manzil: " Tokyo , Edogawa ku , Kasai rinkoen 1-66",
        number: "0611"),
  ];
  List<Api_models> models = [];
  Future<void> fetchInfo() async {
    try {
      print("Loading started");
      const uri = "http://185.196.213.43:7088/api/air/ticket/info";
      final url = Uri.parse(uri);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        final result = json["object"] as List<dynamic>;
        final postes = result
            .map(
              (e) => Api_models(
                  id: e["id"] as int,
                  createdBy: e["createdBy"],
                  createdAt: DateTime.parse(e["createdAt"]),
                  updatedAt: DateTime.parse(e["updatedAt"]),
                  fromTo: e["fromTo"],
                  whereTo: e["whereTo"],
                  toGoDate: DateTime.parse(e["toGoDate"]),
                  returnDate: DateTime.parse(e["returnDate"]),
                  airClass: e["airClass"],
                  passenger: e["passenger"] as int,
                  userId: e["userId"] as int),
            )
            .toList();
        setState(() {
          models = postes;
        });
        print(body);
      } else {
        print("Error");
      }
    } catch (e) {
      print("Error occurred => $e");
    }
  }

  @override
  void initState() {
    fetchInfo();
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
            "Bilet sotadiganlar ro’yxati",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,
                fontSize: 20.sp),
          )),
      body: RefreshIndicator(
          onRefresh: fetchInfo,
          child: Ticket_builder(
            ticket: ticket,
            models: models,
          )),
    );
  }
}
