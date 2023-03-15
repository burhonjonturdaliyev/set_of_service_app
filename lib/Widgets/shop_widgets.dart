import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_of_service_app/models/colour_model.dart';
import 'package:set_of_service_app/models/shop_models.dart';

// ignore: camel_case_types, must_be_immutable
class List_builder extends StatelessWidget {
  // ignore: non_constant_identifier_names
  List_builder({super.key, required this.info_List});
  // ignore: non_constant_identifier_names
  List<Shop_models> info_List;
  List<Colour_models> colour = [
    Colour_models(
        rang1: const Color.fromARGB(204, 8, 250, 230),
        rang2: Colors.transparent),
    Colour_models(
        rang1: const Color.fromARGB(206, 50, 53, 224),
        rang2: Colors.transparent),
    Colour_models(
        rang1: const Color.fromARGB(206, 21, 242, 69),
        rang2: Colors.transparent),
    Colour_models(
        rang1: const Color.fromARGB(206, 174, 23, 234),
        rang2: Colors.transparent),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: info_List.length,
        itemBuilder: (context, index) {
          return builder_items(info_List[index], colour[index % 4]);
        });
  }
}

// ignore: non_constant_identifier_names
Widget builder_items(Shop_models infoList, Colour_models colourModels) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.0.h),
    child: Container(
      width: 353.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.w),
        border: Border.all(width: 1, color: Colors.black26),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [colourModels.rang1, colourModels.rang2]),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Pul yuborish",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp),
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  infoList.name,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w800),
                )),
                SizedBox(
                  width: 20.w,
                ),
                IconButton(
                    onPressed: () {
                      FlutterPhoneDirectCaller.callNumber(infoList.number);
                    },
                    icon: Icon(
                      Icons.call,
                      size: 40.w,
                      color: Colors.black,
                    ))
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  "Yetkazib berish: ${infoList.delevering}",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp),
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                Text(
                  "Manzil: ${infoList.address}",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}
