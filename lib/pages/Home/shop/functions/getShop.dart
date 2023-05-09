import 'package:flutter/material.dart';
import 'package:set_of_service_app/const_api/api.dart';

class oziqOvqat {
  Future<List?> getOziqOvqat() async {
    final uri = Api().oziqOvqat;
    final url = Uri.parse(uri);
  }
}

class noOziqOvqat {
  Future<List?> getNoOziqOvqat() async {}
}
