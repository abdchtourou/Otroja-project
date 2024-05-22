import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtom extends StatelessWidget {
  CustomButtom({super.key, required this.title,this.onTap});
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return 
       GestureDetector(
        onTap: onTap ,
        child: Container(
          decoration: BoxDecoration(
            color:Color(0xFF85313C),
            borderRadius: BorderRadius.circular(15),
          ),
          width: double.infinity,
          height: 60,
          child: Center(
            child: Text(title,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white
          ),)
          ),
        ),
      )
    ;
  }
}
