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
    List<support_get> models = [
      support_get(
          id: 1,
          createdAt: DateTime(0, 0, 0, 0, 0),
          updatedAt: null,
          deleted: null,
          userId: 1,
          status: "status",
          dialogs: Dialogs(
              accountType: null,
              createdAt: null,
              fistName: null,
              lastName: null,
              message: "wdwfewerf",
              userId: "dw"))
    ];
    Future<void> fetchMessage() async {
      const uri = "http://185.196.213.43:7088/support-chats/get-all-dialog/1";
      final url = Uri.parse(uri);

      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          final body = response.body;
          final json = jsonDecode(body);
          print(json);

          if (json is List<dynamic>) {
            // The response is a list of JSON objects
            final result = json;
            if (result.isNotEmpty) {
              final MessageList = result.map((e) {
                final dialogs = e["dialogs"] != null
                    ? Dialogs(
                        createdAt: e["dialogs"]["createdAt"] != null
                            ? DateTime.parse(e["dialogs"]["createdAt"])
                            : null,
                        userId: e["dialogs"]["userId"],
                        fistName: e["dialogs"]["fistName"],
                        lastName: e["dialogs"]["lastName"],
                        accountType: e["dialogs"]["accountType"],
                        message: e["dialogs"]["message"])
                    : null;
                return support_get(
                    id: e["id"],
                    createdAt: e["createdAt"] != null
                        ? DateTime.parse(e["createdAt"])
                        : null,
                    updatedAt: e["updatedAt"],
                    deleted: e["deleted"],
                    userId: e["userId"],
                    status: e["status"],
                    dialogs: dialogs);
              }).toList();
              setState(() {
                models = MessageList;
              });
            }
          } else if (json is Map<String, dynamic>) {
            // The response is a single JSON object
            final result = [json];
            final MessageList = result.map((e) {
              final dialogs = e["dialogs"] != null
                  ? Dialogs(
                      createdAt: e["dialogs"]["createdAt"] != null
                          ? DateTime.parse(e["dialogs"]["createdAt"])
                          : null,
                      userId: e["dialogs"]["userId"],
                      fistName: e["dialogs"]["fistName"],
                      lastName: e["dialogs"]["lastName"],
                      accountType: e["dialogs"]["accountType"],
                      message: e["dialogs"]["message"])
                  : null;
              return support_get(
                  id: e["id"],
                  createdAt: e["createdAt"] != null
                      ? DateTime.parse(e["createdAt"])
                      : null,
                  updatedAt: e["updatedAt"],
                  deleted: e["deleted"],
                  userId: e["userId"],
                  status: e["status"],
                  dialogs: dialogs);
            }).toList();
            setState(() {
              models = MessageList;
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

Widget items(support_get models) {
  return Padding(
      padding: const EdgeInsets.all(8.0), child: Text(models.id.toString()));
}
