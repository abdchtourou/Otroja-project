import 'package:admins/src/otroja/cubit/absecne_staff/absence_staff_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/add_user/custom_dialog.dart';
import '../../../widgets/otroja_app_bar.dart';
import '../../../widgets/buttons/otroja_button.dart';
import 'widgets/absence_date_picker.dart';
import 'widgets/drop_down_course.dart';
import 'widgets/teachers_absence_table_title.dart';
import 'widgets/teachers_absence_item.dart';

class CheckGroupsScreen extends StatelessWidget {
  CheckGroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AbsenceStaffCubit>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 245, 239),
      appBar: OtrojaAppBar(
        mainText: "تفقد الحلقات",
        secText: 'حدد تاريخ اليوم الدورة المرادة واضغك على انهاء \n  التفقد عند الانتهاء ',
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
                selectedDate: cubit.dateTime,
              ),
              BlocConsumer<AbsenceStaffCubit, AbsenceStaffState>(
                listener: (context, state) {
                  if (state is AbsenceStaffSend) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => MyDialog(
                        text: "تم التفقد بنجاح",
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      if (state is AbsenceStaffLoadingCourses)
                        CircularProgressIndicator()
                      else
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: DropDownCourse(
                            list: cubit.listCourses,
                            labelText: 'الدورة المرادة',
                            hint:cubit.listCourses[0].name ,
                            onChanged: (value) {
                              cubit.idCourse = value!.id;
                              cubit.getGroupByCourseLevel();
                            },
                          ),
                        ),
                      if (state is AbsenceStaffLoadingGroups)
                        CircularProgressIndicator()
                      else if (state is AbsenceStaffGroupsLoaded)
                        Column(
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
                                  final list = state.listGroups[index];
                                  return TeachersAbsenceItem(
                                    onTap: () {},
                                    teachersName: list.staffName!,
                                    groupName: list.name,
                                    index: index,
                                    isAbsence: cubit.isPresentList[index],
                                  );
                                },
                                itemCount: state.listGroups.length,
                              ),
                            ),
                          ],
                        ),
                    ],
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 10),
                child: OtrojaButton(
                  text: 'إنهاء التفقد',
                  onPressed: () {
                    cubit.postAbsenceData();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
