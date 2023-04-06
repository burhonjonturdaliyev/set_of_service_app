import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/registr/sign_up_registr/widget/textform_field.dart';
import 'package:set_of_service_app/screen/home_screen.dart';

class Registr_sign extends StatelessWidget {
  TextEditingController first_name = TextEditingController();
  TextEditingController last_name = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 54.w,
                backgroundColor: Colors.transparent,
                backgroundImage: const AssetImage("image/samuray.png"),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                child: Row(
                  children: [
                    Text_editions(
                        controller: first_name, label: "Ismingizni kiriting:")
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                child: Row(
                  children: [
                    Text_editions(
                        controller: last_name, label: "Familyangizni kiriting:")
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Navigator.of(context).push(PageTransition(
                          child: Home_Page(),
                          type: PageTransitionType.bottomToTop,
                          childCurrent: Registr_sign(),
                          curve: Curves.easeInOutCubicEmphasized));
                    }
                  },
                  child: Text("Ro'yxatdan o'tish"))
            ],
          ),
        ),
      ),
    );
  }
}
