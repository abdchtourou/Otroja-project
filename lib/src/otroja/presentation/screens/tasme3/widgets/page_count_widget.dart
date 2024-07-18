import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageCountWidget extends StatelessWidget {
  const PageCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
                  'عدد الصفحات ',
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 5),
                    Stack(
                      children: [
                        SizedBox(
                          width: 70.w,
                          height: 70.h,
                          child: Image.asset('assets/icons/islam1.png'),
                        ),
                        Positioned(
                          left: 20,
                          top: 22,
                          child: InkWell(
                            onTap: (){},
                            child: SizedBox(
                              width: 30.w,
                              height: 30.h,
                              child:
                                  Image.asset('assets/icons/minus-sign.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 5),
                    Stack(
                      children: [
                        SizedBox(
                          width: 200.w,
                          height: 100.h,
                          child: Image.asset('assets/icons/label.png'),
                        ),
                        Positioned(
                          left: 80,
                          top: 22,
                          child: SizedBox(
                            width: 50.w,
                            child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.sp,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 5),
                    Stack(
                      children: [
                        SizedBox(
                          width: 70.w,
                          height: 70.h,
                          child: Image.asset('assets/icons/islam1.png'),
                        ),
                        Positioned(
                          left: 20,
                          top: 22,
                          child: InkWell(
                            onTap: (){},
                            child: SizedBox(
                              width: 30.w,
                              height: 30.h,
                              child: Image.asset('assets/icons/plus(6).png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
      ],
    );
  }
}