import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PermissionCard extends StatelessWidget {
  final String title;
  final String numberOfAuthorizedAdmins;
  final VoidCallback onPressed;

  const PermissionCard({
    Key? key,
    required this.title,
    required this.numberOfAuthorizedAdmins,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 40.h,
          decoration: BoxDecoration(
            color: Color(0xffEEEAE4),
            border: Border.all(
              color: Color(0xFF85313C),
              width: 2.0, // You can adjust the border width as needed
            ),
            borderRadius:
                BorderRadius.circular(8.0), // Optional: adds rounded corners
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: onPressed,
                icon: Image.asset(
                  "assets/icons/return.png",
                ),
              ),
              Expanded(
                child: Text(
                  "$title ",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 50.w,
                height: 50.h,
                color: Color(0xFF85313C),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/person.png",
                      color: Colors.white,
                      scale: 3, // Specify the desired height
                      fit: BoxFit
                          .cover, // Ensure the image covers the area without stretching
                    ),
                    Text(
                      numberOfAuthorizedAdmins,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
