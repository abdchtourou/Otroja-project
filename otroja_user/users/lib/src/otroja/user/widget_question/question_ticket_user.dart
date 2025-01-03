import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otroja_users/src/core/utils/extensions.dart';
import 'package:otroja_users/src/otroja/user/widget_question/question_body_user.dart';
import 'package:otroja_users/src/otroja/user/widget_question/question_header_user.dart';
import '../../../core/routing/routes.dart';
import '../../presentation/widgets/otroja_button.dart';
import '../../presentation/widgets/otroja_seccuss_dialog.dart';
import '../take_exam_user_cubit/take_exam_user_cubit.dart';
import '../take_exam_user_cubit/take_exam_user_state.dart';
import 'navigation_buttons_user.dart';

class QuestionTicketUser extends StatelessWidget {
  const QuestionTicketUser({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit=context.read<TakeExamUserCubit>();
    return BlocConsumer<TakeExamUserCubit, TakeExamUserState>(
      listener: (context, state) {
        if (state is TakeExamUserFinishExam) {
          print("////////////////////${state.correctAnswers}");
          _showExamFinishedDialog(context, state,cubit);
        }
      },


      builder: (context, state) {
        final cubit = context.read<TakeExamUserCubit>();
        final currentQuestion = state.qaList[state.currentQuestionIndex];
        print(currentQuestion);

        return Card(
          color: const Color(0xFFFFF5EC),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              QuestionHeaderUser(state: state),
              QuestionBodyUser(
                  currentQuestion: currentQuestion, state: state, cubit: cubit),
              NavigationButtonsUser(state: state, cubit: cubit),
              if (state.isExamFinished) _buildResultsButton(cubit),
            ],
          ),
        );
      },
    );
  }
  void _showExamFinishedDialog(BuildContext context, TakeExamUserFinishExam state,TakeExamUserCubit cubit) {
    showDialog(
      context: context,
      builder: (context) => OtrojaSuccessDialog(
        text:
              "تم إنهاء الامتحان. لقد أجبت على ${state.correctAnswers} من أصل ${state.total} إجابات صحيحة.",
        onPressed: (){
          context.pushNamed(Routes.home);



        },
      )

    );
  }

  Widget _buildResultsButton(TakeExamUserCubit cubit) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OtrojaButton(
        text: "عرض النتائج",
        onPressed: () {

        },
      ),
    );
  }
}
