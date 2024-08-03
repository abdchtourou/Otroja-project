import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/core/routing/routes.dart';
import 'package:admins/src/otroja/cubit/course/course_cubit.dart';
import 'package:admins/src/otroja/cubit/staff/staff_cubit.dart';
import 'package:admins/src/otroja/cubit/students/show_student_cubit/show_students_cubit.dart';
import 'package:admins/src/otroja/cubit/students/show_student_cubit/show_students_state.dart';
import 'package:admins/src/otroja/data/models/group_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/add_button.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/view_button.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_drop_down.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/otroja_button.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_text_field.dart';
import 'package:admins/src/otroja/data/models/staff_model.dart';

import '../../../../cubit/groups/group_cubit.dart';
import '../../../widgets/otroja_seccuss_dialog.dart';

class AddGroup extends StatelessWidget {
  AddGroup({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 245, 239),
      appBar: OtrojaAppBar(
        mainText: "إنشاء حلقة",
        secText: "املأ الحقول الموجودة في الأسفل ثم اضغط على زر إنشاء حلقة",
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  children: [
                    // GroupNumberWidget(groupNumber: 2),
                    //SizedBox(height: 20.h),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          BlocBuilder<GroupCubit, GroupState>(
                            builder: (context, state) {
                              final cubit = context.read<GroupCubit>();
                              return OtrojaTextFormField(
                                label: "اسم الحلقة",
                                onChange: (data) {
                                  cubit.groupName = data;
                                },
                                hintText: "اسم الحلقة",
                              );
                            },
                          ),
                          SizedBox(height: 20.h),
                          BlocConsumer<StaffCubit, StaffState>(
                            listener: (context, state) {
                              if (state is StaffError) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "Error loading teachers: ${state.message}")),
                                );
                              }
                            },
                            builder: (context, state) {
                              List<Staff> teachersList = [];

                              if (state is StaffLoaded) {
                                teachersList = state.staffList;
                              }
                              return BlocBuilder<GroupCubit, GroupState>(
                                builder: (context, groupState) {
                                  final cubit = context.read<GroupCubit>();
                                  return OtrojaDropdown(
                                    labelText: "الأستاذ",
                                    hint: "اختر الأستاذ",
                                    value: cubit.selectedTeacher != null
                                        ? "${cubit.selectedTeacher!.firstName} ${cubit.selectedTeacher!.lastName}"
                                        : null,
                                    list: teachersList
                                        .map((teacher) =>
                                            "${teacher.firstName} ${teacher.lastName}")
                                        .toList(),
                                    onChange: (value) {
                                      cubit.selectedTeacher =
                                          teachersList.firstWhere(
                                        (teacher) =>
                                            "${teacher.firstName} ${teacher.lastName}" ==
                                            value,
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                          SizedBox(height: 20.h),
                          BlocConsumer<CourseCubit, CourseState>(
                            listener: (context, state) {
                              if (state is CourseError) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "Error loading courses: ${state.message}")),
                                );
                              }
                            },
                            builder: (context, state) {
                              List<String> courseLevelList = [];
                              Map<String, int> courseLevelMap =
                                  {}; // To store course-level name and ID mapping

                              if (state is CoursesLoaded) {
                                state.courses.forEach((course) {
                                  course.levels.forEach((level) {
                                    String courseLevelName =
                                        "${course.name} - ${level.name}";
                                    courseLevelList.add(courseLevelName);
                                    courseLevelMap[courseLevelName] =
                                        level.pivot!.id;
                                  });
                                });
                              }

                              return BlocBuilder<GroupCubit, GroupState>(
                                builder: (context, groupState) {
                                  final cubit = context.read<GroupCubit>();
                                  return OtrojaDropdown(
                                    labelText: "الدورة",
                                    hint: "الدورة",
                                    list: courseLevelList,
                                    onChange: (value) {
                                      cubit.selectedCourseName = value;
                                      cubit.selectedCourseLevelId =
                                          courseLevelMap[value];
                                    },
                                    value: cubit.selectedCourseName,
                                  );
                                },
                              );
                            },
                          ),
                          SizedBox(height: 45.h),
                          Center(
                            child: AddButton(
                              onTap: () {
                                context.pushNamed(Routes.addStudentToGroup);
                              },
                              icon: AssetImage('assets/icons/student.png'),
                              backgroundColor: const Color(0xffEEEAE4),
                              text: "إضافة طلاب للحلقة",
                              textColor: const Color(0xFF85313C),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          BlocConsumer<GroupCubit, GroupState>(
                              listener: (context, state) {
                            if (state is GroupCreated) {
                              showDialog(
                                context: context,
                                builder: (context) => OtrojaSuccessDialog(
                                  text: "!تم إضافة الحلقة بنجاح",
                                ),
                              ).then((_) {
                                context
                                    .read<ShowStudentsCubit>()
                                    .selectedStudents = [];
                                formKey.currentState?.reset();
                                context.read<GroupCubit>().resetState();
                              });
                            }
                          }, builder: (context, state) {
                            return OtrojaButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  final groupCubit = context.read<GroupCubit>();
                                  final studentCubit =
                                      context.read<ShowStudentsCubit>();
                                  groupCubit.createGroupWithStudents(Group(
                                      staffId: groupCubit.selectedTeacher!.id,
                                      courseLevelId:
                                          groupCubit.selectedCourseLevelId!,
                                      name: groupCubit.groupName!,
                                      studentIds:
                                          studentCubit.selectedStudents));

                
                                  print("tap");
                                  // print(groupCubit.groupName);
                                  // print(
                                  //     groupCubit.selectedTeacher!.firstName);
                                  // print(groupCubit.selectedCourseLevelId);
                                  // print(studentCubit.selectedStudents.length);
                                }
                              },
                              text: 'إنشاء حلقة',
                            );
                          })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
