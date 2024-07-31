import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  final String title;

  const CategoryCard({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: OtrojaColors.primaryColor,
          border: Border.all(
            color: OtrojaColors.primaryColor,
            width: 2.0, // You can adjust the border width as needed
          ),
          borderRadius:
              BorderRadius.circular(8.0), // Optional: adds rounded corners
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 1,),
            Padding(
              padding: const EdgeInsets.only(right:  8.0),
              child: Text(
                "$title ",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
