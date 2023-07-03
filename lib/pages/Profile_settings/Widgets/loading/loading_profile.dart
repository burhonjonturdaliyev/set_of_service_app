// ignore_for_file: camel_case_types, must_be_immutable, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:set_of_service_app/const_api/api.dart';
import 'package:set_of_service_app/pages/Profile_settings/model/profel_edit_model.dart';
import 'package:set_of_service_app/registr/sign_in/Sign_in_screen.dart';

class Loading_profile extends StatefulWidget {
  Loading_profile(
      {super.key,
      required this.email,
      required this.firstname,
      required this.gender,
      required this.lastname,
      required this.sana,
      required this.server,
      required this.userHashId,
      required this.userId,
      required this.visitCountry,
      required this.profel});
  String? server,
      sana,
      email,
      firstname,
      lastname,
      gender,
      userHashId,
      visitCountry;
  int? userId;
  List profel;

  @override
  State<Loading_profile> createState() => _Loading_profileState();
}

class _Loading_profileState extends State<Loading_profile> {
  upload(profel_edit editing) async {
    try {
      var response = await http.put(
        Uri.parse(Api().edit_user),
        body: editing.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Request successful
        print(response.body);
      } else if (response.statusCode == 403) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Sign_in(),
            ));
      } else {
        // Request failed
        print('Failed to update data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Request error
      print('Error updating data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(107, 0, 0, 0),
      body: Center(
          child: Container(
        height: 90.h,
        width: 90.w,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: const Center(
            child: CircularProgressIndicator(
          color: Color(0xFF8B0000),
        )),
      )),
    );
  }
}
