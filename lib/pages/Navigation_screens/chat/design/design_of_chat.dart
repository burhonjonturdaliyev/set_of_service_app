import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Navigation_screens/chat/models/chat_models.dart';

class Chat_design extends StatelessWidget {
  Chat_design({super.key, required this.chat_model});
  List<chat_models> chat_model;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chat_model.length,
      itemBuilder: (context, index) => items_design(chat_model[index]),
    );
  }
}

Widget items_design(chat_models chat) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      constraints: BoxConstraints(maxWidth: 250.w),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Colors.red,
              ]),
          borderRadius: BorderRadius.circular(33.w),
          border: Border.all(width: 1, color: Colors.black26)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(5.0).w,
            child: Text(chat.message),
          ),
        ],
      ),
    ),
  );
}
