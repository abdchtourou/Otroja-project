import 'package:admins/src/otroja/cubit/students/check_student/check_student_state.dart';
import 'package:admins/src/otroja/presentation/screens/absence/studentsAbsence/checkStudentsScreen.dart';
import 'package:admins/src/otroja/presentation/screens/absence/teachersAbsence/widgets/teachers_absence_item.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/otroja_button.dart';
import 'package:admins/src/otroja/presentation/widgets/custumDropDown.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_drop_down.dart';
import 'package:admins/src/otroja/presentation/widgets/text%20field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../cubit/students/check_student/check_student_cubit.dart';
import '../../../widgets/add_user/custom_drop_down.dart';
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
      backgroundColor: const Color.fromARGB(255, 249, 245, 239),
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
                containerColor: const Color(0xffffffff),
                containerWidth: 340.w,
                borderThickness: 2,
                borderColor: const Color(0xffE6E6E6),
                imagePath: 'assets/icons/calendar.png',
                textDirection: TextDirection.rtl,
              ),
               Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: CustomDropdown(
                  list: ["دورة وزدناهم هدى", "دورة يشفعان"],
                  hint: "الدورة",
                  labelText: "اختر دورة", onChanged: (String? value) {  },

                ),
              ),
             BlocBuilder<CheckStudentCubit, CheckStudentState>(
               builder: (context, state) {
                if( state is CheckStudentLoaded){
                  return  Column(
                    children: [
                      const TeachersAbsenceTableTitle(),
                      Container(
                        height: 320.h,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 245, 236, 224),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListView.builder(

                          itemBuilder: (context, index) {

                            return TeachersAbsenceItem(
                              absence: attendanceStatus[index],
                              onTap: () {},
                              teachersName: "إسلام العيسى",
                              groupName: "الصحابة", index: index, isAbsence: state.isPresentList[index],
                            );
                          },

                          itemCount: state.isPresentList.length,
                        ),
                      ),
                    ],
                  );
                }else{
                  return Container();
                }

               },
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