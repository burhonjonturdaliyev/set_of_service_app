import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Counting extends StatefulWidget {
  const Counting({super.key});

  @override
  State<Counting> createState() => _CountingState();
}

class _CountingState extends State<Counting> {
  List<String> parvoz = ["Economy", "Business"];

  String dropdownValue = "Economy";
  int man = 0;
  int woman = 0;
  int child = 0;

  man_adding_function() {
    setState(() {
      man++;
    });
  }

  woman_adding_function() {
    setState(() {
      woman++;
    });
  }

  child_adding_function() {
    setState(() {
      child++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$man",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
            onPressed: man_adding_function,
            icon: Icon(
              Icons.man_outlined,
              size: 35.w,
            )),
        Text(
          "$woman",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
            onPressed: woman_adding_function,
            icon: Icon(
              Icons.woman_outlined,
              size: 35.w,
            )),
        Text(
          "$child",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
            onPressed: child_adding_function,
            icon: Icon(
              Icons.child_friendly_outlined,
              size: 35.w,
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: double.infinity,
            width: 2.w,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //   mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Parvoz klassi",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                        fontSize: 10.sp),
                  )
                ],
              ),
              DropdownButton(
                value: dropdownValue,
                elevation: 16,
                onChanged: (newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: parvoz.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )
            ],
          ),
        )
      ],
    );
  }
}
