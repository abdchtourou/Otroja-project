import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final double textSize; // New parameter for text size
  final VoidCallback? onPressed; // Callback for button press

  const HomePageButton({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    this.textSize = 15.0, // Default value for text size
    this.onPressed, // Add onPressed to the constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed, // Handle the tap with the passed callback
      borderRadius: BorderRadius.circular(10.0), // Add border radius for ripple effect
      child: Container(
        width: width, // Use passed width
        height: height, // Use passed height
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/homepagebutton.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10.0), // Ensure the border radius matches InkWell
        ),
        child: Center(
          child: Text(
            text, // Use passed text
            style: TextStyle(
              color: Colors.black,
              fontSize: textSize.sp, // Use passed text size with ScreenUtil for responsiveness
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
