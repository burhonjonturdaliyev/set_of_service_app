import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:set_of_service_app/models/colour_model.dart';
import 'package:set_of_service_app/models/house_model.dart';

class House_widget extends StatelessWidget {
  House_widget({super.key, required this.models});
  List<house_models> models;
  List<Colour_models> colour = [
    Colour_models(
        rang2: const Color.fromARGB(255, 255, 0, 0),
        rang1: const Color.fromARGB(255, 255, 255, 255)),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: models.length,
      itemBuilder: (context, index) =>
          house_items(models[index], colour[index % colour.length]),
    );
  }
}

Widget house_items(house_models models, Colour_models colourModels) {
  return Padding(
    padding: EdgeInsets.only(top: 5.h, bottom: 5.0.h),
    child: Container(
      width: 353.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(33.w),
        border: Border.all(width: 1, color: Colors.black26),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [colourModels.rang1, colourModels.rang2]),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.w, top: 10.h),
            child: Row(
              children: [
                Text(
                  models.turi,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  models.name,
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
                      FlutterPhoneDirectCaller.callNumber(models.phone_number);
                    },
                    icon: Icon(
                      Icons.call,
                      size: 40.w,
                      color: Colors.black,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              children: [
                Text(
                  "Xizmat haqqi: ${models.tolov}",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              children: [
                Text(
                  "Manzil: ${models.address}",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp),
                )
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 7.w, bottom: 5.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  size: 8.w,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  DateFormat("dd.MM.yyyy").format(DateTime.now()),
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 8.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Icon(
                  Icons.visibility,
                  size: 12.w,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  "1234",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 8.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Icon(
                  Icons.star_rate_rounded,
                  size: 12.w,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  "4.5",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 8.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
