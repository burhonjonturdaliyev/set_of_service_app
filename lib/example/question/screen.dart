import 'dart:convert';

import 'package:flutter/material.dart';

import 'models/models.dart';
import 'package:http/http.dart' as http;

class Datalar extends StatefulWidget {
  const Datalar({super.key});

  @override
  State<Datalar> createState() => _DatalarState();
}

class _DatalarState extends State<Datalar> {
  Future<Data> fetchData() async {
    final response = await http.get(Uri.parse(
        'http://185.196.213.43:7088/api/support-chats/get-all-dialog/1'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Data.fromJson(jsonData['object']);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  void getData() async {
    try {
      final data = await fetchData();
      final dialogList = data.dialogs;
      // Process the list as per your requirements
      print(dialogList);
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: getData,
      ),
    );
  }
}
