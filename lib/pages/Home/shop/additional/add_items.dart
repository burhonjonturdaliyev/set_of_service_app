// ignore_for_file: camel_case_types, non_constant_identifier_names, must_be_immutable, invalid_use_of_visible_for_testing_member, avoid_print, unnecessary_null_comparison, use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/pages/Home/shop/model/image_model.dart';
import 'package:set_of_service_app/pages/Home/shop/shop_page.dart';
import 'package:set_of_service_app/registr/sign_in/Sign_in_screen.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../../const_api/api.dart';

class addItems extends StatefulWidget {
  addItems({super.key, required this.userId});
  int userId;

  @override
  State<addItems> createState() => _addItemsState();
}

class _addItemsState extends State<addItems> {
  TextEditingController mavzu = TextEditingController();

  TextEditingController telegram = TextEditingController();

  TextEditingController telfon = TextEditingController();

  TextEditingController qoshimcha_raqam = TextEditingController();

  TextEditingController manzil = TextEditingController();

  TextEditingController batafsil = TextEditingController();
  late String telegramLinki;

  final _formKey = GlobalKey<FormState>();
  File? rasm1;
  File? rasm2;
  File? rasm3;
  File? rasm4;

  int radioButton = 1;
  bool checkBox = false;
  final _picker = ImagePicker();
  shop_image? imagelar;

  List<String> index_photo = [];

