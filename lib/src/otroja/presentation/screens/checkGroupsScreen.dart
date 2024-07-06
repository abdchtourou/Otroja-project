
import 'package:admins/src/otroja/presentation/widgets/custumDropDown.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/text%20field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CheckGroupsScreen extends StatefulWidget {
  const CheckGroupsScreen({super.key});

  @override
  _CheckGroupsScreenState createState() => _CheckGroupsScreenState();
}

class _CheckGroupsScreenState extends State<CheckGroupsScreen> {
  List<bool> attendanceStatus = [false, false, false, true, true];

  void updateAttendanceStatus(int index, bool isPresent) {
    setState(() {
      attendanceStatus[index] = isPresent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 245, 239),
      appBar: OtrojaAppBar(
        mainText: "تفقد الحلقات",
        secText:
        'حدد تاريخ اليوم والحلقة المرادة واضغك على انهاء \n  التفقد عند الانتهاء ',
        optionalWidget: SizedBox(
          width: 35.w,
          height: 35.h,
          child: Image.asset('assets/icons/add.png'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PlatyTextField(
                hintText: "حدد التاريخ",
                labelText: 'اختر تاريخ',
                containerColor: Color(0xffffff),
                containerWidth: 350.w,
                borderThickness: 2,
                borderColor: Color(0xffE6E6E6),
                imagePath: 'assets/icons/calendar.png',
                textDirection: TextDirection.rtl),
            SizedBox(
              height: 10.h,
            ),
            CustomDropDown(),
            SizedBox(
              height: 20.h,
            ),
            Column(
              children: [
                Column(
                  children: [
                    Container(
                      width: 340.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Color.fromARGB(223, 239, 227, 211),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        textDirection: TextDirection.rtl,
                        children: [
                          Text(
                            'اسم الحلقة  ',
                            style: TextStyle(
                                color: Color(0xff85313C),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            ' وأستاذها',
                            style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp),
                          ),
                          SizedBox(
                            width: 50.w,
                          ),
                          Text(
                            'حاضر',
                            style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp),
                          ),
                          SizedBox(
                            width: 40.w,
                          ),
                          Text(
                            'غائب',
                            style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 340.w,
                      height: 300.h,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 245, 236, 224),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
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
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10)),
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
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        textDirection: TextDirection.rtl,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, right: 7.5),
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
                                            padding: const EdgeInsets.only(
                                                bottom: 0, right: 58),
                                            child: GestureDetector(
                                              onTap: () {
                                                updateAttendanceStatus(index, true);
                                              },
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
                                                  color: attendanceStatus[index] == true
                                                      ? Colors.green.withOpacity(0.2)
                                                      : Colors.transparent,
                                                ),
                                                child: attendanceStatus[index] == true
                                                    ? Icon(
                                                  Icons.check,
                                                  color: Colors.green,
                                                )
                                                    : Container(),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 0, right: 35),
                                            child: GestureDetector(
                                              onTap: () {
                                                updateAttendanceStatus(index, false);
                                              },
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
                                                  color: attendanceStatus[index] == false
                                                      ? Colors.red.withOpacity(0.2)
                                                      : Colors.transparent,
                                                ),
                                                child: attendanceStatus[index] == false
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
                        },
                        itemCount: attendanceStatus.length,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 6),
                  width: 320,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xff85313C),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'إنهاء التفقد',
                      style: TextStyle(
                          color: Color(0xffEFEBE6),
                          fontStyle: FontStyle.normal,
                          fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
