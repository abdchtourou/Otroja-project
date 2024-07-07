import 'package:flutter/material.dart';

import '../add_user/custom_drop_down.dart';
import '../add_user/custom_text_date.dart';
import '../add_user/custom_text_field.dart';

class StudentInfoForm extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneNumberController;
  final TextEditingController dateController;
  final ValueChanged<String?> onChanged;

  const StudentInfoForm(
      {super.key,
      required this.fullNameController,
      required this.emailController,
      required this.passwordController,
      required this.phoneNumberController,
      required this.dateController,
      required this.onChanged,
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          labelText: 'الاسم الكامل',
          onChange: (data) {},
          hintText: "اكتب اسمك",
          prefixIcon: Transform.scale(
            scale: 0.60,
            child: const ImageIcon(
              AssetImage('assets/icons/person.png'),
              color: Color(0xFFE6E6E6),
            ),
          ),
          myController: fullNameController,
        ),
        CustomTextFormField(
          labelText: "كلمة المرور",
          prefixIcon: Transform.scale(
            scale: 0.6,
            child: const ImageIcon(
              AssetImage('assets/icons/Lock.png'),
              color: Color(0xFFE6E6E6),
            ),
          ),
          suffixIcon: Transform.scale(
            scale: 0.6,
            child: const ImageIcon(
              AssetImage('assets/icons/eye.png'),
              color: Color(0xFFE6E6E6),
            ),
          ),
          obscureText: true,
          onChange: (data) {},
          hintText: "اكتب كلمة مرورك",
          type: TextInputType.visiblePassword,
          myController: passwordController,
        ),
        CustomTextDate(
          labelText: "تاريخ الميلاد",
          prefixIcon: Transform.scale(
            scale: 1,
            child: const Icon(
              Icons.date_range,
              color: Color(0xFFE6E6E6),
            ),
          ),
          obscureText: false,
          onChange: (data) {},
          hintText: "اختر تاريخ ",
          myController: dateController,
        ),
        CustomTextFormField(
          labelText: 'رقم الهاتف',
          prefixIcon: Transform.scale(
            scale: 1,
            child: const Icon(
              Icons.phone_enabled_outlined,
              color: Color(0xFFE6E6E6),
            ),
          ),
          obscureText: false,
          onChange: (data) {},
          hintText: "ادخل رقمك ",
          type: TextInputType.phone,
          myController: phoneNumberController,
        ),
        CustomDropdown(
          labelText: "المدينة",
          list: const [
            'United States',
            'Canada',
            'Mexico',
            'United Kingdom',
            'Germany',
            'France',
            'Italy',
            'Spain',
            'China',
            'Japan',
            'Australia',
            'India',
            'Brazil',
            'South Africa',
          ],
          hint: 'مدينة',

          onChanged: onChanged
        ),
        CustomDropdown(
          labelText: "الحلقة",
          hint: "حلقة",
          list: const [
            'United States',
            'Canada',
            'Mexico',
            'United Kingdom',
            'Germany',
            'France',
            'Italy',
            'Spain',
            'China',
            'Japan',
            'Australia',
            'India',
            'Brazil',
            'South Africa',
          ], onChanged: onChanged,
        ),
      ],
    );
  }
}
