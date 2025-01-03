import 'package:flutter/material.dart';

import '../../presentation/widgets/otroja_button.dart';
import '../take_exam_user_cubit/take_exam_user_cubit.dart';
import '../take_exam_user_cubit/take_exam_user_state.dart';
class NavigationButtonsUser extends StatelessWidget {
   NavigationButtonsUser({super.key,required this.cubit,required this.state});
 final TakeExamUserState state;
 final TakeExamUserCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (state.currentQuestionIndex > 0)
          Expanded(
            child: InkWell(
              onTap: cubit.goBack,
              child: Container(
                margin: const EdgeInsets.all(4),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: const Color(0xFF85313C), width: 2),
                ),
                child: const Center(
                  child: Text(
                    "السؤال السابق",
                    style: TextStyle(color: Color(0xFF85313C), fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        Expanded(
          child: OtrojaButton(
            text: state.currentQuestionIndex + 1 < state.qaList.length
                ? "السؤال التالي"
                : "انهاء",
            onPressed: () {
              if (state.currentQuestionIndex + 1 < state.qaList.length) {
                cubit.nextQuestion();
              } else {
                print('///////////////////////////////// zed');
                cubit.finishExam();
                print(cubit.score);
                cubit.sendResult(cubit.score);

              }
            },
          ),
        ),
      ],
    );
  }
}
