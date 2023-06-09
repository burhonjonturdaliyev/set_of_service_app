import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/Splash_screen/splash_screen.dart';

void main() async {
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
          home: const Splash_screen()),
      designSize: const Size(375, 812),
    );
  }
}


// monitoring two section elon va xarajatlar --done
// at least 2 photo required in shop
// use number format --done
//should add /sos/api/auth/step_1
// +998-99-123-45-67 vs +81-80-1234-5678 --done
// changing the style of server bold black, others should be black34 weight.w400
// yangiliklar section add items and changings
// komment change to izohlar



