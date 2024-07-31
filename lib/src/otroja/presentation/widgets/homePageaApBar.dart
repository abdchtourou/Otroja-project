import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:admins/src/otroja/presentation/Home/widgets/appBarButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? optionalWidget;
  final String? mainText;
  final String? secText;

  HomePageAppBar({
    super.key,
    this.optionalWidget,
    required this.mainText,
    this.secText,
  });

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive sizing
    ScreenUtil.init(context);

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 115.h, // Responsive height
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: const Color(0xFF85313C),
                width: 5.w, // Responsive border width
              ),
            ),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(
                15.w, // Responsive radius
                15.h, // Responsive radius
              ),
            ),
            image: const DecorationImage(
              image: AssetImage('assets/images/appBarBackground.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 100.h, // Responsive height
          decoration: BoxDecoration(
            color: const Color.fromARGB(100, 245, 243, 239),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(
                10.w, // Responsive radius
                15.h, // Responsive radius
              ),
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(top: 40.h,left: 10.w),
          child: Row(
            children: [
              
              AppBarButton(
                iconPath: 'assets/icons/notification.png',
              ),
              SizedBox(width: 5.w),
              AppBarButton(
                iconPath: 'assets/icons/comment.png',
              ),
              SizedBox(width: 35.w),
              if (optionalWidget != null)
                Padding(
                  padding: EdgeInsets.only(right: 10.w), // Responsive padding
                  child: optionalWidget!,
                )
              else
                SizedBox(
                  width: 40.w, // Responsive width
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(110.h); // Responsive app bar height
}
