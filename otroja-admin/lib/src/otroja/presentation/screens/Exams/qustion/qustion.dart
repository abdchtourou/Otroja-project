import 'package:flutter/material.dart';
import 'widgets/question_background.dart';
import 'widgets/qustion_ticket.dart';


class Question extends StatelessWidget {
   const Question({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const QuestionBackground(),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: QuestionTicket(),
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