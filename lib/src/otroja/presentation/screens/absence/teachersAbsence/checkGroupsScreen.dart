
import 'package:admins/src/otroja/presentation/screens/absence/teachersAbsence/widgets/teachers_absence_item.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/otroja_button.dart';
import 'package:admins/src/otroja/presentation/widgets/custumDropDown.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_drop_down.dart';
import 'package:admins/src/otroja/presentation/widgets/text%20field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/karamDatePicker.dart';
import 'widgets/absence_date_picker.dart';
import 'widgets/teachers_absence_table_title.dart';



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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AbsenceDatePicker(
                labelText: 'اختر تاريخ',
                containerColor: Color(0xffffffff),
                containerWidth: 340.w,
                borderThickness: 2,
                borderColor: Color(0xffE6E6E6),
                imagePath: 'assets/icons/calendar.png',
                textDirection: TextDirection.rtl,
              ),
            SizedBox(
              height: 10.h,
            ),
           OtrojaDropdown(list: list, labelText: labelText, hint: hint),
            SizedBox(
              height: 20.h,
            ),
            Column(
              children: [
                Column(
                  children: [
                    const TeachersAbsenceTableTitle(),
                    Container(
                      width: 340.w,
                      height: 300.h,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 245, 236, 224),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return TeachersAbsenceItem(absence: attendanceStatus[index], onTap: (){}) ;
                        },
                        itemCount: attendanceStatus.length,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                OtrojaButton(text: 'إنهاء التفقد', onPressed: (){}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
