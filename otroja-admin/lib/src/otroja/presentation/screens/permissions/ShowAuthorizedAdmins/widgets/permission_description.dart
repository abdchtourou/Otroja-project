import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PermissionDescription extends StatelessWidget {
  String? mainText;
  PermissionDescription({super.key, required this.mainText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      decoration: const BoxDecoration(
        color: Color(0xFF85313C),
        border: Border(
          bottom: BorderSide(
            width: 5,
          ),
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(
            25,
            25,
          ),
        ),
      ),
      child: Text(
        mainText!,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
