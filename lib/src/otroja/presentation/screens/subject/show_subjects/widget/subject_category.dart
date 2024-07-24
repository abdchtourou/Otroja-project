import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/colors.dart';
class SubjectCategory extends StatelessWidget {
  const SubjectCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 250.w,
      height: 50.h,
      child: Stack(
        children: [
          Positioned(
            bottom: 10.h,
            left: 0.w,
            child: Container(
                height: 35.h,
                width: 220.w,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(223, 245, 236, 224),
                     borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(50.0),
                  bottomLeft: Radius.circular(20.0),
                  topRight: Radius.circular(50.0),
                ),
                    border: Border.all(
                      color: const Color.fromARGB(223, 234, 226, 215),
                    )),
                child: Center(
                  child: RichText(
                      textAlign: TextAlign.right,
                      text: const TextSpan(children: [
                        TextSpan(
                          text: 'القسم :  ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'الفقه',
                          style: TextStyle(
                            fontSize: 20,
                            color: OtrojaColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ])),
                )),
          ),
          Positioned(
              right: 0.w,
              // top:1.h,

              child: Container(
                padding: const EdgeInsets.all(6),
                width: 45.w,
                height: 45.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: OtrojaColors.primaryColor),
                    shape: BoxShape.circle),
                child: Image.asset(
                  'assets/images/pattern (7) 24.png',
                  fit: BoxFit.contain,
                ),
              ))
        ],
      ),
    );
  }
}
