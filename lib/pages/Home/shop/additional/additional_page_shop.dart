import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Additional_page_shop extends StatelessWidget {
  Additional_page_shop(
      {super.key,
      required this.name,
      required this.number,
      required this.delevering,
      required this.address,
      required this.time,
      required this.count,
      required this.rate,
      required this.information,
      required this.image});
  String name;
  String number;
  String delevering;
  String address;
  DateTime time;
  int count;
  double rate;
  String information;
  String image;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          expandedHeight: 400,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(10.h),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70.w),
                  topRight: Radius.circular(70.w),
                ),
                color: const Color(0xFF8B0000),
              ),
              child: Column(
                children: [
                  SizedBox(height: 15.h),
                  Container(
                    width: 80,
                    height: 4,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              backgroundColor: const Color(0xFF8B0000),
              radius: 18,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
              height: 600,
              width: double.infinity,
              color: const Color(0xFF8B0000),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Padding(
                  padding:
                      EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
                  child: Column(children: [
                    Row(
                      children: [
                        Text(
                          "Mahsulot haqida ma'lumot:",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Inter",
                              fontSize: 18.sp),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            information,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "Yetkazib berish xizmati: $delevering",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Inter",
                              fontSize: 18.sp),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "Bizning manzilimiz:",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Inter",
                              fontSize: 18.sp),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            address,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffFDDADA)),
                        onPressed: () =>
                            FlutterPhoneDirectCaller.callNumber(number),
                        child: Text(
                          "Hoziroq bog'laning",
                          style: TextStyle(
                              color: const Color(0xFF8B0000),
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              fontSize: 14.sp),
                        ),
                      ),
                    ])
                  ]),
                ),
              )),
        )
      ],
    );

    // SafeArea(
    //   child: Padding(
    //     padding: EdgeInsets.only(top: 160.h),
    //     child: Container(
    //       height: 525.h,
    //       width: 375.w,
    //       decoration: BoxDecoration(
    //           color: const Color.fromARGB(255, 246, 227, 227),
    //           borderRadius: BorderRadius.only(
    //               topRight: Radius.circular(35.w),
    //               topLeft: Radius.circular(35.w))),
    //       child: Scaffold(
    //         backgroundColor: Colors.transparent,
    //         body: Stack(children: [
    //           Positioned(
    //               top: 0,
    //               child: Container(
    //                 width: 375.w,
    //                 height: 375.h,
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.only(
    //                         topRight: Radius.circular(21.w),
    //                         topLeft: Radius.circular(21.w)),
    //                     image: DecorationImage(
    //                         image: NetworkImage(image), fit: BoxFit.cover)),
    //               )),
    //           Positioned(
    //               top: 10.h,
    //               left: 5.w,
    //               child: CircleAvatar(
    //                 backgroundColor: Colors.white,
    //                 child: IconButton(
    //                   onPressed: () {
    //                     Navigator.pop(context);
    //                   },
    //                   icon: Icon(
    //                     Icons.close,
    //                     color: Colors.black,
    //                     size: 25.w,
    //                   ),
    //                 ),
    //               )),
    //           Positioned(
    //               left: 10.w,
    //               top: 380.h,
    //               child: Column(
    //                 children: [
    //                   Row(
    //                     children: [
    //                       Text(
    //                         "Mahsulot haqida ma'lumot:",
    //                         style: TextStyle(
    //                             color: Colors.black,
    //                             fontWeight: FontWeight.bold,
    //                             fontFamily: "Inter",
    //                             fontSize: 18.sp),
    //                       )
    //                     ],
    //                   )
    //                 ],
    //               )),
    //           Positioned(
    //               top: 405.h,
    //               left: 5.w,
    //               right: 5.w,
    //               child: Text(
    //                 "$information dwekdfbweh ekfdbewj jfwefbew eifweif we iewbfwe fiwewei fewi",
    //                 style: TextStyle(
    //                     color: Colors.black,
    //                     fontFamily: "Inter",
    //                     fontWeight: FontWeight.w400,
    //                     fontSize: 14.sp),
    //               )),
    //           Positioned(
    //               bottom: 10.h,
    //               right: 10.w,
    //               child: ElevatedButton(
    //                 style: ElevatedButton.styleFrom(
    //                     backgroundColor: const Color(0xFF8B0000)),
    //                 onPressed: () =>
    //                     FlutterPhoneDirectCaller.callNumber(number),
    //                 child: Text(
    //                   "Hoziroq bog'laning",
    //                   style: TextStyle(
    //                       color: Colors.white,
    //                       fontWeight: FontWeight.w500,
    //                       fontFamily: "Inter",
    //                       fontSize: 14.sp),
    //                 ),
    //               ))
    //         ]),
    //       ),
    //     ),
    //   ),
    // );
  }
}
