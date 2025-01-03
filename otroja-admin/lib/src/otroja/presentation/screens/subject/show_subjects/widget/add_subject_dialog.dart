import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/presentation/widgets/add_user/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/colors.dart';

class AddSubjectDialog extends StatelessWidget {
   AddSubjectDialog({super.key,required this.optionalWidget,required this.buttonText});
  Widget optionalWidget;
   String buttonText;

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    return AlertDialog(
      // contentPadding: EdgeInsets.all(2),
      actionsPadding: const EdgeInsets.all(0),
      backgroundColor: const Color(0xffFFF9F5),
      content: SingleChildScrollView(
        child: optionalWidget,
      ),
      actions: [
        Container(
          height: 45.h,
          width: 290.w,
          decoration: const BoxDecoration(
            color: OtrojaColors.primaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          child: Center(
            child: TextButton(
              onPressed: () {
                context.pop();
              },
              child:  Text(
                buttonText,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
