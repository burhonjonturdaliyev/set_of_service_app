import 'package:flutter/material.dart';
import 'package:set_of_service_app/pages/services_page/yangiliklar/models/comment_models.dart';
import 'package:set_of_service_app/pages/services_page/yangiliklar/models/yangiliklar_models.dart';

class News_comments extends StatelessWidget {
  News_comments({super.key, required this.yangilik, required this.comments});
  final yangiliklar_models yangilik;
  final comment_models comments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(yangilik.info),
    );
  }
}
