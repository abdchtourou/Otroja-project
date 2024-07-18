import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeachersAbsenceItem extends StatelessWidget {
  bool absence;
  VoidCallback onTap;

  TeachersAbsenceItem({super.key, required this.absence, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 75,
      child: Stack(
        children: [
          Positioned(
            left: 170,
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
                  'أبو بكر الصديق',
                  style: TextStyle(
                      color: Color(0xffEFEBE6),
                      fontStyle: FontStyle.normal,
                      fontSize: 15),
                ),
              ),
            ),
          ),
          Stack(
            children: [
              Positioned(
                child: SizedBox(
                  width: 340,
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
                        'يعقوب قمر الدين دبيازة',
                        style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0, right: 58),
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
                      padding: const EdgeInsets.only(bottom: 0, right: 35),
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
        ],
      ),
    );
  }
}
