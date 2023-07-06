// ignore_for_file: deprecated_member_use, duplicate_ignore, non_constant_identifier_names, file_names, invalid_use_of_visible_for_testing_member, use_build_context_synchronously, avoid_print, must_be_immutable, depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../const_api/api.dart';

class IdentificationProfel extends StatefulWidget {
  IdentificationProfel({super.key, required this.userHashId});
  String? userHashId;

  @override
  State<IdentificationProfel> createState() => _IdentificationProfelState();
}

class _IdentificationProfelState extends State<IdentificationProfel> {
  File? image;

  SharedPreferences? logindata;
  final _picker = ImagePicker();

  Future openDialog(manba) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SizedBox(
          height: 100.h,
          width: 220.w,
          child: Column(
            children: [
              Text(
                "Suratni qayerdan yuklamoqchisiz?",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Inter",
                    fontSize: 12.sp),
              ),
              const Divider(
                thickness: 1,
                color: Colors.black87,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            getImage(ImageSource.gallery);
                          },
                          icon: Icon(
                            Icons.photo_outlined,
                            color: Colors.black54,
                            size: 25.sp,
                          )),
                      Text(
                        "Galareyadan",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter",
                            fontSize: 10.sp),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            getImage(ImageSource.camera);
                          },
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.black54,
                            size: 25.sp,
                          )),
                      Text(
                        "Kamera orqali",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter",
                            fontSize: 10.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future getImage(source) async {
    final pickedFile =
        await _picker.pickImage(source: source, imageQuality: 75);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      uploadImage();
    } else {
      print("Image is not selected");
    }
  }

  void uploadImage() async {
    // Create the request
    var request = http.MultipartRequest(
        'POST', Uri.parse('${Api().id_card}${widget.userHashId}'));

    // Set the parameter
    request.files
        .add(await http.MultipartFile.fromPath('id-card', image!.path));
    print(request.url.path);
    print(request.fields.toString());
    print(request.files[0].filename);
    try {
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      final json = jsonDecode(responseBody);
      if (response.statusCode == 200) {
        print('Upload successful');
        print(json['object']);
        print(json['message']);
        gettingLogindata();
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: Home_Page(selectedIndex: 4),
                type: PageTransitionType.fade),
            (route) => false);
      } else {
        print('Upload failed with status: ${response.statusCode}');
        print(json['object']);
        print(json['message']);
      }
    } catch (e) {
      print('Upload failed with error: $e');
    }
  }

  gettingLogindata() async {
    logindata = await SharedPreferences.getInstance();
    logindata!.setBool('verification', true);
  }

  @override
  void initState() {
    gettingLogindata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff8B0000),
          centerTitle: true,
          title: Text(
            "Identifikasiya",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                letterSpacing: 5.w),
          )),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("image/back_screen.png"),
                  fit: BoxFit.fitHeight)),
          child: verification()),
    );
  }

  Widget verification() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "image/verification/verification.png",
          width: 180.w,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "Iltimos, shaxsingizni tasdiqlash uchun quyidagi hujjatlardan birini bizga yuklang!\nHujjatlar:",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Inter",
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          "Passport, Haydovchilik guvoxnomasi, ID card, 在留カード",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Inter",
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 110.h,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8B0000),
              minimumSize: const Size(250, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
            ),
            onPressed: () {
              openDialog(image);
            },
            child: Text(
              "Hujjatni yuklash",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Inter",
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ))
      ],
    );
  }
}
