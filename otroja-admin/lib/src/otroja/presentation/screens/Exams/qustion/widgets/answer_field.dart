import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../cubit/Exam_cubit/question_cubit.dart';


class AnswerField extends StatelessWidget {
  const AnswerField({
    super.key,
    this.hintText,
    this.onChange,
    this.isRtl = true,
    this.index,
    required this.controller,
  });

  final TextEditingController controller;
  final String? hintText;
  final Function(String)? onChange;
  final bool isRtl;
  final int? index;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<QuestionCubit>();
    final isSelected = cubit.state.selectedAnswerIndex == index;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: const Color(0xFF85313C), width: 2.0),
      ),
      child: Row(
        children: [
          SizedBox(width: 9.w),
          Expanded(
            flex: 5,
            child: TextFormField(
              controller: controller,
              style: const TextStyle(color: Colors.black),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'field is required';
                }
                return null;
              },
              onChanged: onChange,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: hintText,
                hintStyle: const TextStyle(color: Color(0xFFC2C0C0)),
                border: InputBorder.none,
                contentPadding: isRtl
                    ? const EdgeInsets.only(right: 16.0)
                    : const EdgeInsets.only(left: 16.0),
              ),
              textAlign: isRtl ? TextAlign.right : TextAlign.left,
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                cubit.selectAnswer(index!);
              },
              child: Container(
                height: 48.0,
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF85313C) : Colors.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(9.0),
                    bottomRight: Radius.circular(9.0),
                  ),
                  border: Border(
                    left: BorderSide(
                      color: const Color(0xFF85313C),
                      width: 2.w,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    "$index",
                    style: TextStyle(
                      color: isSelected ? Colors.white : const Color(0xFF85313C),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
