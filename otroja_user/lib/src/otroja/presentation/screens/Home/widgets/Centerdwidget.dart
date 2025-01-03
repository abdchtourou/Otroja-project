import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';

class CenterWidget extends StatelessWidget {
  const CenterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(70),
      padding: EdgeInsets.all(70),
      width: 411.w,
      height: 418.h,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: OtrojaColors.primaryColor, width: 3.w)),
      child: Image.asset('assets/images/mandala.png'),
    );
  }
}
