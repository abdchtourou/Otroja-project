import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarButton extends StatelessWidget {
  final String iconPath;
  final double? size;

  const AppBarButton({
    super.key,
    required this.iconPath,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (size ?? 60).w, // Responsive width
      height: (size ?? 55).h, // Responsive height
      decoration: BoxDecoration(
        color: const Color(0xaaEEE9E7),
        borderRadius: BorderRadius.circular(17.r), // Responsive radius
        border: Border.all(
          color: OtrojaColors.primaryColor,
          width: 1.7.w, // Responsive border width
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w), // Responsive padding
        child: Image.asset(
          iconPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
