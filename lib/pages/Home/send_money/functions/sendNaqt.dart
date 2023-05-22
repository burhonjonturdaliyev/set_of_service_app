// ignore_for_file: camel_case_types, body_might_complete_normally_nullable, file_names, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:set_of_service_app/pages/Home/send_money/models/modelsNaqt.dart';

import '../../../../const_api/api.dart';

class sendNaqt {
  Future<List<NaqtModels>?> fetchInfo(BuildContext context) async {
    final uri = Api().sendMoneyCash;
    final url = Uri.parse(uri);
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        final result = json["object"] as List<dynamic>;
        final datas = result.map((e) {
          return NaqtModels(
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
      }
    } catch (e) {
      print(e);
    }
  }
}
