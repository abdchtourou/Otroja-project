import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/cubit/course/course_cubit.dart';
import 'package:admins/src/otroja/presentation/Courses/ShowCourses/widgets/courseItem.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routing/routes.dart';
import '../../../widgets/otroja_search_bar.dart';
import 'widgets/course_item.dart';

class ShowCourses extends StatelessWidget {
  ShowCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: "الدورات",
        secText: "اختر دورة لعرض المعلومات",
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: BlocBuilder<CourseCubit, CourseState>(
                builder: (context, state) {
                  if (state is CourseLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CoursesLoaded) {
                    state.courses.forEach((element) {
                      print(element.name);
                    });
                    return ListView.builder(
                        itemCount: state.courses.length,
                        itemBuilder: (context, index) {
                          return CourseItem(
                            courseName: state.courses[index].name,
                            startDate: state.courses[index].startDate,
                            levels: state.courses[index].highestLevelOrGeneral,
                            onTap: () {
                              context.pushNamed(Routes.showLevels,
                                  arguments: state.courses[index].levels);
                            },
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
