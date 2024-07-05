import 'package:admins/src/otroja/presentation/screens/student/student_details.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/helper/constant.dart';
import '../../../cubit/students/show_student_cubit/show_students_cubit.dart';
import '../../../cubit/students/show_student_cubit/show_students_state.dart';
import '../../widgets/show_students_widget/appbar.dart';
import '../../widgets/show_students_widget/filter_bar.dart';
import '../../widgets/show_students_widget/no_students.dart';
import '../../widgets/show_students_widget/search_bar.dart';
import '../../widgets/show_students_widget/user_card.dart';

class ShowStudents extends StatelessWidget {
  ShowStudents({super.key});

  final ValueNotifier<String> searchNotifier = ValueNotifier<String>('');

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
            image: DecorationImage(image: AssetImage('assets/icons/add.png')),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SearchBarStudents(searchNotifier: searchNotifier),
          const SizedBox(height: 10),
          BlocBuilder<ShowStudentsCubit, ShowStudentsState>(
            builder: (context, state) {
              if (state is ShowStudentsLoaded) {
                return ValueListenableBuilder<String>(
                  valueListenable: searchNotifier,
                  builder: (context, searchQuery, _) {
                    final filteredStudents = state.students.where((student) {
                      return student.firstName!
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase());
                    }).toList();

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
                              padding:
                                  const EdgeInsets.only(right: 8.0, left: 8),
                              child: Container(
                                color: Colors.black,
                                child: ListView.builder(
                                  controller: context
                                      .read<ShowStudentsCubit>()
                                      .scrollController,
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8, top: 8),
                                  itemCount: filteredStudents.length + 1,
                                  // Add one more item for the loading indicator
                                  itemBuilder: (context, index) {
                                    if (index < filteredStudents.length) {
                                      return InkWell(
                                        onTap: () {
                                          studentId=filteredStudents[index].id!.toString();
                                          print(studentId);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => StudentDetails()),);
                                        },
                                        child: StudentCard(
                                          name: filteredStudents[index]
                                              .firstName!,
                                          id: filteredStudents[index].id!,
                                        ),
                                      );
                                    } else {
                                      return state.isLoadingMore
                                          ? const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                            )
                                          : Container(
                                              child: Text(
                                                "no more data to load",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ); // Return an empty container if not loading more
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else if (state is ShowStudentsLoading) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return const Expanded(child: NoStudents());
              }
            },
          ),
        ],
      ),
    );
  }
}
