import 'package:flutter/material.dart';

import '../../../../widgets/add_user/custom_text_field.dart';
class SubjectInputForm extends StatelessWidget {
   SubjectInputForm({super.key});
  TextEditingController textEditingController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
            myController: textEditingController,
            labelText: 'اسم المادة'),
        CustomTextFormField(
            myController: textEditingController,
            labelText: 'تصنيف المادة'),
        CustomTextFormField(
            myController: textEditingController,
            labelText: 'نبذة عن المادة'),
      ],
    );
  }
}
