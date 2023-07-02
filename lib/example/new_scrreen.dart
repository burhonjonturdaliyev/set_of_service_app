// ignore_for_file: camel_case_types

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class New_screen extends StatefulWidget {
  const New_screen({super.key});

  @override
  State<New_screen> createState() => _New_screenState();
}

class _New_screenState extends State<New_screen> {
  File? file;
  final _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: const [Text("data")],
      ),
    );
  }
}
