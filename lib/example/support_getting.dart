import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../pages/Support_page/models/support_models.get.dart';

class SupportMessageGetting extends StatefulWidget {
  const SupportMessageGetting({super.key});

  @override
  State<SupportMessageGetting> createState() => _SupportMessageGettingState();
}

class _SupportMessageGettingState extends State<SupportMessageGetting> {
  @override
  Widget build(BuildContext context) {
    List<Dialogs?> models = [];

    Future<void> fetchMessage() async {
      const uri = "http://185.196.213.43:7088/support-chats/get-all-dialog/1";
      final url = Uri.parse(uri);

      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          final body = response.body;
          final json = jsonDecode(body);
          print(json);
          final object = json["object"] as List<dynamic>;
          //final result = json[""]["object"]["dialogs"] as List<dynamic>;
          // Check the structure of the JSON response
          final result = object[1]["dialogs"] as List<dynamic>;
          if (result.isNotEmpty) {
            final listes = result.map((e) {
              return Dialogs(
                  createdAt: e["createdAt"],
                  userId: e["userId"],
                  fistName: e["fistName"],
                  lastName: e["lastName"],
                  accountType: e["accountType"],
                  message: e["message"]);
            }).toList();
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

Widget items(Dialogs? models) {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(models!.fistName.toString()));
}
