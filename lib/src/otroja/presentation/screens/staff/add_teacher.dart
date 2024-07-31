import 'package:admins/src/otroja/presentation/widgets/buttons/otroja_button.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/students/edit_info_student_cubit/edit_info_student_cubit.dart';

import '../../widgets/add_user/add_parent.dart';
import '../../widgets/add_user/custom_text_field.dart';
import '../../widgets/add_user/image_student.dart';

class AddTeacher extends StatelessWidget {
  const AddTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EditInfoStudentCubit>();


    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: "إضافة أستاذ",
        secText: 'املأ الحقول الموجودة في الأسفل ثم اضغط علىزر إضافة الأستاذ',
      ),
      body: Column(
        children: [
          SizedBox(
            height: 180,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: ImageStudent(image: "null", onPressed: () {  },),
                ),
                Positioned(
                  left: 45,
                  bottom: 0,
                  child: ImageTextCard(
                    imagePath: 'assets/icons/key 1.png',
                    text: 'تحديد الصلاحيات',
                    onTap: () {},
                  ),
                ),
                Positioned(
                  right: 43,
                  bottom: 0,
                  child: ImageTextCard(
                    imagePath: 'assets/icons/community 1.png',
                    text: 'تحديد الدورة',
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    labelText: 'الاسم الثاني',
                    prefixIcon: Transform.scale(
                      scale: 1.2,
                      child: const Icon(
                        Icons.person_4_outlined,
                        color: Color(0xFFE6E6E6),
                      ),
                    ),
                    obscureText: false,
                    onChange: (data) {},
                    hintText: "أكتب اسمك",
                    type: TextInputType.text, myController: cubit.phoneNumberController,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: CustomTextFormField(
                    labelText: 'الاسم الأول',
                    prefixIcon: Transform.scale(
                      scale: 1.2,
                      child: const Icon(
                        Icons.person_4_outlined,
                        color: Color(0xFFE6E6E6),
                      ),
                    ),
                    obscureText: true,
                    onChange: (data) {},
                    hintText: "أكتب اسمك",
                    type: TextInputType.visiblePassword, myController: cubit.phoneNumberController,
                  ),
                ),
              ],
            ),
          ),
          CustomTextFormField(
            labelText: 'رقم الهاتف',
            prefixIcon: Transform.scale(
              scale: 1.2,
              child: const Icon(
                Icons.phone_enabled,
                color: Color(0xFFE6E6E6),
              ),
            ),
            obscureText: true,
            onChange: (data) {},
            hintText: "اكتب رقم الهاتف",
            type: TextInputType.number, myController: cubit.phoneNumberController,
          ),
          CustomTextFormField(
            labelText: 'المهنة',
            prefixIcon: Transform.scale(
              scale: 1.2,
              child: const Icon(
                Icons.business_sharp,
                color: Color(0xFFE6E6E6),
              ),
            ),
            obscureText: true,
            onChange: (data) {},
            hintText: "اختر مهنة ",
            type: TextInputType.text, myController: cubit.phoneNumberController,
          ),
          OtrojaButton(text: "إضافة الأستاذ", onPressed: () {})
        ],
      ),
    );
  }
}
