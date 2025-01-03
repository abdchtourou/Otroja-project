import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_seccuss_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:admins/src/otroja/presentation/screens/Exams/qustion/widgets/enhanced_circular_indicator.dart';
import 'package:admins/src/otroja/presentation/screens/Exams/qustion/widgets/CustomRoundedButton.dart';
import 'package:admins/src/otroja/presentation/widgets/OtrojaDatePicker.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_text_field.dart';
import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:admins/src/otroja/core/routing/routes.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_drop_down.dart';
import '../../../cubit/Exam_cubit/create_exam/create_exam_cubit.dart';
import '../../../cubit/Exam_cubit/create_exam/create_exam_state.dart';
import '../../../cubit/Exam_cubit/question_cubit.dart';
import '../../../cubit/course/course_cubit.dart';
import '../../../cubit/levelCubit/level_cubit.dart';
import '../../widgets/add_user/custom_text_field.dart';
import '../../widgets/buttons/otroja_button.dart';
import '../../widgets/buttons/save_cancel_button.dart';
import '../../widgets/otroja_app_bar.dart';

class CreateExam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 245, 239),
      appBar: OtrojaAppBar(
        mainText: 'إنشاء امتحان',
      ),
      body: BlocConsumer<CreateExamCubit, CreateExamState>(
        listener: (context, state) {
          if (state is CreateExamSend) {
            showDialog(
                context: context,
                builder: (context) {
                  return OtrojaSuccessDialog(text: "تمت اضافة الامتحان بنجاح");
                });
          }
          if(state is CreateExamError){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(
                  child: Text(
                    state.message,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                backgroundColor: OtrojaColors.primaryColor,
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<CreateExamCubit>();
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: OtrojaTextFormField(
                          label: 'مدة الامتحان',
                          hintText: 'حدد المدة',
                          prefixIcon: "assets/icons/timer (1) 1.png",
                        ),
                      ),
                      Expanded(
                        child: OtrojaDatePickerWidget(
                          labelText: 'التاريخ',
                          hintText: ' تاريخ التفقد',
                          containerColor: const Color(0xffffffff),
                          containerWidth: 340.w,
                          borderThickness: 2,
                          borderColor: const Color(0xffE6E6E6),
                          imagePath: 'assets/icons/calendar.png',
                          textDirection: TextDirection.rtl,
                          onDateSelected: (picked) {
                            String formattedDate =
                                "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
                            // Handle formattedDate if needed
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: OtrojaDropdown(
                      list: context.read<QuestionCubit>().subjectNames,
                      labelText: 'حدد المادة',
                      hint: "حدد المادة",
                      onChange: (value) {
                        cubit.subjectId =
                            context.read<QuestionCubit>().subjectsId[value]!;

                        print(cubit.subjectId);
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormField(
                    labelText: ' عنوان الامتحان',
                    onChange: (data) {},
                    hintText: "اكتب عنوان الامتحان",
                    prefixIcon: Transform.scale(
                      scale: 0.60,
                      child: Icon(
                        Icons.note,
                        color: const Color(0xFFE6E6E6),
                        size: 30.sp,
                      ),
                    ),
                    myController: cubit.examNameController,
                  ),
                  SizedBox(height: 20.h),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: CheckboxListTile(
                      title: const Text("تحديد حسب الدورة"),
                      value: cubit.isSelectByCourse,
                      onChanged: (value) {
                        cubit.toggleSelectMode(true);
                      },
                      checkColor: Colors.white,
                      fillColor:
                          MaterialStateProperty.all(OtrojaColors.primaryColor),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: CheckboxListTile(
                      checkColor: Colors.white,
                      fillColor:
                          MaterialStateProperty.all(OtrojaColors.primaryColor),
                      title: const Text("تحديد حسب المجموعة"),
                      value: !cubit.isSelectByCourse,
                      onChanged: (value) {
                        cubit.toggleSelectMode(false);
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  if (cubit.isSelectByCourse)
                    BlocBuilder<CourseCubit, CourseState>(
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: OtrojaDropdown(
                            list: context.read<CourseCubit>().coursesNames,
                            labelText: 'اسم الدورة',
                            hint: "اختر دورة",
                            onChange: (value) {
                              context.read<LevelCubit>().getLevelsByCourseId(
                                  context
                                      .read<CourseCubit>()
                                      .coursesId[value]!);
                              cubit.courseId =
                                  context.read<CourseCubit>().coursesId[value]!;
                              print(cubit.courseId);
                            },
                          ),
                        );
                      },
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: CustomRoundedButton(
                            onTap: () {
                              context.pushNamed(Routes.groups, arguments: true);
                            },
                            text: "الحلقات المختارة",
                            imagePath: 'assets/images/Group 130.png',
                            backgroundColor: Colors.transparent,
                            borderColor: OtrojaColors.primaryColor,
                            textColor: const Color(0xFF85313C),
                          ),
                        ),
                        Expanded(
                          child: CustomRoundedButton(
                            onTap: () {
                              context.pushNamed(Routes.groups,
                                  arguments: false);
                            },
                            text: "تحديد حلقات الامتحان",
                            imagePath: 'assets/images/shalat (1) 1.png',
                            backgroundColor: OtrojaColors.primaryColor,
                            borderColor: const Color(0xFF85313C),
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  SizedBox(height: 20.h),
                  // if (state is CreateExamLoading)
                  //   const CircularProgressIndicator()
                  // else ...[
                  CustomRoundedButton(
                    onTap: () {
                      context.pushNamed(Routes.questionBank, arguments: true);
                    },
                    text: "اختيار من بنك الأسئلة",
                    imagePath: 'assets/images/exam (4) 1.png',
                    backgroundColor: Colors.transparent,
                    borderColor: OtrojaColors.primaryColor,
                    textColor: const Color(0xFF85313C),
                  ),
                  SizedBox(height: 40.h),
                  OtrojaButton(
                    text: "إضافة الامتحان",
                    onPressed: () {
                      cubit.submit();
                      print('///////////////////////////');
                    },
                  ),
                  // ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
