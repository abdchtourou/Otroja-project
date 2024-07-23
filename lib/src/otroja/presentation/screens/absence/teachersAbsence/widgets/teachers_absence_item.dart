import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeachersAbsenceItem extends StatelessWidget {
  bool absence;
  VoidCallback onTap;
  String groupName;
  String teachersName;

  TeachersAbsenceItem(
      {super.key,
      required this.absence,
      required this.onTap,
      required this.groupName,
      required this.teachersName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 75,
      child: Stack(
        children: [
          Positioned(
            left: 172,
            child: Container(
              padding: EdgeInsets.only(bottom: 6),
              width: 170,
              height: 30,
              decoration: BoxDecoration(
                color: Color(0xff85313C),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(10)),
              ),
              child: Center(
                child: Text(
                  groupName,
                  style: TextStyle(
                      color: Color(0xffEFEBE6),
                      fontStyle: FontStyle.normal,
                      fontSize: 15),
                ),
              ),
            ),
          ),
          Positioned(
            child: SizedBox(
              width: 342,
              height: 0,
              child: Divider(
                color: Color(0xff85313C),
                thickness: 1.5,
                indent: 0,
                endIndent: 0,
              ),
            ),
          ),
          SizedBox(
            width: 340,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, right: 7.5),
                  child: Text(
                    teachersName,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 115,left: 15),
                  child: GestureDetector(
                    onTap: onTap,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xff85313C),
                          width: 2,
                        ),
                        color: absence == false
                            ? Colors.green.withOpacity(0.2)
                            : Colors.transparent,
                      ),
                      child: absence == false
                          ? Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                          : Container(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: GestureDetector(
                    onTap: onTap,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xff85313C),
                          width: 2,
                        ),
                        color: absence == true
                            ? Colors.red.withOpacity(0.2)
                            : Colors.transparent,
                      ),
                      child: absence == true
                          ? Icon(
                              Icons.close,
                              color: Colors.red,
                            )
                          : Container(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
