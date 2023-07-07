// ignore_for_file: must_be_immutable, unnecessary_null_comparison, avoid_print, use_build_context_synchronously, unused_local_variable, non_constant_identifier_names
import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

import 'package:page_transition/page_transition.dart';
import 'package:set_of_service_app/const_api/api.dart';
import 'package:set_of_service_app/pages/Profile_settings/model/getting_user_info.dart';
import 'package:set_of_service_app/pages/Profile_settings/model/profel_edit_model.dart';
import 'package:set_of_service_app/screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileSettingWidgets extends StatefulWidget {
  TextEditingController ism;
  TextEditingController familya;
  TextEditingController email;
  TextEditingController sana;
  String server;
  List<String> davlatlar;
  String jinsi;
  List<String> jinslari;
  int? userId;
  String? userHashId;

  ProfileSettingWidgets({
    Key? key,
    required this.ism,
    required this.familya,
    required this.email,
    required this.sana,
    required this.davlatlar,
    required this.jinslari,
    required this.jinsi,
    required this.server,
    required this.userHashId,
    required this.userId,
  }) : super(key: key);

  @override
  State<ProfileSettingWidgets> createState() => _ProfileSettingWidgetsState();
}

class _ProfileSettingWidgetsState extends State<ProfileSettingWidgets> {
  // File? image;
  // final _picker = ImagePicker();
  bool showSpinner = false;
  String? tugilgankuni;
  getting_info_user? user_info;
  SharedPreferences? logindata;

  Future<void> login(profel_edit model) async {
    try {
      final response = await http.put(
        Uri.parse(Api().edit_user),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(model.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body;
        final json = jsonDecode(body);
        final data = getting_info_user.fromJson(json);
        setState(() {
          user_info = data;
          showSpinner = false;
        });
        await getSharedPreferencesInstance();
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: Home_Page(selectedIndex: 4),
                type: PageTransitionType.fade),
            (route) => false);
      } else {}

      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }

  upload() async {
    login(profel_edit(
        dateOfBirth: tugilgankuni,
        email: widget.email.text,
        firstName: widget.ism.text,
        genderType: widget.jinsi,
        id: widget.userId,
        lastName: widget.familya.text,
        userHashId: widget.userHashId,
        visitCountry: widget.server));
  }

  getSharedPreferencesInstance() async {
    logindata = await SharedPreferences.getInstance();
    logindata?.setString('firstName', user_info!.object!.firstName!);
    logindata?.setString('lastName', user_info!.object!.lastName!);
    logindata?.setString('visitCountry', user_info!.object!.visitCountry!);
    logindata?.setString('genderType', user_info!.object!.genderType!);
    logindata?.setString('dateOfBirth', user_info!.object!.dateOfBirth!);
    logindata?.setString('userHashId', user_info!.object!.userHashId!);
    logindata?.setString('email', user_info!.object!.email ?? "Mavjud emas");
  }

  DropdownButton<String> server() {
    return DropdownButton<String>(
      value: widget.server,
      elevation: 16,
      onChanged: (newValue) {
        setState(() {
          widget.jinsi = widget.jinsi;
        });
      },
      items: widget.davlatlar.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  DropdownButton<String> choose() {
    return DropdownButton<String>(
      value: widget.jinsi,
      elevation: 16,
      onChanged: (newValue) {
        setState(() {
          widget.jinsi = newValue!;
        });
      },
      items: widget.jinslari.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  void kalendar(BuildContext context) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1920, 1, 1),
      maxTime: DateTime.now(),
      onChanged: (date) {},
      onConfirm: (date) {
        setState(() {
          widget.sana.text = DateFormat('yyyy-MM-dd').format(date);
          tugilgankuni = DateFormat('yyyy-MM-dd HH:mm').format(date);
        });
      },
      currentTime: DateTime.now(),
      locale: LocaleType.en,
    );
  }

  Future<void> saveForm() async {
    if (widget.ism.text.isEmpty ||
        widget.familya.text.isEmpty ||
        widget.email.text.isEmpty ||
        widget.sana.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Xatolik'),
            content: const Text('Barcha maydonlarni to\'ldiring'),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (!EmailValidator.validate(widget.email.text)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Xatolik'),
            content: const Text('Email manzili noto\'g\'ri kiritildi'),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      upload();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: widget.ism,
          decoration: const InputDecoration(
            labelText: 'Ismingizni kiriting:',
          ),
        ),
        TextField(
          controller: widget.familya,
          decoration: const InputDecoration(
            labelText: 'Familiyangizni kiriting:',
          ),
        ),
        TextField(
          controller: widget.email,
          decoration: const InputDecoration(
            labelText: 'Emailingizni kiriting:',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text('Qaysi davlat serverini ishlatmoqchisiz:'),
            server(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              widget.sana.text == ''
                  ? 'Tug\'ilgan sanangizni tanlang:'
                  : widget.sana.text,
            ),
            IconButton(
              onPressed: () => kalendar(context),
              icon: const Icon(Icons.date_range),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text('Jinsingizni tanlang:'),
            choose(),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8B0000),
            maximumSize: const Size(250, 50),
            minimumSize: const Size(250, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(21),
            ),
          ),
          onPressed: () {
            setState(() {
              showSpinner = false;
            });
            saveForm();
          },
          child: const Text('Saqlash'),
        ),
      ],
    );
  }
}
