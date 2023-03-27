import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          onRefresh: get_info, child: Ticket_builder(ticket: ticket)),
    );
  }

  Future<void> get_info() async {
    setState(() {
      ticket.add(Ticket_list(
          turi: "Air ticket",
          nomi: "Uzbek tickets",
          manzil: " Tokyo , Edogawa ku , Kasai rinkoen 1-66",
          number: "0611"));
    });
  }
}
