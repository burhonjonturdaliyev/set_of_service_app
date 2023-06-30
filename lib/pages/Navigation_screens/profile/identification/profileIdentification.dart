// ignore_for_file: deprecated_member_use, duplicate_ignore, non_constant_identifier_names, file_names, invalid_use_of_visible_for_testing_member, use_build_context_synchronously, avoid_print, must_be_immutable

import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../const_api/api.dart';
import '../../../../registr/sign_in/Sign_in_screen.dart';

class IdentificationProfel extends StatefulWidget {
  IdentificationProfel({super.key, required this.userHashId});
  String? userHashId;

  @override
  State<IdentificationProfel> createState() => _IdentificationProfelState();
}

class _IdentificationProfelState extends State<IdentificationProfel> {
  File? image;

  SharedPreferences? logindata;

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
                            upload(context, manba, ImageSource.gallery,
                                widget.userHashId!);
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
                            upload(context, manba, ImageSource.camera,
                                widget.userHashId!);
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

  upload(BuildContext context, XFile? pickedImage, ImageSource source,
      String? userHashId) async {
    var dio = Dio();
    pickedImage = await ImagePicker().pickImage(source: source);

    if (pickedImage != null) {
      File file = File(pickedImage.path);

      // Compress the image
      Uint8List? compressedImage = await FlutterImageCompress.compressWithFile(
        file.path,
        quality: 85, // Adjust the compression quality as needed
      );

      // Create a temporary compressed file
      File compressedFile =
          await File('${file.path}.compressed').writeAsBytes(compressedImage!);

      String filename = compressedFile.path.split('/').last;
      String filePath = compressedFile.path;
      FormData data = FormData.fromMap({
        'key': "id-card",
        'image': await MultipartFile.fromFile(filePath, filename: filename),
      });
      var response = await dio.post(
        '${Api().id_card}${widget.userHashId}',
        data: data,
        onSendProgress: (send, total) {
          double sendMB = send / (1024 * 1024); // Convert bytes to megabytes
          double totalMB = total / (1024 * 1024); // Convert bytes to megabytes
          print("Sent: ${sendMB.toStringAsFixed(2)} MB");
          print("Total: ${totalMB.toStringAsFixed(2)} MB");
          print(
              "Yuklangan foizi: ${((send * 100) / total).toStringAsFixed(0)} %");
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logindata?.setBool('verification', true);
        print("Uploaded");
        print(response.statusMessage);
      } else if (response.statusCode == 403) {
        logindata?.clear();
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(child: Sign_in(), type: PageTransitionType.fade),
            (route) => false);
      } else {
        print(
            "Internetda yoki serverda muammo bor. Kod: ${response.statusCode}");
      }
    }
  }

  uploadCamera() async {
    // ignore: deprecated_member_use
    var pickedFile =
        await ImagePicker.platform.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    } else {}
  }

  gettingLogindata() async {
    logindata = await SharedPreferences.getInstance();
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
