// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:set_of_service_app/const_api/api.dart';

class images_upload {
  Future uploadPhoto() async {
    var dio = Dio();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path ?? " ");

      String filename = file.path.split('/').last;
      String filePath = file.path;
      FormData data = FormData.fromMap({
        'key': 'image',
        'image': await MultipartFile.fromFile(filePath, filename: filename),
      });
      var response = await dio.post(
        Api().uploadImage,
        data: data,
        onSendProgress: (send, total) {
          print("$send, $total");
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Successfully uploaded");
      }
    } else {
      print("O'xshamadi brat uzur");
    }
  }
}
