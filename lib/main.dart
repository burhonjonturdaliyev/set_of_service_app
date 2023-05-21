import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/Splash_screen/splash_screen.dart';

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
          home: const Splash_screen()),
      designSize: const Size(375, 812),
    );
  }
}

//switch to 0 to 2 index in navigation
// add desc "Malumot mavjud emas" to global info
// change to last changing
// shop oziq ovqat ulash
// history add not history
