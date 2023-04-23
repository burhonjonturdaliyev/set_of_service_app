import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:set_of_service_app/registr/Sign_in_screen.dart';
import 'package:set_of_service_app/screen/home_screen.dart';

class Auth_page extends StatelessWidget {
  const Auth_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // user logined in
        if (snapshot.hasData) {
          return const Home_Page();
        }

        // user is not logined in

        else {
          return Sign_in();
        }
      },
    ));
  }
}