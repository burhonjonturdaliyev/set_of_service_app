import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'question/models/models.dart';

class SupportMessageGetting extends StatefulWidget {
  const SupportMessageGetting({super.key});

  @override
  State<SupportMessageGetting> createState() => _SupportMessageGettingState();
}

class _SupportMessageGettingState extends State<SupportMessageGetting> {
  @override
  Widget build(BuildContext context) {
    List<Data> models = [];

    Future<void> fetchMessage() async {
      const uri = "http://185.196.213.43:7088/support-chats/get-all-dialog/1";
      final url = Uri.parse(uri);

      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          final body = response.body;
          final json = jsonDecode(body);
          print(json);
          final object = json["object"]["dialogs"]['delete'] as List<dynamic>;

          if (object.isNotEmpty) {
            final listes = List<Data>.from(object.map((e) => Data.fromJson(e)));
            setState(() {
              models = listes;
            });
          }
        } else {
          throw Exception("Failed to fetch data");
        }
      } catch (e) {
        print("Error: $e");
      }
    }

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: fetchMessage),
        body: models.isEmpty
            ? const Center(child: Text("Datalar yuklanmoqda"))
            : ListView.builder(
                itemCount: models.length,
                itemBuilder: (context, index) => items(models[index])),
      ),
    );
  }
}

Widget items(Data? models) {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(models!.dialogs[1].firstName));
}
