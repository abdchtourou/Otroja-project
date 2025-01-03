import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StandardItem extends StatelessWidget {
  
  final String count;
  final String standard;

  const StandardItem({
    super.key,
    required this.count,
    required this.standard,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF85313C), width: 2.w),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                count,
                style: const TextStyle(
                fontWeight: FontWeight.w500 ,fontSize: 18),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(standard,
               style: const TextStyle(
                fontWeight: FontWeight.w500 ,fontSize: 18),)
            ],
          ),
        ),
      ),
    );
  }
}