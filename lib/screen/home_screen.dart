// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_constructors_in_immutables, duplicate_ignore, library_private_types_in_public_api, non_constant_identifier_names, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/pages/Navigation_screens/chat/chat.dart';
import 'package:set_of_service_app/pages/Navigation_screens/history/history.dart';
import 'package:set_of_service_app/pages/Navigation_screens/home.dart';
import 'package:set_of_service_app/pages/Navigation_screens/profile/profil.dart';
import 'package:set_of_service_app/pages/Navigation_screens/services.dart';
import 'package:set_of_service_app/pages/Support_page/support_type.dart';
import 'package:set_of_service_app/registr/sign_in/Sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/Navigation_screens/chat/functions/getMessage.dart';
import '../pages/Navigation_screens/chat/models/chat_models.dart';

class Home_Page extends StatefulWidget {
  Home_Page({
    super.key,
  });

  @override
  // ignore: no_logic_in_create_state
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  int userId = 0;
  SharedPreferences? logindata;
  int selectedIndex = 2;
  final List<IconData> data = [
    Icons.home_outlined,
    Icons.history_outlined,
    Icons.menu_outlined,
    Icons.chat_bubble_outline,
    Icons.manage_accounts_outlined,
  ];
  //bool Lock_screen = false;
  late PageController? _controller;

  final white = Colors.white;

  final appbarColor = const Color(0xFF8B0000);

  final containerColor = const Color(0xff8A0000);

  final circleavatarback = const Color.fromARGB(208, 220, 163, 163);

  late bool new_user;
  String? fullname, sana, number, jins, davlat, server, userHashId;
  bool? verification;

  List<chat_models> models = [];

  Future<void> getSharedPreferencesInstance() async {
    logindata = await SharedPreferences.getInstance();
    int? id = logindata?.getInt("id");
    if (id != null) {
      setState(() {
        userId = id;
      });
      setState(() {
        fullname =
            "${logindata?.getString("firstName")} ${logindata?.getString("lastName")}";
        sana = logindata?.getString("dateOfBirth");
        number = logindata?.getString('phoneNumber');
        jins = logindata?.getString('genderType');
        davlat = logindata?.getString('currentCountry');
        server = logindata?.getString('visitCountry');
        verification = logindata?.getBool('verification');
        userHashId = logindata?.getString("userHashId");
      });
      print(userHashId);
    }
  }

  Future<void> fetchMessage() async {
    final Response = await getMessage().fetchMessage(context, logindata);
    if (mounted) {
      Response != null ? models = Response : null;
    }
  }

  @override
  void initState() {
    super.initState();
    getSharedPreferencesInstance();
    _controller = PageController(initialPage: selectedIndex);
    fetchMessage();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  exit() {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text("Dasturdan chiqishni xoxlaysizmi?"),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Text("Ha")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Yo'q")),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarColor,
        title: Text(
          "${"set-of-services".toUpperCase()} ${"ilovasi".toLowerCase()}",
          style: TextStyle(
            fontFamily: "Inter",
            color: white,
            fontSize: 10.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(PageTransition(
                  child: SupportTypes(
                    userId: userId,
                  ),
                  type: PageTransitionType.rightToLeftJoined,
                  childCurrent: Home_Page()));
            },
            icon: Icon(
              Icons.mail,
              size: 32.w,
            ),
          ),
        ],
      ),
      drawer: Drawer(
          backgroundColor: appbarColor,
          width: MediaQuery.of(context).size.width * .65,
          child: Column(
            children: [
              SafeArea(
                child: SizedBox(
                  height: 160.h,
                  child: Image.asset(
                    "image/app/logo_kok2.png",
                    width: 200.w,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 251, 244, 244)),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text("Log out"),
                        trailing: Icon(
                          Icons.logout_outlined,
                          color: Colors.black,
                          size: 24.w,
                        ),
                        onTap: () {
                          logindata?.clear();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Sign_in(),
                              ));
                        },
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Exit"),
                        trailing: Icon(
                          Icons.exit_to_app_outlined,
                          color: Colors.black,
                          size: 24.w,
                        ),
                        onTap: exit,
                      ),
                      Divider(),
                    ],
                  ),
                ),
              )
            ],
          )),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 5.0.w, right: 5.0.w, bottom: 3.0.h),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(20),
          color: containerColor,
          child: SizedBox(
            height: 60.h,
            width: double.infinity,
            child: ListView.builder(
              itemCount: data.length,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              itemBuilder: (ctx, i) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = i;
                      _controller?.animateToPage(selectedIndex,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 35.w,
                    child: Icon(
                      data[i],
                      size: 35.w,
                      color:
                          i == selectedIndex ? Colors.white : circleavatarback,
                    ),
                  ),
                ),
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/back_screen.png"),
                fit: BoxFit.fitHeight)),
        child: PageView(
          physics: AlwaysScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          children: [
            List_of_services(
              userId: userId,
            ),
            History(
              userId: userId,
            ),
            Home(
              userId: userId,
            ),
            Chat(
              userId: userId,
              models: models,
            ),
            Profil(
              userId: userId,
              davlat: davlat,
              fullname: fullname,
              jins: jins,
              number: number,
              sana: sana,
              server: server,
              verification: verification,
              userHashId: userHashId,
            )
          ],
        ),
      ),
    );
  }
}
