import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// Import your project-specific packages

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/constant.dart';

class NewsItem extends StatelessWidget {
  final String? newsTitle;
  final String imageUrl;

  const NewsItem({
    Key? key,
    this.newsTitle,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool test= imageUrl =="assets/images/IMG-20170511-WA0050 1.png" ;
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate the width dynamically, ensuring it fits well on various screen sizes.
        double width =
            constraints.maxWidth * 0.9; // Adjust this factor as needed
        double maxWidth = 250.0; // Maximum width constraint
        double minWidth = 200.0; // Minimum width constraint

        // Determine the actual width within the specified constraints.
        double actualWidth = width.clamp(minWidth, maxWidth);

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.r, vertical: 8.0.r),
          child: Row(
            children: [
              Container(
                width: actualWidth,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: OtrojaColors.primaryColor,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: Text(
                        newsTitle!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow:
                        TextOverflow.ellipsis, // Ensure text fits well
                        textAlign:
                        TextAlign.center, // Center align the text
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: actualWidth * 0.9,
                        margin: EdgeInsets.all(8.0.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0.r),
                          image:  DecorationImage(
                            image: !test
                                ? NetworkImage('http://$ip:8000/storage/$imageUrl')
                                : const AssetImage("assets/images/IMG-20170511-WA0050 1.png") as ImageProvider,
                            fit: BoxFit.cover,
                          ),

                        ),
                        padding: EdgeInsets.all(16.0.r),
                      ),


                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
