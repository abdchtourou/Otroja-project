import 'custom_container.dart';
import 'package:flutter/material.dart';

class StudentInfoRow extends StatelessWidget {
  const StudentInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomContainer(
          imagePath: 'assets/images/exam (2) 1.png',
          text: 'العلامات',
          onTap: () {},
        ),
        CustomContainer(
          imagePath: 'assets/images/user (1) 1.png',
          text: 'الحضور',
          onTap: () {},
        ),
        CustomContainer(
          imagePath: 'assets/images/lemon 1.png',
          text: 'الأترجات   ',
          onTap: () {},
        ),
      ],
    );
  }
}
