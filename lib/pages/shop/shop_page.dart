import 'package:flutter/material.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8B0000),
      body: SafeArea(
        child: Container(
            decoration: const BoxDecoration(
          color: Color(0xffFDDADA),
          image: DecorationImage(
              image: AssetImage("image/back_screen.png"), fit: BoxFit.cover),
        )),
      ),
    );
  }
}
