import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Test extends StatelessWidget {
  final bool absence;
  final VoidCallback onTap;
  final String groupName;
  final String teachersName;

  Test({
    super.key,
    required this.absence,
    required this.onTap,
    required this.groupName,
    required this.teachersName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Color(0xff85313C),
          thickness: 1.5,
          indent: 0,
          endIndent: 0,
        ),
        Container(
          padding: EdgeInsets.only(bottom: 6), // Adjust padding if necessary
          decoration: BoxDecoration(
            color: Color(0xff85313C),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
          ),
          child: Center(
            child: Text(
              groupName,
              style: TextStyle(
                color: Color(0xffEFEBE6),
                fontStyle: FontStyle.normal,
                fontSize: 15,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 30, right: 25),
              child: GestureDetector(
                onTap: onTap,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xff85313C),
                      width: 2,
                    ),
                    color: absence ? Colors.red.withOpacity(0.2) : Colors.transparent,
                  ),
                  child: absence
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(),
                        ),
                ),
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color(0xff85313C),
                    width: 2,
                  ),
                  color: !absence ? Colors.green.withOpacity(0.2) : Colors.transparent,
                ),
                child: !absence
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(),
                      ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    teachersName,
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
