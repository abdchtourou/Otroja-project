import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/exam_details_model.dart';
import '../model/questions.dart';
import '../take_exam_user_cubit/take_exam_user_cubit.dart';
import '../take_exam_user_cubit/take_exam_user_state.dart';

class QuestionBodyUser extends StatelessWidget {
  QuestionBodyUser(
      {super.key,
      required this.state,
      required this.cubit,
      required this.currentQuestion});

  Question currentQuestion;
  TakeExamUserState state;
  TakeExamUserCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: const Color(0xFF85313C), width: 2.0),
            ),
            child: Text(
              currentQuestion.text!,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.end,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "اختر الإجابة الصحيحة",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            textAlign: TextAlign.end,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: currentQuestion.answers?.length ?? 0,
            itemBuilder: (context, index) {
              final answer = currentQuestion.answers![index].text;
              final isSelected = index < state.selectedAnswers.length && state.selectedAnswers[state.currentQuestionIndex] == index;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF85313C) : Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: const Color(0xFF85313C), width: 2.0),
                  ),
                  child: ListTile(
                    title: Text(
                      answer!,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: isSelected ? Colors.white : const Color(0xFF85313C),
                      ),
                    ),
                    onTap: () {
                      cubit.selectAnswer(index);
                    },
                  ),
                ),
              );
            },
          ),

          if (state.showAnswerSelectionError)
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "يرجى اختيار إجابة قبل الانتقال إلى السؤال التالي.",
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
        ],
      ),
    );
  }
}
