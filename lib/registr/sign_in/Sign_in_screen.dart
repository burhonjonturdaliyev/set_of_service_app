// ignore_for_file: file_names, camel_case_types, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:set_of_service_app/registr/sign_in/widget/design_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sign_in extends StatefulWidget {
  Sign_in({super.key, this.logindata});
  SharedPreferences? logindata;

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
        body: DesignSignIn(
          logindata: widget.logindata,
          number: number,
          password: password,
          visible: visible,
        ));
  }
}
