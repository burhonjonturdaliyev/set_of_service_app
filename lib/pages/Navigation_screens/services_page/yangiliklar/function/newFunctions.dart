// ignore_for_file: file_names, avoid_print

import 'package:http/http.dart';
import 'package:set_of_service_app/const_api/api.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/models/newsCommentModels.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/models/newsModels.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class newFunctions {
  Future<List<infoNew>?> getInfoNew(BuildContext context, String turi) async {
    final url = "${Api().new_catagory}$turi}";
    final uri = Uri.parse(url);
    try {
      Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);

        final result = json['object'] as List<dynamic>;
        final infoNews = result.map((e) {
          return infoNew(
              id: e["id"],
              createdAt: e["createdAt"],
              title: e["title"],
              description: e["description"],
              countryInfoType: e["countryInfoType"],
              photo: e["photo"]);
        }).toList();

        return infoNews;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<List<newCommentModels>?> getComments(
      BuildContext context, String link) async {
    final url = link;
    final uri = Uri.parse(url);
    try {
      Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);

        final result = json['object'] as List<dynamic>;
        final komments = result.map((e) {
          return newCommentModels(
              id: e["id"],
              createdAt: e["createdAt"],
              message: e["message"],
              name: e["userName"]);
        }).toList();

        return komments;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
