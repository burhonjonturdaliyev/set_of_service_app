import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:set_of_service_app/const_api/api.dart';

import '../models/support_models.get.dart';

// ignore: camel_case_types
class Support_Api {
  static Future<List<Data>?> fetchMessage(
      BuildContext context, int userId) async {
    final url = "${Api().supportGet}$userId";
    final uri = Uri.parse(url);
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);

        final result = json["object"]["active"][0]["dialogs"] as List<dynamic>;

        final message = result.map(
          (e) {
            final dialogs = Dialogs(
              createdAt: e["createdAt"] ?? "",
              userId: e["userId"] ?? 0,
              fistName: e["fistName"] ?? "",
              lastName: e["lastName"] ?? "",
              accountType: e["accountType"] ?? "",
              message: e["message"] ?? "",
            );
            return Data(
              dialogs: dialogs,
            );
          },
        ).toList();

        return message;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error: $e"),
      ));

      Text("Error is here => $e");
    }
    return null;
  }

  Future fetchDelete(BuildContext context, int userId) async {
    final url = "${Api().supportGet}$userId";
    final uri = Uri.parse(url);
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);

        final result = json["object"]["delete"] as List<dynamic>;

        return result;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error: $e"),
      ));

      Text("Error is here => $e");
    }
  }
}
