import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/Splash_screen/splash_screen.dart';
import 'package:set_of_service_app/pages/Home/airticket/page/air_ticket_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Set of service',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),

        home: Air_ticket_list(),
        // home: const Splash_screen(),
      ),
      designSize: const Size(375, 812),
    );
  }
}
