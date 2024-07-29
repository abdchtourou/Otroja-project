import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/cubit/course/course_cubit.dart';
import 'package:admins/src/otroja/cubit/recite/recite_cubit.dart';
import 'package:admins/src/otroja/cubit/standardCubit/standard_cubit.dart';
import 'package:admins/src/otroja/presentation/screens/Levels/widgets/level_card.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
                          LevelCard(
                            name: state.courses[index].name,
                            onPressed: () {},
                          );
                          return null;
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
