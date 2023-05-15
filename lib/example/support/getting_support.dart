import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GEttingSupport extends StatefulWidget {
  const GEttingSupport({super.key});

  @override
  State<GEttingSupport> createState() => _GEttingSupportState();
}

class _GEttingSupportState extends State<GEttingSupport> {
  int uzunligi = 0;
  Future gettingSuport() async {
    try {
      final uri =
          "http://185.196.213.43:7088/api/support-chats/get-all-dialog/1";
      final url = Uri.parse(uri);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        // print(json["object"]["active"]);

        final result = json["object"]["active"] as List<dynamic>;
        print(result.length);
        setState(() {
          uzunligi = result.length;
        });
      }
    } catch (e) {}
  }

  gettingInfo() async {
    for (int i = 0; i <= uzunligi - 1; i++) {
      const uri =
          "http://185.196.213.43:7088/api/support-chats/get-all-dialog/1";
      final url = Uri.parse(uri);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        // print(json["object"]["active"]);

        final result = json["object"]["active"][i]["dialogs"];
        print("Here is $i");
        print(result);
        return result;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () async {
          await gettingSuport();
          gettingInfo();
        }),
        appBar: AppBar(title: Text("Uzunligi $uzunligi")),
        body: ListView.builder(
          itemCount: uzunligi,
          itemBuilder: (context, index) => design(),
        ));
  }
}

Widget design() {
  getting() {}
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 50,
      color: Colors.red,
    ),
  );
}
