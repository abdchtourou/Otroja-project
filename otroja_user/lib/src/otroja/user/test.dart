import 'package:flutter/material.dart';
import 'package:otroja_users/src/otroja/user/widget_question/question_back_ground_user.dart';
import 'package:otroja_users/src/otroja/user/widget_question/question_ticket_user.dart';

class QuestionUser extends StatelessWidget {
  const QuestionUser({super.key,
    // required this.questionList
  });

  // final List<QuestionUserModel> questionList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const QuestionBackGroundUser(),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: QuestionTicketUser(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
