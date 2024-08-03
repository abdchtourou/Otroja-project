import 'dart:math';

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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../cubit/students/check_student/check_student_cubit.dart';
import '../../../../cubit/students/check_student/check_student_state.dart';
import '../../../../data/models/absence_model/get_groups.dart';
import '../../../widgets/add_user/custom_dialog.dart';
import '../../../widgets/add_user/custom_drop_down.dart';
import '../../../widgets/check_student/attendance_row_header.dart';
import '../teachersAbsence/widgets/absence_date_picker.dart';
import 'widget/drop_down_group.dart';

class CheckStudentScreen extends StatelessWidget {
  CheckStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CheckStudentCubit>();

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 249, 245, 239),
        appBar: OtrojaAppBar(
          mainText: "تفقد الطلاب ",
          secText:
              'حدد تاريخ اليوم والحلقة المرادة واضغك على انهاء \n  التفقد عند الانتهاء ',
        ),
        body: SingleChildScrollView(
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
              SizedBox(
                height: 10.h,
              ),
              BlocListener<CheckStudentCubit, CheckStudentState>(
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
                child: BlocBuilder<CheckStudentCubit, CheckStudentState>(
                  builder: (context, state) {
                    List<String> groupNames = [];
                    Map<String, int> groupsId = {};
                    cubit.groupsName.forEach(
                      (element) {
                        groupNames.add(element.name!);
                        groupsId[element.name!] = element.id!;
                      },
                    ); 
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: OtrojaDropdown(
                            list: groupNames,
                            labelText: 'الحلقة',
                            hint: 'اختر حلقة',
                            onChange: (value) {
                              cubit.idGroup = groupsId[value];

                              cubit.getStudents();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        AttendanceRowHeader(),
                        Container(
                            width: 340.w,
                            height: 300.h,
                            padding: const EdgeInsets.only(top: 7),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 245, 236, 224),
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.elliptical(
                                  10,
                                  10,
                                ),
                              ),
                            ),
                            child: BlocBuilder<CheckStudentCubit,
                                CheckStudentState>(
                              builder: (context, state) {
                                if (state is CheckStudentGroupLoaded ||
                                    state is CheckStudentLoaded) {
                                  return ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      height: 18.w,
                                    ),
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            textDirection: TextDirection.rtl,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 20, right: 5),
                                                child: Text(
                                                  cubit.studentsList[index]
                                                          .firstName ??
                                                      '',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15.sp,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30),
                                                    child: InkWell(
                                                      onTap: () {
                                                        cubit.togglePresence(
                                                            index, false);
                                                        cubit.addAbsence(
                                                            cubit
                                                                .studentsList[
                                                                    index]
                                                                .id as int,
                                                            false);
                                                      },
                                                      child: IsAbsence(
                                                        index: index,
                                                        isAbsence:
                                                            cubit.isPresentList[
                                                                index],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 30.w),
                                                    child: InkWell(
                                                      onTap: () {
                                                        cubit.togglePresence(
                                                            index, true);
                                                        cubit.addAbsence(
                                                            cubit
                                                                .studentsList[
                                                                    index]
                                                                .id as int,
                                                            true);
                                                      },
                                                      child: Checked(
                                                        index: index,
                                                        isExit:
                                                            cubit.isPresentList[
                                                                index],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          const Divider(
                                            color: Color.fromARGB(
                                                223, 234, 226, 215),
                                            thickness: 1,
                                            indent: 10,
                                            endIndent: 10,
                                          ),
                                        ],
                                      );
                                    },
                                    itemCount: cubit.studentsList.length,
                                  );
                                } else if (state is CheckStudentLoading) {
                                  return Center(
                                    child: OtrojaCircularProgressIndicator(),
                                  );
                                } else if (state is CheckStudentSend ||
                                    state is CheckStudentInitial) {
                                      return
                                  Container();
                                } else {
                                  return Text(' ');
                                }
                              },
                            )),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OtrojaButton(
                    text: 'إنهاء التفقد ',
                    onPressed: () {
                      if (cubit.validation()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'الرجاء تحديد تاريخ  و اسم الحلقة وتحديد حالة جميع الطلاب ')),
                        );
                        return;
                      }
                      // print(cubit.isAbsence.length);
                      // print(cubit.isPresentList.length);
                      cubit.post();
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
