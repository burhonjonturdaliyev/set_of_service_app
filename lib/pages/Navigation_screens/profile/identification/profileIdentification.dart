// ignore_for_file: deprecated_member_use, duplicate_ignore, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class IdentificationProfel extends StatefulWidget {
  const IdentificationProfel({super.key});

  @override
  State<IdentificationProfel> createState() => _IdentificationProfelState();
}

class _IdentificationProfelState extends State<IdentificationProfel> {
  File? image;
  File? gallery;
  final galleryPicker = ImagePicker();

  final imagePicker = ImagePicker();

  bool animation1 = true;
  bool animation2 = true;

  String face_animation = "animations/face_detect.json";
  String done_animation = "animations/done.json";
  String passport = "animations/passport.json";
  String waiting_animation = "animations/waiting.json";
  String onGoing = "animations/ongoing.json";

  animationChanger() {
    if (image != null) {
      setState(() {
        animation1 = false;
        face_animation = done_animation;
      });
    } else {
      setState(() {
        animation1 = true;
        face_animation = face_animation;
      });
    }
  }

  uploadCamera() async {
    // ignore: deprecated_member_use
    var pickedFile = await imagePicker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    } else {}
  }

  Future<void> uploadGallery() async {
    // ignore: deprecated_member_use
    var picketFile = await galleryPicker.getImage(source: ImageSource.gallery);

    if (picketFile != null) {
      setState(() {
        // ignore: unnecessary_null_comparison
        gallery = picketFile.path != null ? File(picketFile.path) : null;
      });
    } else {}
  }

  // Future<void> uploadImage() async {
  //   // Get a photo from the camera
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.getImage(source: ImageSource.camera);

  //   // Create a multipart request to upload the photo to the server
  //   final request = http.MultipartRequest(
  //     'POST',
  //     Uri.parse('https://example.com/upload'),
  //   );

  //   // Add the photo to the multipart request
  //   final file = File(pickedFile!.path);
  //   final stream = http.ByteStream(file.openRead());
  //   final length = await file.length();
  //   final multipartFile = http.MultipartFile(
  //     'file',
  //     stream,
  //     length,
  //   );
  //   request.files.add(multipartFile);

  //   // Send the multipart request to the server
  //   final response = await request.send();

  //   // Check if the server returned a success status code
  //   if (response.statusCode == 200) {
  //     print('Image uploaded to server.');
  //   } else {
  //     print('Error uploading image to server.');
  //   }
  // }

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
          child: image == null ? firstProcess() : secondProcess()),
    );
  }

  Widget firstProcess() {
    return Stack(
      children: [
        Positioned(
          top: 30.h,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Birinchi bosqich:",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Inter",
                    fontSize: 26.sp),
              ),
              SizedBox(
                width: 10.w,
              ),
              Lottie.asset(onGoing,
                  width: 60.w,
                  height: 90.h,
                  repeat: animation1,
                  reverse: false),
            ],
          ),
        ),
        Positioned(
          top: 165.h,
          left: 80.w,
          right: 80.w,
          child: Lottie.asset(face_animation,
              width: 150.w, repeat: animation1, reverse: false),
        ),
        Positioned(
          bottom: 220.h,
          left: 0,
          right: 0,
          child: Text(
            "Iltimos, yuzingizni kameraga to'liq tushishini taminlang!",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black54,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
                fontSize: 16.sp),
          ),
        ),
        Positioned(
            bottom: 150.h,
            left: 80.w,
            right: 80.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff8B0000)),
              onPressed: () async {
                await uploadCamera();
                animationChanger();
              },
              child: Text(
                "Shaxsni tasdiqlash",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp),
              ),
            )),
      ],
    );
  }

  Widget secondProcess() {
    return gallery != null
        ? doneProcess()
        : Stack(
            children: [
              Positioned(
                top: 90.h,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Birinchi bosqich:",
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Inter",
                          fontSize: 13.sp),
                    ),
                    Lottie.asset(face_animation,
                        height: 40.h, repeat: animation1, reverse: false),
                  ],
                ),
              ),
              Positioned(
                top: 30.h,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Ikkinchi bosqich:",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          fontSize: 26.sp),
                    ),
                    Lottie.asset(onGoing,
                        width: 60.w,
                        height: 90.h,
                        repeat: animation2,
                        reverse: false),
                  ],
                ),
              ),
              Positioned(
                bottom: 220.h,
                left: 0,
                right: 0,
                child: Text(
                  "Iltimos, shaxsingizni tasdiqlash uchun Biografik passport , ID karta yoki haydovchilik guvohnomasi bilan taminlang!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black54,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp),
                ),
              ),
              Positioned(
                  top: 145.h,
                  left: -20.w,
                  right: -20.w,
                  child: Lottie.asset(passport,
                      height: 400.h, width: 400.w, repeat: animation2)),
              Positioned(
                  bottom: 150.h,
                  left: 100.w,
                  right: 100.w,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff8B0000)),
                      onPressed: () async {
                        await uploadGallery();
                        if (gallery != null) {
                          setState(() {
                            passport = done_animation;
                            animation2 = false;
                          });
                        }
                      },
                      child: Text(
                        "Hujjatni yuklash",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp),
                      ))),
            ],
          );
  }

  Widget doneProcess() {
    return Stack(
      children: [
        Positioned(
          top: 60.h,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Text(
                "Tabriklaymiz, siz barcha bosqichlarni muvaffaqiyatli yakunladingiz!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Inter",
                    fontSize: 23.sp),
              ),
            ],
          ),
        ),
        Positioned(
          top: 120.h,
          left: 0,
          right: 0,
          child: Lottie.asset("animations/approved.json",
              width: 200.w, height: 200.h, repeat: false),
        ),
        Positioned(
          bottom: 200.h,
          left: 100.w,
          right: 100.w,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff8B0000),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Yakunlash",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp),
            ),
          ),
        )
      ],
    );
  }
}
