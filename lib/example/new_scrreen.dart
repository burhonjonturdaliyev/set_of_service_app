// ignore_for_file: camel_case_types, avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class New_screen extends StatefulWidget {
  const New_screen({super.key});

  @override
  State<New_screen> createState() => _New_screenState();
}

class _New_screenState extends State<New_screen> {
  File? image;
  final _picker = ImagePicker();
  bool showspinner = false;

  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 75);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    } else {
      print("Image is not selected");
    }
  }

  void uploadImage() async {
    // Create the request
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://ec2-54-199-249-118.ap-northeast-1.compute.amazonaws.com:7088/sos/api/file/upload/avatar'));

    // Set the parameter
    request.files.add(await http.MultipartFile.fromPath(
        'avatar', image!.path)); //id: 124103960592468961080547074241903548345
    print(request.url.path);
    print(request.fields.toString());
    print(request.files[0].filename);
    try {
      setState(() {
        showspinner = true;
      });
      // Send the request
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      final json = jsonDecode(responseBody);
      // Check the response
      if (response.statusCode == 200) {
        setState(() {
          showspinner = false;
        });
        // Request successful
        print('Upload successful');
        print(json['object']);
        print(json['message']);
      } else {
        setState(() {
          showspinner = false;
        });
        // Request failed
        print('Upload failed with status: ${response.statusCode}');
        print(json['object']);
        print(json['message']);
      }
    } catch (e) {
      setState(() {
        showspinner = false;
      });
      // Request error
      print('Upload failed with error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: uploadImage),
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              child: image == null
                  ? Center(
                      child: GestureDetector(
                          onTap: getImage, child: const Text("Pick the image")),
                    )
                  : Center(
                      child: Image.file(
                        File(image!.path).absolute,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
