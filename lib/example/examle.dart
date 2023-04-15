// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  void sign() async {
    // Changed method name to match onPressed
    try {
      loading();
      Response response = await post(Uri.parse("https://reqres.in/api/login"),
          body: {
            'email': email.text,
            'password': password.text
          }); // Fixed getting text from controllers
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        Navigator.of(context).pop(); // Hide the dialog on successful response
        print("Successfully done");
      } else {
        Navigator.of(context).pop();
        print(
            "Xatolik bu yerda => ${response.statusCode}"); // Print the response status code
      }
    } catch (e) {
      print("Xatolik bu yerda => $e"); // Print the error message
    }
  }

  void loading() {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: password,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21))),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: sign, child: const Text("Kirish"))
          ]),
    );
  }
}
