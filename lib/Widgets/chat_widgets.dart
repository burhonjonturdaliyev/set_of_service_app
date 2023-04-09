import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types, must_be_immutable
class Container_design extends StatefulWidget {
  List textlist;

  Container_design({
    super.key,
    required this.textlist,
  });

  @override
  State<Container_design> createState() => _Container_designState();
}

// ignore: camel_case_types
class _Container_designState extends State<Container_design> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  @override
  void didUpdateWidget(covariant Container_design oldWidget) {
    super.didUpdateWidget(oldWidget);
    _scrollToBottom();
  }

  void _scrollToBottom() {
    if (_controller.hasClients) {
      _controller.animateTo(
        _controller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controller,
      itemCount: widget.textlist.length,
      itemBuilder: (context, index) {
        return SizedBox(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: widget.textlist[index].id
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  InkWell(
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: ((context) => AlertDialog(
                              backgroundColor: const Color(0xffFDDADA),
                              content: SizedBox(
                                height: 90.h,
                                width: 130.w,
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Ushbu xabarni o'chirishni xoxlaysizmi?",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              fontFamily: "Inter"),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              widget.textlist.removeAt(index);
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Ha",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.sp),
                                          )),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.green),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Yo'q",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.sp),
                                          ))
                                    ],
                                  )
                                ]),
                              ),
                            )),
                      );
                    },
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 250.w),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white,
                                Colors.red,
                              ]),
                          borderRadius: BorderRadius.circular(24.w),
                          border: Border.all(width: 1, color: Colors.black26)),
                      margin: EdgeInsets.only(
                          left: 18.w, right: 18.w, top: 10.h, bottom: 10.h),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.textlist[index].text,
                          // textWidthBasis: TextWidthBasis.longestLine,

                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: widget.textlist[index].id
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 18.w,
                      right: 18.w,
                    ),
                    child: Text(
                      DateFormat("dd-MMMM, kk:mm")
                          .format(widget.textlist[index].time),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 8.sp),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
