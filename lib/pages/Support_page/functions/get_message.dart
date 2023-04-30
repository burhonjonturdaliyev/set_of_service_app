import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/support_models.get.dart';

class Support_Api {
  static Future<List<Data>?> fetchMessage(
      BuildContext context, int userId) async {
    final url =
        "http://185.196.213.43:7088/support-chats/get-all-dialog/$userId";
    final uri = Uri.parse(url);
    try {
      print("Loading is start");
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        //print(json["object"]);

        final result = json["object"][1] as List<dynamic>;

        final message = result.map(
          (e) {
            final dialogs = Dialogs(
              createdAt: e["dialogs"][0]["createdAt"] ?? "",
              userId: e["dialogs"][0]["userId"] ?? 0,
              fistName: e["dialogs"][0]["fistName"] ?? "",
              lastName: e["dialogs"][0]["lastName"] ?? "",
              accountType: e["dialogs"][0]["accountType"] ?? "",
              message: e["dialogs"][0]["message"] ?? "",
            );
            return Data(
              id: e["id"] ?? 0,
              createdAt: e["createdAt"] ?? "",
              updatedAt: e["updatedAt"] ?? "",
              deleted: e["deleted"] ?? false,
              userId: e["userId"] ?? 0,
              status: e["status"] ?? "",
              dialogs: dialogs,
            );
          },
        ).toList();
        print("Loading is finished");
        return message;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error: $e"),
      ));

      Text("Error is here => $e");
    }
  }
}
