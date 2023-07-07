// ignore_for_file: use_build_context_synchronously, camel_case_types, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:set_of_service_app/const_api/api.dart';
import 'package:http/http.dart' as http;
import 'package:set_of_service_app/pages/Navigation_screens/services_page/other%20services/model/other_services_model.dart';
import 'package:set_of_service_app/registr/sign_in/Sign_in_screen.dart';

class getting_other {
  Future<List<other_services_model>?> fetchData(BuildContext context) async {
    final uri = Api().other_services;
    final url = Uri.parse(uri);
    final responce = await http.get(url);
    try {
      if (responce.statusCode == 200 || responce.statusCode == 201) {
        final json = jsonDecode(responce.body);
        final result = json['object'] as List<dynamic>;
        final data = result.map((e) {
          return other_services_model(
              id: e['id'],
              title: e['title'],
              subTitle: e['subTitle'],
              juridical: e['juridical'],
              serviceFee: e['serviceFee'],
              phoneNumber: e['phoneNumber'],
              telegramUrl: e['telegramUrl'],
              officeAddress: e['officeAddress'],
              active: e['active'],
              serviceCategoryEntityId: e['serviceCategoryEntityId'],
              serviceCategoryId: e['serviceCategoryId'],
              businessProfileId: e['businessProfileId'],
              totalStarts: e['totalStarts'],
              totalViews: e['totalViews'],
              createdAt: e['createdAt'],
              updatedAt: e['updatedAt']);
        }).toList();
        return data;
      } else if (responce.statusCode == 403) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Sign_in(),
            ),
            (route) => false);
      } else {
        print(responce.statusCode);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
