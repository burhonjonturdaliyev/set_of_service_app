// ignore_for_file: avoid_print, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:set_of_service_app/pages/Home/airticket/page/models/AirticketModels.dart';
import 'package:http/http.dart' as http;
import '../../../../../const_api/api.dart';

class AirticketFunctions {
  Future<List<AirticketModels>?> getItems(BuildContext context) async {
    final uri = Api().airTicket;
    final url = Uri.parse(uri);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        final result = json["object"] as List<dynamic>;
        final postes = result
            .map((e) => AirticketModels(
                id: e['id'],
                title: e['title'],
                subTitle: e['subTitle'],
                juridical: e['juridical'],
                serviceFee: e['serviceFee'],
                phoneNumber: e['phoneNumber'],
                telegramUrl: e['telegramUrl'],
                officeAddress: e['officeAddress'],
                active: e['active'],
                serviceCategoryId: e['serviceCategoryId'],
                businessProfileId: e['businessProfileId'],
                totalStarts: e['totalStarts'],
                totalViews: e['totalViews'],
                createdAt: e['createdAt'],
                updatedAt: e['updatedAt']))
            .toList();
        return postes;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
