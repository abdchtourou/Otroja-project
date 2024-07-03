import 'package:flutter/material.dart';

import '../widgets/add_user/add_parent.dart';
import '../widgets/add_user/custom_text_field.dart';
import '../widgets/add_user/image_student.dart';
import '../widgets/custom_button.dart';
import '../widgets/show_students_widget/appbar.dart';

class AddStaff extends StatelessWidget {
  const AddStaff({super.key});

  @override
  Widget build(BuildContext context) {
    final dimensions = MediaQuery.of(context).size; // Get screen size

    return Scaffold(
      appBar: Appbar(
        mainText: "إضافة مشرف",
        secText: 'املأ الحقول الموجودة في الأسفل ثم اضغط على زر إضافة المشرف',
      ),
      body: Column(
        children: [
          Container(
            height: 180,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: ImageStudent(),
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
                ),
              ),
              SizedBox(width: 16), // Add space between the text fields
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
                  type: TextInputType.visiblePassword,
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
            obscureText: true,
            onChange: (data) {},
            hintText: "اكتب رقم الهاتف",
            type: TextInputType.number,
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
            type: TextInputType.text,
          ),
          CustomButton(text: "إضافة المشرف", onPressed: (){})

        ],
      ),
    );
  }
}

