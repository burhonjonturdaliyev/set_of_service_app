import 'package:flutter/material.dart';

class Shop_models {
  String name;
  String number;
  String delevering;
  String address;
  DateTime time;
  int count;
  double rate;

  Shop_models(
      {required this.name,
      required this.number,
      required this.delevering,
      required this.address,
      required this.time,
      required this.count,
      required this.rate});
}
