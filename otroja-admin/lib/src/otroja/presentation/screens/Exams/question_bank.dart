import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:admins/src/otroja/cubit/Exam_cubit/question_bank/question_bank_cubit.dart';
import 'package:admins/src/otroja/cubit/Exam_cubit/question_bank/question_bank_state.dart';
import 'package:admins/src/otroja/presentation/screens/Exams/qustion/widgets/question_card.dart';
import 'package:admins/src/otroja/presentation/widgets/add_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/show_students_widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routing/routes.dart';

class QuestionBank extends StatelessWidget {
  const QuestionBank({super.key, required this.isAdd});

  final bool isAdd;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuestionBankCubit>();
    final ValueNotifier<String> searchNotifier = ValueNotifier<String>('');

    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: "بنك الأسئلة ",
        secText: 'اضغط على الامتحان لعرض تفاصيله',
        optionalWidget: AddAppBar(
          onTap: () {
            context.pushNamed(Routes.question).then((_) {
              cubit.loadQuestions();
            });
          },
        ),
      ),
      body: Column(
        children: [
          OtrojaSearchBar1(searchNotifier: searchNotifier),
          Expanded(
            child: BlocBuilder<QuestionBankCubit, QuestionBankState>(
              builder: (context, state) {
                if (state is QuestionLoaded) {
                  return ValueListenableBuilder<String>(
                    valueListenable: searchNotifier,
                    builder: (context, searchQuery, _) {
                      final filteredQuestions =
                          state.questions.where((question) {
                        return question.text
                            .toLowerCase()
                            .contains(searchQuery.toLowerCase());
                      }).toList();

                      return ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: filteredQuestions.length,
                        itemBuilder: (context, index) {
                          return QuestionCard(
                            index: index,
                            question: filteredQuestions[index].text,
                            answers: filteredQuestions[index].answers,
                            id: filteredQuestions[index].id, isSelected: isAdd,
                            
                          );
                        },
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
