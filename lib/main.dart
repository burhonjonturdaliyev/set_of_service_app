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
// sos balance press notification -- process
// auth page ✔️ done
// scroll photos - ✔️done
// add all extra infor - ✔️done
// auto match which count
// profil setting which server use - process
// identi passport, drive lin, id card selectable, taking photo with whole body with doc - ✔️done
// second upload quality doc - ✔️done
// ordering information trend, top, normal, official, others - ✔️done