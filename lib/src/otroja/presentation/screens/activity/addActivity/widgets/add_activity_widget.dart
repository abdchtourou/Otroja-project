import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddOtrojaWidget extends StatelessWidget {
  const AddOtrojaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340.w,
      height: 250.h,
      child: Stack(
        children: [
              
          Positioned(
            left:70,
            child: Container(
              width: 200.w,
              height: 180.h,
              child: Image.asset('assets/icons/rub-el-hizb.png'),
            ),
          ),
          Positioned(
            left: 70.w,
            top: -10.h,
            child: Transform.rotate(
              angle: 3.14 / 4,
              child: Container(
                margin: EdgeInsets.only(left: 72, top: 32.5),
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Color.fromARGB(255, 245, 236, 224),
                  border: Border.all(width: 4, color: Color(0xff85313C)),
                ),
              ),
            ),
          ),
          Positioned(
            left: 74.w,
            child: Transform.rotate(
              angle: 3.14 / 4,
              child: Container(
                margin: EdgeInsets.only(left: 130, top: 90),
                padding: EdgeInsets.only(left: 15, bottom: 0),
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Color(0xff85313C),
                ),
                child: Transform.rotate(
                  angle: -3.14 / 4,
                ),
              ),
            ),
          ),
          Positioned(
            left: 152.w,
            top: 55.h,
            child: SizedBox(
              width: 50.w,
              height: 50.h,
              child: Image.asset('assets/icons/lemon.png'),
            ),
          ),
          Positioned(
            left: 163.w,
            top: 121.h,
            child: Text(
              '5',
              style: TextStyle(
                  fontSize: 22.5,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffEEEAE4)),
            ),
          ),
          Positioned(
            top: 120,
            child: Row(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 125.w,
                      height: 125.h,
                      child: Image.asset('assets/icons/islam.png'),
                    ),
                    Positioned(
                      left: 47,
                      top: 50,
                      child: InkWell(
                        onTap: (){},
                        child: SizedBox(
                          width: 30.w,
                          height: 30.h,
                          child: Image.asset('assets/icons/minus-sign.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 90,),
                Stack(
                  children: [
                    SizedBox(
                      width: 125.w,
                      height: 125.h,
                      child: Image.asset('assets/icons/islam.png'),
                    ),
                    Positioned(
                      left: 47,
                      top: 50,
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
            ),
          )
              
        ],
      ),
    );
  }
}
