import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../pages/Navigation_screens/chat/models/chat_models.dart';
import '../pages/Support_page/models/support_models.get.dart';

class SupportMessageGetting extends StatefulWidget {
  const SupportMessageGetting({super.key});

  @override
  State<SupportMessageGetting> createState() => _SupportMessageGettingState();
}

class _SupportMessageGettingState extends State<SupportMessageGetting> {
  @override
  Widget build(BuildContext context) {
    List<support_get> models = [];
    Future<void> fetchMessage() async {
      const uri = "http://185.196.213.43:7088/support-chats/get-all-dialog/1";
      final url = Uri.parse(uri);

      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          final body = response.body;
          final json = jsonDecode(body);
          print(json);
          final result = json["object"] as List<dynamic>;
          // ignore: unnecessary_type_check
          if (result is List<dynamic>) {
            final messages = result.map((e) {
              final dialogs = Dialogs(
                  // createdAt: DateTime.parse(e["createdAt"]),
                  userId: e["userId"],
                  fistName: e["fistName"],
                  lastName: e["lastName"],
                  accountType: e["accountType"],
                  message: e["message"]);
              return support_get(
                  id: e["id"],
                  createdAt: DateTime.parse(e["createdAt"]),
                  //createdBy: e["createdBy"],
                  //   updatedAt: e["updatedAt"],
                  // modifiedBy: e["modifiedBy"],
                  //  deleted: e["deleted"],
                  userId: e["userId"],
                  //  status: e["status"],
                  dialogs: dialogs);
            }).toList();
            setState(() {
              models = messages;
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
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        ListTile(
          title: Text(""),
        ),
      ],
    ),
  );
}
