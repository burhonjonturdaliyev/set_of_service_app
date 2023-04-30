import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:set_of_service_app/registr/sign_in/widget/design_sign_in.dart';

class Sign_in extends StatefulWidget {
  Sign_in({super.key});

  @override
  State<Sign_in> createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {
  TextEditingController number = TextEditingController();

  TextEditingController password = TextEditingController();

  bool visible = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
        backgroundColor: Colors.white,
        body:
            DesignSignIn(number: number, password: password, visible: visible));
  }
}
