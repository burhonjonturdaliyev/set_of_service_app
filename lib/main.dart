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


//New tasks
//--------------------------------------------------------------------
//rasmni auto yuklash va id lani saqlab list qib bervorish --function is ready only left to testing
// yangiliklar categorila qo'shish va cound add --prograss
// airticket check postman  --done
// "dd.MM.yyyy" that same format in airticket info --done
// /api/county/global/info/count qo'shish --prograss
// api 403 loginga otvorish each services --done
// change to colors selecting the catagory --done
// loading page timeout 10 15 second --done
// statuscode==200||statuscode==201 --done
// yyyy-MM-dd HH:mm should change this format --done

//New taks
//Chat --done
//Support chat
//REgistr save --done
//verifiation checking --done
//file upload add
//only one step to verificate accaount


//new tasks

//decrise the padding of name in chat --done
//404 error in balance check --done
//profile tahrirlash --done
//tahrirlash upload function image --process
//add profile photo --done
// left integrate with api

//problems
//after editing profile login code changed 

//new tasks
//connect to api => id card and profel edit --done
// add profel edit to server --done
//forget password telfon nomer --done
//connect faol elon --done
//upload elon --dones
// connect all services to real api --done
//adding news catigories

// new task
// decrise the substring --done
// if password null connect to admin --done
// shop null view and start add static value --done
// rasmmi serverdan ovolish va serverga yuborish string --done
// other service add to home list --done
// Eng oxirgi yangiliklar change to Savollar va yangiliklar --done
// done icons to trash icons --done
// admin with telegram in divider --done
// Elon uchun ariza in divider --done
// add comment edit function --done
// add timer to user forget password --done
// fix the balance add button

// new tasks
// remove the validator in airticket return date --done
// showing only date not clocks --done