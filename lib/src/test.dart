import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'otroja/core/helper/constant.dart';
import 'otroja/core/utils/constants/colors.dart';

class t extends StatelessWidget {
  const t({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300.w,
          height: 50.h,
          color: Colors.red,
          child: Stack(
            children: [
              Positioned(
                bottom: 10,
                left: 0,
                child: Container(
                  height: 40.h,
                  width: 247.w,
                  decoration: BoxDecoration(
                      color: OtrojaColors.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                      child: Text(
                    'الفقه الشافعي',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                ),
              ),
              Positioned(
                  right: 40.w,
                  // top:1.h,

                  child: Container(
                    padding: EdgeInsets.all(6),
                    width: 45.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: OtrojaColors.primaryColor),
                        shape: BoxShape.circle),
                    child: Image.asset('assets/images/pattern (7) 24.png',fit: BoxFit.contain,),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
