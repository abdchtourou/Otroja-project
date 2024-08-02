import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../cubit/Exam_cubit/question_cubit.dart';
import '../../../../../cubit/Exam_cubit/question_state.dart';
import '../../../../widgets/buttons/otroja_button.dart';
import 'answer_field.dart';
import 'question_field.dart';

class QuestionTicket extends StatelessWidget {
  const QuestionTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuestionCubit(),
      child: BlocBuilder<QuestionCubit, QuestionState>(
        builder: (context, state) {
          final cubit = context.read<QuestionCubit>();

          return Card(
            color: const Color(0xFFFFF5EC),
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "السؤال ${state.currentQuestionIndex + 1}",
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: LinearProgressIndicator(
                          value:
                              state.currentQuestionIndex / state.totalQuestions,
                          backgroundColor: Colors.grey[200],
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              OtrojaColors.primaryColor),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: RichText(
                              textDirection: TextDirection.rtl,
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: ' ملاحظة:',
                                    style: TextStyle(
                                        color: Color(0xFF85313C), fontSize: 20),
                                  ),
                                  TextSpan(
                                    text:
                                        ' اكتب نص السؤال واجاباته في الحقول بلاسفل واضغط على رقم الاجابة لتعيينها بأنها هي الإجابة الصحيحة',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.green),
                          )
                        ],
                      ),
                      QuestionField(
                        controller: cubit.questionController,
                        label: "نص السؤال",
                        hintText: "أدخل نص السؤال",
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "إجابات السؤال",
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w500),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: AnswerField(
                              controller: cubit.answerControllers[index],
                              index: index + 1,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (state.currentQuestionIndex > 0)
                      Expanded(
                        child: InkWell(
                          onTap: cubit.goBack,
                          child: Container(
                            margin: EdgeInsets.all(4),
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border: Border.all(
                                  color: const Color(0xFF85313C), width: 2),
                            ),
                            child: const Center(
                              child: Text(
                                "السؤال السابق",
                                style: TextStyle(
                                    color: Color(0xFF85313C), fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    Expanded(
                      child: OtrojaButton(
                        text: "السؤال التالي",
                        onPressed: () {
                          cubit.addQuestionAnswer(context);
                        },
                      ),
                    ),
                  ],
                ),
                if (state.currentQuestionIndex > 0)
                  OtrojaButton(
                    text: "انهاء",
                    onPressed: () {
                      print(state.qaList);
                    },
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
