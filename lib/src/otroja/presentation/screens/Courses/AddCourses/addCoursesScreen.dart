import 'package:admins/src/otroja/cubit/course/course_cubit.dart';
import 'package:admins/src/otroja/cubit/levelCubit/level_cubit.dart';
import 'package:admins/src/otroja/presentation/screens/Courses/AddCourses/widgets/courseLevelWidget.dart';
import 'package:admins/src/otroja/presentation/screens/absence/teachersAbsence/widgets/absence_date_picker.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_button.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_text_field.dart';
import 'package:admins/src/otroja/presentation/widgets/text%20field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/OtrojaDatePicker.dart';
import '../../../widgets/otroja_seccuss_dialog.dart';

class AddCourses extends StatelessWidget {
  AddCourses({super.key});

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 245, 239),
      appBar: OtrojaAppBar(
        mainText: 'إضافة دورة',
        secText: 'إملأ التفاصيل أدناه ثم اضغط زر إضافة دورة',
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OtrojaTextFormField(
                        hintText: "اكتب اسم الدورة",
                        label: "اسم الدورة",
                        prefixIcon: 'assets/icons/labelname.png',
                        onChange: (value) {
                          context.read<LevelCubit>().name = value;
                        },
                      ),
                    ),
                    OtrojaDatePickerWidget(
          
                      hintText: 'حدد تاريخ البداية',
                      labelText: ' التاريخ ',
                      containerColor: const Color(0xffffffff),
                      containerWidth: 340.w,
                      borderThickness: 2,
                      borderColor: const Color(0xffE6E6E6),
                      imagePath: 'assets/icons/calendar.png',
                      textDirection: TextDirection.rtl,
                      onDateSelected: (DateTime picked) {
                        String formattedDate =
                            "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
                        context.read<LevelCubit>().startDate = formattedDate;
                      },
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LevelCheckboxWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          BlocConsumer<CourseCubit, CourseState>(
              listener: (context, state) {
            if (state is CourseCreated) {
              showDialog(
                context: context,
                builder: (context) => OtrojaSuccessDialog(
                  text: "!تم إضافة الدورة بنجاح",
                ),
              ).then((_) {
                formKey.currentState?.reset();
                context.read<LevelCubit>().resetState();
                      
              });
            }
          }, builder: (context, state) {
            final levelCubit = context.read<LevelCubit>();
          
            return OtrojaButton(
              onPressed: () async {
             
                  if (levelCubit.startDate == '' ||!levelCubit.isAnyLevelSelected()|| levelCubit.name == '') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('الرجاءادخال اسم و تحديد تاريخ البداية و تحديد مستوى واحد على الأقل' )),
                    );
                    return;
                  }
                  levelCubit.getSelectedLevelIds();
                  print("tap");
                  context.read<CourseCubit>().createCourse(
                      levelCubit.startDate,
                      levelCubit.name,
                      levelCubit.levelsint);
                
              },
              text: 'إنشاء حلقة',
            );
          }),
        ],
      ),
    );
  }
}
