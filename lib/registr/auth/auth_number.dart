import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthNumberCode extends StatefulWidget {
  AuthNumberCode({super.key});

  @override
  State<AuthNumberCode> createState() => _AuthNumberCodeState();
}

class _AuthNumberCodeState extends State<AuthNumberCode> {
  String? code;

  final TextEditingController _first = TextEditingController();

  final TextEditingController _second = TextEditingController();

  final TextEditingController _third = TextEditingController();

  final TextEditingController _four = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  adding() {
    setState(() {
      code = _first.text + _second.text + _third.text + _four.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: adding,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(),
      body: Form(
        key: _formkey,
        child: Center(
          child: Container(
            height: 250.h,
            decoration: const BoxDecoration(color: Colors.deepPurple),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _textfielOTP(context, true, false, _first),
                    _textfielOTP(context, false, false, _second),
                    _textfielOTP(context, false, false, _third),
                    _textfielOTP(context, false, true, _four),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Bu yeda kodi ${code ?? ""}")],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _textfielOTP(BuildContext context, bool first, last,
      TextEditingController controller) {
    return SizedBox(
      height: 85.h,
      width: 55.w,
      child: AspectRatio(
        aspectRatio: 0.5,
        child: TextFormField(
          controller: controller,
          onChanged: (value) {
            if (value.isEmpty) {}
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          autofocus: true,
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
              counter: const Offstage(),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.w),
                  borderSide: BorderSide(width: 2.w, color: Colors.black12)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.w),
                  borderSide: BorderSide(width: 2.w, color: Colors.blue))),
        ),
      ),
    );
  }
}
