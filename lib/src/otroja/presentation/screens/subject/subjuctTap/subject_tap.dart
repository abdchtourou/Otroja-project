import 'package:admins/src/otroja/presentation/screens/subject/show_subjects/widget/add_subject_card.dart';
import 'package:admins/src/otroja/presentation/screens/subject/show_subjects/widget/add_subject_dialog.dart';
import 'package:admins/src/otroja/presentation/screens/subject/show_subjects/widget/subject_card.dart';
import 'package:admins/src/otroja/presentation/screens/subject/show_subjects/widget/subject_detail.dart';
import 'package:admins/src/otroja/presentation/screens/subject/show_subjects/widget/subject_input_form.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/show_students_widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/subjectCubit/subject_cubit.dart';
import '../../../widgets/otroja_circular_progress_indicator.dart';

class SubjectsTap extends StatelessWidget {
  SubjectsTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF9F5),
      body: BlocBuilder<SubjectCubit, SubjectState>(
        builder: (context, state) {
          if (state is SubjectLoading) {
            return const Center(child: OtrojaCircularProgressIndicator());
          } else if (state is SubjectsLoaded) {
            return Directionality(
              textDirection: TextDirection.rtl,

              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: state.subjects.length+1,
                itemBuilder: (context, index) {
                if(state.subjects.length>index){
                  return InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AddSubjectDialog(
                            optionalWidget: const SubjectDetail(),
                            buttonText: 'خروج',
                          ),
                        );
                      },
                      child: SubjectCard(
                        name: state.subjects[index].name!,
                        category: state.subjects[index].name!,
                      ));
                }else{
                  return AddSubjectCard(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AddSubjectDialog(
                          optionalWidget: SubjectInputForm(),
                          buttonText: 'إضافة المادة ',
                        ),
                      );
                    },
                  );
                }
                },
              ),
            );
          } else {
            return const Center(child: Text("Error loading subjects"));
          }
        },
      ),
    );
  }
}
