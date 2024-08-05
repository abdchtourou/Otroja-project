import 'package:admins/src/otroja/presentation/widgets/show_students_widget/no_students.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:admins/src/otroja/data/models/student_model/show_students.dart';
import 'package:admins/src/otroja/presentation/screens/absence/studentsAbsence/widget/checked.dart';
import 'package:admins/src/otroja/presentation/screens/absence/studentsAbsence/widget/is_absence.dart';
import 'package:admins/src/otroja/presentation/widgets/OtrojaDatePicker.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/otroja_button.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_circular_progress_indicator.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_drop_down.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_seccuss_dialog.dart';
import 'package:admins/src/otroja/presentation/widgets/text%20field.dart';
import 'package:admins/src/otroja/cubit/students/check_student/check_student_cubit.dart';
import 'package:admins/src/otroja/cubit/students/check_student/check_student_state.dart';
import 'package:admins/src/otroja/presentation/screens/absence/teachersAbsence/widgets/absence_date_picker.dart';
import 'package:admins/src/otroja/presentation/screens/absence/studentsAbsence/widget/drop_down_group.dart';

import '../../../widgets/check_student/attendance_row_header.dart';

class CheckStudentScreen extends StatelessWidget {
  CheckStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 245, 239),
      appBar: OtrojaAppBar(
        mainText: "تفقد الطلاب ",
        secText:
        'حدد تاريخ اليوم والحلقة المرادة واضغك على انهاء \n  التفقد عند الانتهاء ',
      ),
      body: BlocConsumer<CheckStudentCubit, CheckStudentState>(
        listener: (context, state) {
          if (state is CheckStudentSend) {
            showDialog(
              context: context,
              builder: (BuildContext context) => OtrojaSuccessDialog(
                text: "تم التفقد بنجاح",
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<CheckStudentCubit>();
          List<String> groupNames = [];
          Map<String, int> groupsId = {};

          for (var element in cubit.groupsName) {
            groupNames.add(element.name!);
            groupsId[element.name!] = element.id!;
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                OtrojaDatePickerWidget(
                  labelText: 'التاريخ',
                  hintText: 'ادخل تاريخ التفقد',
                  containerColor: const Color(0xffffffff),
                  containerWidth: 340.w,
                  borderThickness: 2,
                  borderColor: const Color(0xffE6E6E6),
                  imagePath: 'assets/icons/calendar.png',
                  textDirection: TextDirection.rtl,
                  onDateSelected: (picked) {
                    String formattedDate =
                        "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
                    cubit.dateTime = formattedDate;
                  },
                ),
                SizedBox(height: 10.h),
                if (state is CheckStudentLoadingGroup)
                  const CircularProgressIndicator()
                else
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8.0),
                    child: OtrojaDropdown(
                      list: groupNames,
                      labelText: 'الحلقة',
                      hint: groupNames[0],
                      onChange: (value) {
                        cubit.idGroup = groupsId[value];

                        cubit.getStudents();
                      },
                    ),
                  ),
                if (state is CheckStudentLoading)
                  const CircularProgressIndicator()
                else if (state is CheckStudentLoaded)
                  Column(
                    children: [
                      SizedBox(height: 20.h),
                      const AttendanceRowHeader(),
                      Container(
                        width: 340.w,
                        height: 300.h,
                        padding: const EdgeInsets.only(top: 7),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 245, 236, 224),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.elliptical(10, 10),
                          ),
                        ),
                        child:state.studentsList.isNotEmpty?
                        ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(height: 18.w),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 20, right: 5),
                                        child: Text(
                                          cubit.studentsList[index].firstName ?? '',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp,

                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 30),
                                          child: InkWell(
                                            onTap: () {
                                              cubit.togglePresence(index, false);
                                              cubit.addAbsence(
                                                  cubit.studentsList[index].id as int, false);
                                            },
                                            child: IsAbsence(
                                              index: index,
                                              isAbsence: cubit.isPresentList[index],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 30.w),
                                          child: InkWell(
                                            onTap: () {
                                              cubit.togglePresence(index, true);
                                              cubit.addAbsence(
                                                  cubit.studentsList[index].id as int, true);
                                            },
                                            child: Checked(
                                              index: index,
                                              isExit: cubit.isPresentList[index],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Color.fromARGB(223, 234, 226, 215),
                                  thickness: 1,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                              ],
                            );
                          },
                          itemCount: cubit.studentsList.length,
                        ):
                            const NoStudents()
                      ),
                    ],
                  ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OtrojaButton(
                    text: 'إنهاء التفقد ',
                    onPressed: () {
                      if (cubit.validation()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'الرجاء تحديد تاريخ و اسم الحلقة وتحديد حالة جميع الطلاب '),
                          ),
                        );
                        return;
                      }else{
                        cubit.post();

                      }
                    },
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}
