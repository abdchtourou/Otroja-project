import 'package:flutter/material.dart';
import 'package:otroja_users/src/otroja/user/widget_question/question_instructions_user.dart';

import '../../../core/utils/colors.dart';
import '../take_exam_user_cubit/take_exam_user_state.dart';
class QuestionHeaderUser extends StatelessWidget {
   QuestionHeaderUser({super.key,required this.state});
  TakeExamUserState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "السؤال ${state.currentQuestionIndex + 1} / ${state.qaList.length}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: LinearProgressIndicator(
              value: (state.currentQuestionIndex + 1) / state.qaList.length,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(OtrojaColors.primaryColor),
            ),
          ),
          const QuestionInstructionsUser(),
        ],
      ),
    );
  }
}
