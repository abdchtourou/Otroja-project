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
import 'widgets/ttt.dart';
class CheckGroupsScreen extends StatelessWidget {
  CheckGroupsScreen({super.key});

  List<bool> attendanceStatus = [false, false, false, true, true, false, false, true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 245, 239),
      appBar: OtrojaAppBar(
        mainText: "تفقد الحلقات",
        secText:
            'حدد تاريخ اليوم الدورة المرادة واضغك على انهاء \n  التفقد عند الانتهاء ',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: OtrojaDropdown(
                  list: ["دورة وزدناهم هدى", "دورة يشفعان"],
                  hint: "الدورة",
                  labelText: "اختر دورة",
                ),
              ),
              Column(
                children: [
                  const TeachersAbsenceTableTitle(),
                  Container(
                    height: 280.h,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 245, 236, 224),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true, // Add this line to avoid unbounded height error
                      itemBuilder: (context, index) {
                        return TeachersAbsenceItem(
                          absence: attendanceStatus[index],
                          onTap: () {},
                          teachersName: "إسلام العيسى",
                          groupName: "الصحابة",
                        );
                      },
                      itemCount: attendanceStatus.length,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: OtrojaButton(text: 'إنهاء التفقد', onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}