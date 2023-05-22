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

//switch to 0 to 2 index in navigation --done
// add desc "Malumot mavjud emas" to global info -- done
// connect comment - <<process>>
// change to last changing -- done
// shop oziq ovqat ulash <<process>>
// history add not history done
//  add logo where you need <<50%>>
// connect airticket both methods {post, get} <<process>>
// paynet decr "Paynet xizmati vaqtincha ishlamidi" --done
// "Texnik ko'rik olib borilmoqda" change to "Xizmat hali yo'lga qo'yilgan emas" --done
// adding card to no oziq ovqat
// davlat server in resgitr {Japan, uzb, Korea, Euro, USA, Australia, china}
// same back auth number code