import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../take_exam_user_cubit/take_exam_user_cubit.dart';
import '../take_exam_user_cubit/take_exam_user_state.dart';

class QuestionBackGroundUser extends StatelessWidget {
  const QuestionBackGroundUser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TakeExamUserCubit, TakeExamUserState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              color: const Color(0xFF85313C),
              child: Stack(
                children: [
                  Positioned(
                    left: -MediaQuery.of(context).size.width * 0.25,
                    child: Image.asset(
                      'assets/images/pattern (4) 1.png',
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.5,
                      fit: BoxFit.cover,
                      color: const Color(0xFFFFF5EC),
                    ),
                  ),
                  Positioned(
                    top: 25.h,
                    right: MediaQuery.of(context).size.width * 0.40,
                    child: Container(
                        width: 100,
                        height: 40,
                        decoration: const BoxDecoration(
                            color: OtrojaColors.primary2Color,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Center(child: _buildCountdownTimer(state))),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget _buildCountdownTimer(TakeExamUserState state) {
  print(state.remainingTime);
  return Text(
    " ${_formatDuration(Duration(seconds: state.remainingTime))}",
    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
  );
}

String _formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return "$minutes:$seconds";
}
