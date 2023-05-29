import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/Splash_screen/splash_screen.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/additional_screen/additional_rows.dart';

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
          home: additionalNews()),
      designSize: const Size(375, 812),
    );
  }
}


// connect comment - <<process>>
// shop oziq ovqat ulash <<process>>
// connect airticket both methods {post, get} <<process>>



//------------------------------------------------------------------------------
// newww
// oziq ovqat catagory should be visible in user pressed --done
// textstyle should be bold --done
//card title should be change title to oziq ovqat --done
// drop down button for oziq ovqat card --done
// decrise padding additional info (view start etc) --done
// little be small heiht container --done
// subr to for each of title --done
// bold should be fontweight.800 --done
// buyurtma berish change to Batafsil malumot =>oziq ovqat section --done
// yaponiya should not change  --done
// add all the foydalanish shartlari link  --done
// keyingisi change to Ro'yxatdan o'tish --done
// xizmat hali yulga qoyilgan emas change to ... yo'lga qo'yilmagan!
// optimaze photo in flutter
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// new
// change the news design which is same as a figma
//------------------------------------------------------------------------------

