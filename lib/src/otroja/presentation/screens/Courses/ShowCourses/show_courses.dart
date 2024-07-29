import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/cubit/course/course_cubit.dart';
import 'package:admins/src/otroja/cubit/recite/recite_cubit.dart';
import 'package:admins/src/otroja/cubit/standardCubit/standard_cubit.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routing/routes.dart';
import '../../../../cubit/students/show_student_cubit/show_students_cubit.dart';
import '../../../../cubit/students/show_student_cubit/show_students_state.dart';
import '../../../widgets/otroja_search_bar.dart';
import 'widgets/course_item.dart';

class ShowCourses extends StatelessWidget {
  ShowCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: "حدد الطالب ",
        secText: "اختر طالباً لبدأ التسميع",
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const OtrojaSearchBar(),
            SizedBox(height: 20.h),
            Expanded(
              child: BlocBuilder<CourseCubit, CourseState>(
                builder: (context, state) {
                  if (state is CourseLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CoursesLoaded) {
                    return ListView.builder(
                        itemCount: state.courses.length,
                        itemBuilder: (context, index) {
                          CourseCard(
                            name: state.courses[index].name,
                            date: state.courses[index].startDate,
                            levels: "111",
                            onPressed: () {},
                          );
                         
                        });
                  } else {
                    return const Center(child: Text("Error loading students"));
                  }
                },
              ),
            ),
            // OtrojaButton(text: "إضافة", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
