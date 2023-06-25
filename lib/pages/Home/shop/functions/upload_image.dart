// ignore_for_file: avoid_print, use_build_context_synchronously, camel_case_types

import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/registr/sign_in/Sign_in_screen.dart';

class images_upload {
  Future<void> upload(BuildContext context, XFile? pickedImage,
      ImageSource source, List<int> photos) async {
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
        'key': '674517ac3e4eafb5e110898fad8a554a',
        'image': await MultipartFile.fromFile(filePath, filename: filename),
      });
      var response = await dio.post(
        'https://api.imgbb.com/1/upload',
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
        print("Uploaded");
      } else if (response.statusCode == 403) {
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
}
