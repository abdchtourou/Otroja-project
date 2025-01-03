
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalPointsCircularProgressIndicator extends StatelessWidget {
  const TotalPointsCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 55.w,
          height: 53.h,
          child: CircularProgressIndicator(
            value: 80 / 100,
            strokeWidth: 6.sp,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF85313C)),
            strokeCap: StrokeCap.round
            
          ),
        ),
        Text(
          '80%',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
