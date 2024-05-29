import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtrojaAppBar extends StatelessWidget {
  final String mainText;
  final String secText;

  // Constructor
  const OtrojaAppBar({super.key, required this.mainText, required this.secText});

  @override
  Widget build(BuildContext context) {
    return Stack(
  children: [
    Container(
      width: double.infinity,
      height: 113.sp,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFF85313C),
            width: 5,
          ),
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(
            25,
            25,
          ),
        ),
        image: DecorationImage(
          image: AssetImage('assets/images/appBarBackground.png'),
          fit: BoxFit.cover,
        ),
      ),
    ),
    Container(
      width: double.infinity,
      height: 100.sp,
      decoration: const BoxDecoration(
        color:Color.fromARGB(100, 245, 243, 239),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(
            25,
            25,
          ),
        ),
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          SizedBox(
            height:40.sp,
          ),
          Text(
            mainText,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10), // Optional spacing between texts
          Text(
            secText,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Color.fromARGB(255, 119, 119, 119)),
          ),
        ],
      ),
    ),
  ],
)
;
  }
}