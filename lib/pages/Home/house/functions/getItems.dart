// ignore_for_file: camel_case_types, file_names, body_might_complete_normally_nullable, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:set_of_service_app/const_api/api.dart';
import 'package:http/http.dart' as http;
import 'package:set_of_service_app/pages/Home/house/models/models.dart';

import '../../../../registr/sign_in/Sign_in_screen.dart';

class getHouse {
  Future<List<HomeModels>?> fetchInfo(BuildContext context) async {
    final uri = Api().homeAgency;
    final url = Uri.parse(uri);
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body;
        final json = jsonDecode(body);
        final result = json["object"] as List<dynamic>;
        final datas = result.map((e) {
          return HomeModels(
              id: e["id"] as int,
              title: e["title"],
              subTitle: e["subTitle"],
              juridical: e["juridical"],
              serviceFee: e["serviceFee"],
              phoneNumber: e["phoneNumber"],
              telegramUrl: e["telegramUrl"],
              officeAddress: e["officeAddress"],
              active: e["active"],
              serviceCategoryId: e["serviceCategoryId"] as int,
              businessProfileId: e["businessProfileId"] as int,
              totalStarts: e["totalStarts"] as double,
              totalViews: e["totalViews"] as int,
              createdAt: DateTime.parse(e["createdAt"]),
              updatedAt: DateTime.parse(e["updatedAt"]));
        }).toList();
        return datas;
      } else if (response.statusCode == 403) {
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Sign_in(),
            ),
            (route) => false);
      }
    } catch (e) {
      print(e);
    }
  }
}
