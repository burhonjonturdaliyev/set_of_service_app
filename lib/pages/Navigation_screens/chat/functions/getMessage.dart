// ignore_for_file: unused_local_variable, file_names, camel_case_types, avoid_print, use_build_context_synchronously

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:set_of_service_app/const_api/api.dart';
import 'package:set_of_service_app/pages/Navigation_screens/chat/models/chat_models.dart';
import 'package:set_of_service_app/registr/sign_in/Sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class getMessage {
  Future<List<chat_models>?> fetchMessage(
      BuildContext context, SharedPreferences? logindata) async {
    try {
      final uri = Api().globalChatGet;
      final url = Uri.parse(uri);
      final response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body;

        final json = jsonDecode(body);

        final result = json["object"] as List<dynamic>;
        // final result = json["_embedded"]['chatEntities'] as List<dynamic>;
        // print(json["_embedded"]['chatEntities']);

        final chates = result
            .map(
              (e) => chat_models(
                  message: e["message"],
                  username: e["username"],
                  userId: e["userId"] as int,
                  edited: e["edited"] as bool,
                  createdAt: e["createdAt"] != null
                      ? DateTime.parse(e["createdAt"])
                      : DateTime.now()),
            )
            .toList();
        return chates;
      } else if (response.statusCode == 403) {
        logindata = await SharedPreferences.getInstance();
        logindata.clear();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Sign_in(),
            ),
            (route) => false);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
