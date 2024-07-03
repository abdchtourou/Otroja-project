import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_search_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/show_students_widget/filter_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/students/show_student_cubit/show_students_cubit.dart';
import '../../../cubit/students/show_student_cubit/show_students_state.dart';
import '../../widgets/show_students_widget/no_students.dart';
import '../../widgets/show_students_widget/user_card.dart';

class ShowStudents extends StatelessWidget {
  const ShowStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: 'الطلاب',
        secText: 'ابحث عن أي طالب أو اضغط على الطالب لعرض تفاصيله',
        optionalWidget: Container(
          width: 35,
          height: 35,
          decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/icons/add.png'))),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const OtrojaSearchBar(),
          const SizedBox(height: 10),
          BlocBuilder<ShowStudentsCubit, ShowStudentsState>(
            builder: (context, state) {
              if (state is ShowStudentsLoaded) {
                if (state.students.isNotEmpty) {
                  return Expanded(
                    child: Column(
                      children: [
                        FilterBar(
                          optionalWidget: InkWell(
                            child: Image.asset("assets/icons/arrange.png"),
                            onTap: () {},
                          ),
                          text: 'الاسم',
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0, left: 8),
                            child: Container(
                              color: Colors.black,
                              child: ListView.builder(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8, top: 8),
                                itemCount: state.students.length,
                                itemBuilder: (context, index) {
                                  return StudentCard(
                                    name: state.students[index].firstName!, id: state.students[index].id!,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Expanded(child: NoStudents());
                }
              } else {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
