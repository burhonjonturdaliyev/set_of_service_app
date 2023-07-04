// ignore_for_file: must_be_immutable, unnecessary_null_comparison, avoid_print
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:set_of_service_app/const_api/api.dart';
import 'package:set_of_service_app/pages/Profile_settings/Widgets/loading/loading_profile.dart';

// ignore: camel_case_types
class Profile_setting_widgets extends StatefulWidget {
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

  Profile_setting_widgets(
      {super.key,
      required this.ism,
      required this.familya,
      required this.email,
      required this.sana,
      required this.davlatlar,
      required this.jinslari,
      required this.jinsi,
      required this.server,
      required this.userHashId,
      required this.userId});

  @override
  State<Profile_setting_widgets> createState() =>
      _Profile_setting_widgetsState();
}

// ignore: camel_case_types
class _Profile_setting_widgetsState extends State<Profile_setting_widgets> {
  File? image;
  final _picker = ImagePicker();
  int? rasm;
  bool showspinner = false;
  List<int> profel = [];
  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 75);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      await uploadImage();
    } else {
      print("Image is not selected");
    }
  }

  uploadImage() async {
    // Create the request
    var request = http.MultipartRequest('POST', Uri.parse(Api().upload_avatar));

    // Set the parameter
    request.files.add(await http.MultipartFile.fromPath('avatar', image!.path));
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
        setState(() {
          var rasm = int.parse(json['object']);
          profel.add(rasm);
        });
        print('List uzunligi: ${profel.length}');
      } else {
        setState(() {
          showspinner = false;
        });
        // Request failed
        print('Upload failed with status: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        showspinner = false;
      });
    }
  }

  choose() {
    return DropdownButton(
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
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(1900),
        maxTime: DateTime.now(),
        theme: DatePickerTheme(
          backgroundColor: const Color(0xff800000), // Set the background color
          headerColor: const Color(0xff800000), // Set the header text color
          itemStyle: TextStyle(
            color: Colors.white, // Set the date text color
            fontWeight: FontWeight.bold,
            fontSize: 18.0.sp,
          ),
          cancelStyle: TextStyle(
            color: Colors.white, // Set the done button text color
            fontSize: 16.0.sp,
            fontWeight: FontWeight.bold,
          ),
          doneStyle: TextStyle(
            color: Colors.white, // Set the done button text color
            fontSize: 16.0.sp,
            fontWeight: FontWeight.bold,
          ),
        ), onChanged: (date) {
      if (date != null) {
        setState(() {
          widget.sana.text = DateFormat("yyyy-MM-dd HH:mm").format(date);
        });
      }
    }, onConfirm: (date) {
      if (date != null) {
        setState(() {
          widget.sana.text = DateFormat("yyyy-MM-dd HH:mm").format(date);
        });
      }
    }, currentTime: DateTime.now());
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: ModalProgressHUD(
          blur: 0.5,
          progressIndicator: const CircularProgressIndicator(
            color: Color(0xff8B0000),
          ),
          inAsyncCall: showspinner,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 100.h,
                  width: 100.w,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        left: 0,
                        bottom: 0,
                        child: image != null
                            ? Container(
                                height: 100.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.black45),
                                    borderRadius: BorderRadius.circular(100),
                                    image: DecorationImage(
                                        image: FileImage(File(image!.path)),
                                        fit: BoxFit.cover)))
                            : Container(
                                height: 100.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.black45),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.black45,
                                    size: 65.w,
                                  ),
                                ),
                              ),
                      ),
                      Positioned(
                        bottom: 5.h,
                        right: 1.w,
                        child: Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(100.w)),
                          child: Center(
                            child: IconButton(
                                onPressed: () {
                                  getImage();
                                },
                                icon: Icon(
                                  Icons.edit_outlined,
                                  color: Colors.white,
                                  size: 20.w,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50.h,
                      width: 170.w,
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.black54,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp),
                        validator: (value) {
                          if (value != null) {
                            return "Iltimos ismingizni kiriting!";
                          }
                          return null;
                        },
                        controller: widget.ism,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(33)),
                            labelText: "Ism:",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                                fontFamily: "Inter")),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                      width: 170.w,
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.black54,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp),
                        validator: (value) {
                          if (value != null) {
                            return "Iltimos familyangizni kiriting!";
                          }
                          return null;
                        },
                        controller: widget.familya,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(33)),
                            labelText: "Familya:",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                                fontFamily: "Inter")),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50.h,
                      width: 170.w,
                      child: TextFormField(
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black54,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp),
                        validator: (value) {
                          if (value != null) {
                            return "Iltimos pochtangizni kiriting!";
                          }
                          return null;
                        },
                        controller: widget.email,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(33)),
                            labelText: "Pochta:",
                            prefixIcon: Icon(
                              Icons.mail_outlined,
                              size: 25.w,
                            ),
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                                fontFamily: "Inter")),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                      width: 170.w,
                      child: TextFormField(
                          style: TextStyle(
                              color: Colors.black54,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp),
                          validator: (value) {
                            if (value != null) {
                              return "Iltimos tug'ilgan sanangizni kiriting!";
                            }
                            return null;
                          },
                          readOnly: true,
                          controller: widget.sana,
                          keyboardType: TextInputType.none,
                          onTap: () {
                            kalendar(context);
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(33)),
                              labelText: "Tug'ilgan sana:",
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                  fontFamily: "Inter"))),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50.h,
                      width: 180.w,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.w, color: Colors.black45),
                          borderRadius: BorderRadius.circular(33)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Server:",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16.sp,
                                fontFamily: "Inter"),
                          ),
                          DropdownButton<String>(
                            underline: Container(),
                            value: widget.server,
                            elevation: 16,
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  widget.server = widget.server;
                                });
                              }
                            },
                            items: widget.davlatlar
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50.h,
                      width: 170.w,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.w, color: Colors.black45),
                          borderRadius: BorderRadius.circular(33)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Jins:",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16.sp,
                                fontFamily: "Inter"),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          choose(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B0000),
                  minimumSize: const Size(250, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(21),
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Loading_profile(
                          email: widget.email.text,
                          firstname: widget.ism.text,
                          gender: widget.jinsi,
                          lastname: widget.familya.text,
                          sana: widget.sana.text,
                          server: widget.server,
                          userHashId: widget.userHashId,
                          userId: widget.userId,
                          visitCountry: "Uzbekistan",
                          profel: profel,
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                  "Saqlash",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Inter",
                      letterSpacing: 1.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
