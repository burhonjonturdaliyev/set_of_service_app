// ignore_for_file: camel_case_types, use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/const_api/api.dart';
import 'package:http/http.dart' as http;
import 'package:set_of_service_app/registr/sign_in/Sign_in_screen.dart';

class getCount {
  Future<void> count(BuildContext context) async {
    final url = Api().countInfo;
    final uri = Uri.parse(url);
    try {
      Response response = await http.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body;
        final json = jsonDecode(body);
        // ignore: unused_local_variable
        final result = json['object'] as Map<String, int>;
      } else if (response.statusCode == 403) {
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(child: Sign_in(), type: PageTransitionType.fade),
            (route) => false);
      }
    } catch (e) {
      print("Nimadir xato $e");
    }
  }
}
