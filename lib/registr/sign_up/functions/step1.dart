// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:set_of_service_app/const_api/api.dart';
import 'package:set_of_service_app/registr/sign_up/model/step_model.dart';

class AuthNumber {
  Future<void> step1(
    Step1_model model,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(Api().step1),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(model.toJson()),
      );
    } catch (e) {
      // Handle any exceptions that occurred during the request
    }
  }
}