  elon_joylash() async {
    await telegram_link();
    if (checkBox == true) {
      Map<String, dynamic> requestBody = {
        "address": manzil.text,
        "delivered": true,
        "description": batafsil.text,
        "mobileNumber": telfon.text,
        "phoneNumber": qoshimcha_raqam.text,
        "shopType": "FOODS",
        "telegramUrl": telegramLinki,
        "title": mavzu.text,
        "userId": widget.userId,
        "objectPhotos": index_photo
      };

      var response = await http.post(
        Uri.parse(Api().elon),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        print("Succesfully");
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: Shop(userId: widget.userId, selectedIndex: 1),
                type: PageTransitionType.fade));
      } else {
        print(response.statusCode);
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: const Color(0xFF8B0000),
            content: SizedBox(
              height: 150.h,
              width: 100.w,
              child: Stack(children: [
                Positioned(
                    top: 50.h,
                    left: 0,
                    right: 0,
                    child: Text(
                      "Sizning e'loningiz joylanmadi! Iltimos, yana bir harakat qilib ko'ring!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700,
                          fontSize: 15.sp),
                    )),
                Positioned(
                    top: -15.h,
                    right: -10.w,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close_outlined,
                        color: Colors.white,
                        size: 35.sp,
                      ),
                    )),
              ]),
            ),
          ),
        );
      }
    } else {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: const Color(0xFF8B0000),
          content: SizedBox(
            height: 150.h,
            width: 100.w,
            child: Stack(children: [
              Positioned(
                  top: 50.h,
                  left: 0,
                  right: 0,
                  child: Text(
                    "E'lonni joylashdan oldin, e'lon berish shartlari bilan tanishib chiqing!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                        fontSize: 15.sp),
                  )),
              Positioned(
                  top: -15.h,
                  right: -10.w,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close_outlined,
                      color: Colors.white,
                      size: 35.sp,
                    ),
                  )),
            ]),
          ),
        ),
      );
    }
  }

  Future gettingImage(manba, source) async {
    final pickedfile =
        await _picker.pickImage(source: source, imageQuality: 75);
    if (mounted) {
      if (pickedfile != null) {
        setState(() {
          if (manba == rasm1) {
            rasm1 = File(pickedfile.path);
          } else if (manba == rasm2) {
            rasm2 = File(pickedfile.path);
          } else if (manba == rasm3) {
            rasm3 = File(pickedfile.path);
          } else if (manba == rasm4) {
            rasm4 = File(pickedfile.path);
          }
        });
      }
    }
    if (pickedfile != null) {
      setState(() {
        manba = File(pickedfile.path);
      });
      uploadImage(manba);
    } else {
      print("Image is not selected");
    }
  }

  void uploadImage(image) async {
    // Create the request
    var request = http.MultipartRequest('POST', Uri.parse(Api().uploadImage));

    // Set the parameter
    request.files
        .add(await http.MultipartFile.fromPath('shop-photos', image!.path));
    print(request.url.path);
    print(request.fields.toString());
    print(request.files[0].filename);
    try {
      // Send the request
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      // Check the response
      if (response.statusCode == 200 || response.statusCode == 201) {
        final json = jsonDecode(responseBody);
        String object = json['object'];
        print(object);
        setState(() {
          index_photo.add(object);
        });
        // Request successful
        print('Upload successful');
      } else if (response.statusCode == 403) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Sign_in(),
            ),
            (route) => false);
      } else {
        // Request failed
        print('Upload failed with status: ${response.statusCode}');
        print(responseBody);
      }
    } catch (e) {
      // Request error
      print('Upload failed with error: $e');
    }
  }

  telegram_link() {
    if (telegram != null) {
      setState(() {
        var temp = telegram.text;
        telegramLinki = 'https://t.me/$temp';
      });
    }
  }

  Future<void> _urlLauncher(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch $url";
    }
  }

  Future openDialog(manba) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SizedBox(
          height: 102.h,
          width: 220.w,
          child: Column(
            children: [
              Text(
                "Suratni qayerdan yuklamoqchisiz?",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Inter",
                    fontSize: 12.sp),
              ),
              const Divider(
                thickness: 1,
                color: Colors.black87,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            gettingImage(manba, ImageSource.gallery);
                          },
                          icon: Icon(
                            Icons.photo_outlined,
                            color: Colors.black54,
                            size: 25.sp,
                          )),
                      Text(
                        "Galareyadan",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter",
                            fontSize: 10.sp),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            gettingImage(manba, ImageSource.camera);
                          },
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.black54,
                            size: 25.sp,
                          )),
                      Text(
                        "Kamera orqali",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter",
                            fontSize: 10.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getImage(manba) {
    return InkWell(
        onTap: () {
          openDialog(manba);
        },
        child: Container(
          height: 50.h,
          width: 75.w,
          decoration: BoxDecoration(
              color: const Color(0xABB9AEAE),
              borderRadius: BorderRadius.circular(5.w)),
          child: manba != null
              ? Image.file(
                  File(manba.path).absolute,
                  fit: BoxFit.cover,
                )
              : Center(
                  child: Icon(
                  Icons.add_photo_alternate_outlined,
                  color: const Color(0xFF8B0000),
                  size: 30.sp,
                )),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Nooziq-ovqat",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              letterSpacing: 5.w,
              fontWeight: FontWeight.bold,
              fontFamily: "Inter"),
        ),
        backgroundColor: const Color(0xFF8B0000),
      ),
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2.h, left: 2.w, right: 2.w),
                  child: Container(
                    height: 25.h,
                    decoration: BoxDecoration(
                        color: const Color(0xFF8B0000),
                        borderRadius: BorderRadius.circular(5.w)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "E'lon berish",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                                letterSpacing: 5.w),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 11.w, vertical: 7.h),
                  child: Column(children: [
                    Row(
                      children: [
                        Text(
                          "Rasm qo'shish",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Inter",
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "E'longa bermoqchi bo'lgan mahsulotingizni rasmini yuklang.\nRasm soni 4 tadan oshmasligi kerak !!!",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                              fontSize: 11.sp),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getImage(rasm1),
                        getImage(rasm2),
                        getImage(rasm3),
                        getImage(rasm4),
                      ],
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "Mavzu qo'shish",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Inter",
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          "E’lon mavzusini yozing.\nEtibor bering !!! xxxx tadan ko’p belgi e’lon uchun ajratilgan joydan oshib ketadi va ko’rinmay qolishi mumkin !!!  ",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                              fontSize: 11.sp),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    shortTextfield("Mavzu", mavzu),
                    telegramField("Telegram @username", telegram),
                    numberTextfield("Telefon raqam", telfon),
                    numberTextfield("Qo'shimcha raqam", qoshimcha_raqam),
                    shortTextfield("Manzil", manzil),
                    bigTextfield("Batafsil ma'lumot", batafsil),
                    Row(
                      children: [
                        Text(
                          "Yetkazib berasizmi?",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Inter",
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Ha",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter",
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Radio(
                          value: 1,
                          activeColor: const Color(0xFF8B0000),
                          groupValue: radioButton,
                          onChanged: (value) {
                            setState(() {
                              radioButton = value as int;
                            });
                          },
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Yo'q",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter",
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Radio(
                          value: 2,
                          activeColor: const Color(0xFF8B0000),
                          groupValue: radioButton,
                          onChanged: (value) {
                            setState(() {
                              radioButton = value as int;
                            });
                          },
                        ),
                      ],
                    ),
                    shartlari(),
                    SizedBox(
                      height: 5.h,
                    ),
                    uploadButton()
                  ]),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget radioButtonField(int value, int groupvalue) {
    return Radio(
      value: value,
      groupValue: groupvalue,
      onChanged: (value) {
        setState(() {
          groupvalue = value!;
        });
      },
    );
  }

  Widget shartlari() {
    return Row(
      children: [
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "E'lon berish shartlari",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Inter",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () => _urlLauncher("https://office-project.uz/")),
          TextSpan(
              text: "ga roziman",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Inter",
                  fontSize: 14.sp))
        ])),
        Checkbox(
          value: checkBox,
          activeColor: const Color(0xFF8B0000),
          onChanged: (value) {
            setState(() {
              checkBox = value!;
            });
          },
        )
      ],
    );
  }

  Widget uploadButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF8B0000),
          minimumSize: const Size(250, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21),
          ),
        ),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            if (rasm1 != null && rasm2 != null ||
                rasm1 != null && rasm3 != null ||
                rasm1 != null && rasm4 != null ||
                rasm2 != null && rasm3 != null ||
                rasm2 != null && rasm4 != null ||
                rasm3 != null && rasm4 != null) {
              elon_joylash();
            } else {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: const Color(0xFF8B0000),
                  content: SizedBox(
                    height: 80.h,
                    width: 80.w,
                    child: Stack(children: [
                      Positioned(
                          top: 5.h,
                          left: 5.w,
                          right: 5.w,
                          child: Text(
                            "Iltimos, eng kamida 2 ta rasm yuklang!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Inter",
                                fontSize: 13.sp),
                          )),
                      Positioned(
                          bottom: -5.h,
                          left: 45.w,
                          right: 45.w,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 244, 149, 149),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(21),
                              ),
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "Ok",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Inter",
                                  fontSize: 16.sp),
                            ),
                          ))
                    ]),
                  ),
                ),
              );
            }

            // Navigator.pop(context);
          }
        },
        child: Text(
          "E'lonni joylash",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Inter",
              fontSize: 20.sp,
              fontWeight: FontWeight.bold),
        ));
  }

  Widget telegramField(String label, controller) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Iltimos ${label.toLowerCase()}ni kiriting!";
              }
              return null;
            },
            controller: controller,
            maxLines: 1,
            decoration: InputDecoration(
                prefix: const Text(
                  "@",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Inter",
                  ),
                ),
                label: Text(label),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.w, color: const Color(0xFF8B0000)),
                    borderRadius: BorderRadius.circular(12.w))),
          ))
        ],
      ),
    );
  }

  Widget bigTextfield(String label, controller) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Iltimos ${label.toLowerCase()}ni kiriting!";
              }
              return null;
            },
            controller: controller,
            maxLines: 3,
            decoration: InputDecoration(
                label: Text(label),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.w, color: const Color(0xFF8B0000)),
                    borderRadius: BorderRadius.circular(12.w))),
          ))
        ],
      ),
    );
  }

  Widget numberTextfield(String label, controller) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Iltimos ${label.toLowerCase()}ni kiriting!";
              }
              if (value.length < 12) {
                return "Iltimos ${label.toLowerCase()}ni to'liq kiriting!";
              }
              return null;
            },
            controller: controller,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            maxLines: 1,
            decoration: InputDecoration(
                prefix: const Text(
                  "+",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Inter",
                  ),
                ),
                label: Text(label),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.w, color: const Color(0xFF8B0000)),
                    borderRadius: BorderRadius.circular(12.w))),
          ))
        ],
      ),
    );
  }

  Widget shortTextfield(String label, controller) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Iltimos ${label.toLowerCase()}ni kiriting!";
              }
              return null;
            },
            controller: controller,
            maxLines: 1,
            decoration: InputDecoration(
                label: Text(label),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.w, color: const Color(0xFF8B0000)),
                    borderRadius: BorderRadius.circular(12.w))),
          ))
        ],
      ),
    );
  }
}
