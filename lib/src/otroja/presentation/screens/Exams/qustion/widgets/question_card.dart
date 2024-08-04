import 'package:admins/src/otroja/cubit/Exam_cubit/create_exam/create_exam_cubit.dart';
import 'package:admins/src/otroja/cubit/Exam_cubit/create_exam/create_exam_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/colors.dart';
import '../../../../../cubit/Exam_cubit/create_exam/create_exam_state.dart';
import '../../../../../data/models/question_bank_model/question_bank_model.dart';

class QuestionCard extends StatelessWidget {
  QuestionCard({super.key,
    required this.index,
    required this.question,
    required this.answers,
   required this.isSelected , required this.id
  });

  final int index;
  final int id;
  final String question;
  final List<Answer> answers;
  final bool isSelected;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),

      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 249, 245, 239),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
            color: OtrojaColors.primaryColor,
            style: BorderStyle.solid,
            width: 3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: OtrojaColors.primaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ),
          Center(
            child: Text(
              question,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  width: 30.w,
                  height: 27.h,
                  decoration: const BoxDecoration(
                      color: OtrojaColors.primaryColor,
                      image: DecorationImage(
                          image: AssetImage('assets/images/tt.png'))),
                ),
                Expanded(
                  child: Container(
                    // margin: EdgeInsets.only(top: 20.h),
                    padding: const EdgeInsets.all(4),
                    color: OtrojaColors.primaryColor,
                    child: const Center(
                      child: Text(
                        "إجاباته",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  width: 30.w,
                  height: 27.h,
                  decoration: const BoxDecoration(
                      color: OtrojaColors.primaryColor,
                      image: DecorationImage(
                          image: AssetImage('assets/images/tt.png'))),
                ),
              ],
            ),
          ),
          ...List.generate(answers.length, (index) {
            bool isCorrect = answers[index].isCorrect == 0;
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(answers[index].text),
                Container(
                  decoration: BoxDecoration(
                      color: isCorrect
                          ? Colors.transparent
                          : OtrojaColors.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: OtrojaColors.primaryColor)),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 4),
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color:
                        !isCorrect ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),

          if(isSelected!)
            BlocBuilder<CreateExamCubit, CreateExamState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: 41,
                          child: OutlinedButton(
                            onPressed: () {
                              context.read<CreateExamCubit>().addToList(questionId: id);
                              print(CreateExamCubit.questionsId);
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                color: isSelected! ? Colors.green : const Color(
                                    0xFF85313C),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Icon(
                              Icons.add,
                              color: isSelected! ? Colors.green : const Color(
                                  0xFF85313C),
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 41,
                            child: OutlinedButton(
                              onPressed: () {
                                context.read<CreateExamCubit>().removeFromList(questionId: id);
                                print(CreateExamCubit.questionsId);
                              },
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: Color(0xFF85313C),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Icon(
                                Icons.remove_circle,
                                color: Color(0xFF85313C),
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),


        ],
      ),
    );
  }
}
