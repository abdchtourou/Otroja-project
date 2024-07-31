import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helper/constant.dart';

class MyDialog extends StatelessWidget {
  MyDialog({this.text});


  String? text;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         AlertDialog(
          content: SizedBox(
            height: 230,
            child: Column(
              children: [
               Image.asset('assets/images/clock 1.png'),
                Text(
                 text ?? 'تمت إضافة الطالب بنجاح',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 226.h,
            right: 57.w,
            child:
            Container(
              height: 60,
              width: 281,
              decoration:  const BoxDecoration(
                  color: OtrojaColors.primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.elliptical(30, 30),
                      bottomLeft: Radius.elliptical(30, 30))),
              child: Center(
                child: TextButton(onPressed: (){
                  context.pop();
                },child: const Text("عودة",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.white
                  ),),),
              ),
            ),

        )
      ],
    );
  }

}
