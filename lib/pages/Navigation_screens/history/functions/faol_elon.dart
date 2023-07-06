// ignore_for_file: camel_case_types, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../const_api/api.dart';
import '../../../../registr/sign_in/Sign_in_screen.dart';
import '../../../Home/shop/model/nofoods_model.dart';

class elon_no_foods {
  Future<List<shop_no_foods_model>?> fetchNoFood(
      BuildContext context, int userId) async {
    try {
      final uri = '${Api().faol_elon}$userId';
      final url = Uri.parse(uri);
      final response = await http.get(url);
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
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
