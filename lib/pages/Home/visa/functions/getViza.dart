// ignore_for_file: camel_case_types, file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:set_of_service_app/pages/Home/visa/models/modelsViza.dart';

import '../../../../const_api/api.dart';

class gettingVizaItems {
  Future<List<vizaModels>?> fetchInfo(BuildContext context) async {
    final uri = Api().vizaSupport;
    final url = Uri.parse(uri);
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        final result = json["object"] as List<dynamic>;
        final datas = result.map((e) {
          return vizaModels(
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
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error: $e"),
      ));

      Text("Error is here => $e");
    }
    return null;
  }
}
