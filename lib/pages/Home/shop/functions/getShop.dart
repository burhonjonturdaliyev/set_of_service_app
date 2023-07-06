// ignore_for_file: unused_import, camel_case_types, file_names, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:set_of_service_app/const_api/api.dart';
import 'package:set_of_service_app/pages/Home/shop/model/elon_model.dart';
import 'package:http/http.dart' as http;
import 'package:set_of_service_app/pages/Home/shop/model/foods_model.dart';

import '../../../../registr/sign_in/Sign_in_screen.dart';
import '../model/nofoods_model.dart';

class foodsGet {
  Future<List<foods_model>?> fetchFood(BuildContext context) async {
    try {
      final uri = Api().foods;
      final url = Uri.parse(uri);
      Response response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body;
        final json = jsonDecode(body);
        final result = json['object'] as List<dynamic>;
        final datas = result.map((e) {
          return foods_model(
              id: e['id'],
              title: e['title'],
              description: e['description'],
              delivered: e['delivered'],
              address: e['address'],
              telegramUrl: e['telegramUrl'],
              phoneNumber: e['phoneNumber'],
              mobileNumber: e['mobileNumber'],
              shopType: e['shopType'],
              objectPhotos: e['objectPhotos'],
              createdAt: e['createdAt'],
              updatedAt: e['updatedAt'],
              viewsCount: e['viewsCount'],
              starts: e['starts'],
              businessProfileId: e['businessProfileId'],
              userId: e['userId']);
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
      // ignore: avoid_print
      print(e);
    }
    return null;
  }
}

class noFoodsGet {
  Future<List<shop_no_foods_model>?> fetchNoFood(BuildContext context) async {
    try {
      final uri = Api().nofoods;
      final url = Uri.parse(uri);
      Response response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body;
        final json = jsonDecode(body);
        final result = json['object'] as List<dynamic>;
        final datas = result.map((e) {
          return shop_no_foods_model(
              id: e['id'],
              title: e['title'],
              description: e['description'],
              delivered: e['delivered'],
              address: e['address'],
              telegramUrl: e['telegramUrl'],
              phoneNumber: e['phoneNumber'],
              mobileNumber: e['mobileNumber'],
              shopType: e['shopType'],
              objectPhotos: e['objectPhotos'],
              createdAt: e['createdAt'],
              updatedAt: e['updatedAt'],
              viewsCount: e['viewsCount'],
              starts: e['starts'],
              businessProfileId: e['businessProfileId'],
              userId: e['userId']);
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
      // ignore: avoid_print
      print(e);
    }
    return null;
  }
}
