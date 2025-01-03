import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityTitle extends StatelessWidget {
  String activityTitle;
  int activityOtroja;

  ActivityTitle({
    super.key,
    required this.activityTitle,
    required this.activityOtroja,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Color.fromARGB(223, 245, 236, 224),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            decoration: const BoxDecoration(
              color: Color(0xff85313C),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(9),
              ),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/lemon.png',
                  scale: 25,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  '$activityOtroja',
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontSize: 18.sp),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  activityTitle,
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
