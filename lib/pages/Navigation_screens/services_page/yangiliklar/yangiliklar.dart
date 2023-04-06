import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/Widget/yangilik_list.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services_page/yangiliklar/models/yangiliklar_models.dart';

class Yangiliklar extends StatelessWidget {
  Yangiliklar({super.key});
  List<yangiliklar_models> models = [
    yangiliklar_models(
        id: "Kun.uz",
        foto:
            "https://cdn-japantimes.com/wp-content/uploads/2023/03/np_file_215675.jpeg",
        name: "TSUCHIYU ONSEN, FUKUSHIMA PREF",
        info:
            "With over 100 active volcanoes, Japan has the world’s third largest geothermal resources, but also a powerful industry that has steadfastly opposed developing the sector: hot springs.",
        dateTime: DateTime(2023, 3, 21, 20, 14, 0, 0),
        list_url: "https://randomuser.me/api/?results=5"),
    yangiliklar_models(
        id: "Kun.uz",
        foto: "https://i.imgur.com/W4E4iEF.jpg",
        name: "Flutter Launcher Icons",
        info:
            "A command-line tool which simplifies the task of updating your Flutter app's launcher icon. Fully flexible, allowing you to choose what platform you wish to update the launcher icon for and if you want, the option to keep your old launcher icon in case you want to revert back sometime in the future.",
        dateTime: DateTime.now(),
        list_url: ""),
    yangiliklar_models(
        id: "ft.com",
        foto:
            "https://d1e00ek4ebabms.cloudfront.net/production/401b572d-5e61-4dc1-b60f-c7666a6d19e9.jpg",
        name: "Receive free War in Ukraine updates",
        info:
            "Winter has played a major role in Russian and Ukrainian military history. It was decisive in their victories over Napoleon and Nazi Germany, and in what Kyiv-born writer Mikhail Bulgakov called that “great and terrible year” of 1918, when “the snowstorm from the north howled and howled” and Ukraine was beginning its war of independence.",
        dateTime: DateTime(2023, 3, 15, 20, 14, 0, 0),
        list_url: ""),
    yangiliklar_models(
        id: "Kun.uz",
        foto:
            "https://indyguide-web-development.s3.us-east-2.amazonaws.com/articles/thumbnail/Navruz-Holiday-in-Central-Asia-1609950933503.webp",
        name: "Navruz Holiday in Central Asia",
        info:
            "Although the oldest records of Navruz go back to the Parthian era(247 BC-224 AD), there is sufficient evidence to believe that this tradition has over 3000 years of history. Although it is widely celebrated among Central Asia, its roots are recognized as being in Persia which was interlinked with the Zoroastrian religion.",
        dateTime: DateTime(2020, 3, 21, 20, 14, 0, 0),
        list_url: ""),
  ];

  @override
  Widget build(BuildContext context) {
    models.sort((a, b) => b.dateTime.compareTo(a.dateTime));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000),
        centerTitle: true,
        title: Text(
          "So'nggi yangiliklar",
          style: TextStyle(
              fontSize: 18.sp,
              fontFamily: "Inter",
              fontWeight: FontWeight.bold,
              letterSpacing: 5.w),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/back_screen.png"), fit: BoxFit.fill)),
        child: yangiliklar_list(
          models: models,
        ),
      ),
    );
  }
}
