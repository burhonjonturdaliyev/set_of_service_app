// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';

class CatagoryModels {
  String name;
  Icon icon;
  String type;
  CatagoryModels({required this.name, required this.icon, required this.type});
}

class infoNew {
  int id;
  String createdAt;
  String title;
  String description;
  String countryInfoType;
  int photo;

  infoNew(
      {required this.id,
      required this.createdAt,
      required this.title,
      required this.description,
      required this.countryInfoType,
      required this.photo});
}