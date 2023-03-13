import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("image/back_screen.png"),
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter)),
    );
  }
}
