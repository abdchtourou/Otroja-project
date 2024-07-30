import 'package:admins/src/otroja/cubit/add_staff/add_staff_cubit.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/otroja_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cubit/students/edit_info_student_cubit/edit_info_student_cubit.dart';
import '../../widgets/add_user/add_parent.dart';
import '../../widgets/add_user/custom_text_field.dart';
import '../../widgets/add_user/image_student.dart';


class AddStaff extends StatelessWidget {
  const AddStaff({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddStaffCubit>();

    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: "إضافة مشرف",
        secText: 'املأ الحقول الموجودة في الأسفل ثم اضغط على زر إضافة المشرف',
      ),
      body: Column(
        children: [
          SizedBox(
            height: 140.h,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: ImageStudent(image: "a", onPressed: () {  },),
                ),
                Positioned(
                  left: 45,
                  bottom: 0, // Position at bottom
                  child: ImageTextCard(
                    imagePath: 'assets/icons/key 1.png',
                    text: 'تحديد الصلاحيات',
                    onTap: () {},
                  ),
                ),
                Positioned(
                  right: 43,
                  bottom: 0, // Position at bottom
                  child: ImageTextCard(
                    imagePath: 'assets/icons/coach 1.png',
                    text: 'تحديد الدورة',
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          Row(
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
                  type: TextInputType.text,
                  myController: cubit.secondNameController,
                ),
              ),
              const SizedBox(width: 16),
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
                  obscureText: false,
                  onChange: (data) {},
                  hintText: "أكتب اسمك",
                  type: TextInputType.text, myController: cubit.firstNameController,
                ),
              ),
            ],
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
            obscureText: false,
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
            obscureText: false,
            onChange: (data) {},
            hintText: "اختر مهنة ",
            type: TextInputType.text, myController: cubit.careerController ,
          ),
          OtrojaButton(text: "إضافة المشرف", onPressed: (){})

        ],
      ),
    );
  }
}

