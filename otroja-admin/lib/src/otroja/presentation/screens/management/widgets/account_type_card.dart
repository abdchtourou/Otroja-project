import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountTypeCard extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const AccountTypeCard({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 50.h,
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
                  scale: 20,
                ),
              ),
              Spacer(flex: 1,),
              Padding(
                padding: const EdgeInsets.only(right:  8.0),
                child: Text(
                  "$title ",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
