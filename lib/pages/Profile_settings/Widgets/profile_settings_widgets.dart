// ignore_for_file: must_be_immutable, unnecessary_null_comparison, avoid_print
import 'dart:convert';
import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:set_of_service_app/const_api/api.dart';

class ProfileSettingWidgets extends StatefulWidget {
  TextEditingController ism;
  TextEditingController familya;
  TextEditingController email;
  TextEditingController sana;
  String server;
  List<String> davlatlar;
  String jinsi;
  List<String> jinslari;
  int? userId;
  String? userHashId;

  ProfileSettingWidgets({
    Key? key,
    required this.ism,
    required this.familya,
    required this.email,
    required this.sana,
    required this.davlatlar,
    required this.jinslari,
    required this.jinsi,
    required this.server,
    required this.userHashId,
    required this.userId,
  }) : super(key: key);

  @override
  State<ProfileSettingWidgets> createState() => _ProfileSettingWidgetsState();
}

class _ProfileSettingWidgetsState extends State<ProfileSettingWidgets> {
  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;
  List<int> profile = [];

  Future getImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 75,
    );

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      await uploadImage();
    } else {
      print("Image is not selected");
    }
  }

  Future<void> uploadImage() async {
    // Create the request
    var request = http.MultipartRequest('POST', Uri.parse(Api().upload_avatar));

    // Set the parameter
    request.files.add(
      await http.MultipartFile.fromPath('avatar', image!.path),
    );

    try {
      setState(() {
        showSpinner = true;
      });

      // Send the request
      var response = await request.send();

      // Check the response
      if (response.statusCode == 200) {
        setState(() {
          showSpinner = false;
        });

        // Request successful
        print('Upload successful');
        var responseBody = await response.stream.bytesToString();
        final json = jsonDecode(responseBody);
        print(json['object']);
        var rasm = json['object'] as String;
        var number = int.parse(rasm);
        setState(() {
          profile.add(number);
        });

        print('List uzunligi: ${profile.length}');
      } else {
        setState(() {
          showSpinner = false;
        });
        // Request failed
        print('Upload failed with status: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        showSpinner = false;
      });
    }
  }

  DropdownButton<String> choose() {
    return DropdownButton<String>(
      value: widget.jinsi,
      elevation: 16,
      onChanged: (newValue) {
        setState(() {
          widget.jinsi = newValue!;
        });
      },
      items: widget.jinslari.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  void kalendar(BuildContext context) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1920, 1, 1),
      maxTime: DateTime.now(),
      onChanged: (date) {},
      onConfirm: (date) {
        setState(() {
          widget.sana.text = DateFormat('yyyy-MM-dd').format(date);
        });
      },
      currentTime: DateTime.now(),
      locale: LocaleType.en,
    );
  }

  Future<void> saveForm() async {
    if (widget.ism.text.isEmpty ||
        widget.familya.text.isEmpty ||
        widget.email.text.isEmpty ||
        widget.sana.text.isEmpty ||
        widget.jinsi.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Xatolik'),
            content: const Text('Barcha maydonlarni to\'ldiring'),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (!EmailValidator.validate(widget.email.text)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Xatolik'),
            content: const Text('Email manzili noto\'g\'ri kiritildi'),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        showSpinner = true;
      });

      // Prepare the request body
      var body = {
        'id': widget.userId.toString(),
        'hash_id': widget.userHashId,
        'ism': widget.ism.text,
        'familya': widget.familya.text,
        'email': widget.email.text,
        'sana': widget.sana.text,
        'jinsi': widget.jinsi,
        'avatar': profile.isEmpty ? null : profile.last,
        'davlat': widget.server,
      };

      try {
        // Send the request
        var response = await http.post(
          Uri.parse(Api().edit_user),
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          body: body,
        );

        if (response.statusCode == 200) {
          setState(() {
            showSpinner = false;
          });
          print(response.statusCode);
        } else {
          setState(() {
            showSpinner = false;
          });
          print('Request failed with status: ${response.statusCode}');
        }
      } catch (e) {
        setState(() {
          showSpinner = false;
        });
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: GestureDetector(
              onTap: getImage,
              child: CircleAvatar(
                backgroundColor: const Color(0xff8B0000),
                radius: 60.w,
                backgroundImage: image != null ? FileImage(image!) : null,
                child: image == null
                    ? const Icon(
                        Icons.camera_alt,
                        size: 60,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextField(
                  controller: widget.ism,
                  decoration: const InputDecoration(
                    labelText: 'Ismingizni kiriting',
                  ),
                ),
                TextField(
                  controller: widget.familya,
                  decoration: const InputDecoration(
                    labelText: 'Familiyangizni kiriting',
                  ),
                ),
                TextField(
                  controller: widget.email,
                  decoration: const InputDecoration(
                    labelText: 'Emailingizni kiriting',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.sana.text == ''
                          ? 'Sanangizni tanlang'
                          : widget.sana.text,
                    ),
                    IconButton(
                      onPressed: () => kalendar(context),
                      icon: const Icon(Icons.date_range),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Jinsingizni tanlang'),
                    choose(),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B0000),
                    maximumSize: const Size(250, 50),
                    minimumSize: const Size(250, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ),
                  onPressed: () {
                    saveForm();
                  },
                  child: const Text('Saqlash'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
