import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:flutter/material.dart';

import '../../widgets/student_details/custom_data_row.dart';
import '../../widgets/student_details/custom_container.dart';
import '../../widgets/student_details/profile_info.dart';
import '../../widgets/show_students_widget/appbar.dart';
import '../../widgets/show_students_widget/filter_bar.dart';

class StudentDetails extends StatelessWidget {
  StudentDetails({super.key});

  final Map<String, String> data = {
    'البريد الإلكتروني': 'abomhmaad@gmail.com',
    'تاريخ الميلاد': '1 / 5 / 2002',
    'رقم الهاتف': '098776654264',
    'البلد': 'جزر القمر',
    'المدينة': 'زيبي بوييه',
    'الحلقة': 'الأولى',
    'المستوى': '222',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: 'معلومات الطالب',
        secText: 'في حال اردت تعديل المعلومات اضغط على أيقونة القلم يمينا',
      ) ,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ProfileInfo(
                    name: 'يعقوب قمر الدين',
                    personalNumber: '02233436',
                    imagePath: 'assets/images/images.jpg',
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  Row(
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
                  ),
                  const SizedBox(height: 52),
                   FilterBar(optionalWidget: TextButton( onPressed: () {  },child: Text('تعديل'),), text: 'المعلومات العامة',),
                  Column(
                    children: data.entries.map((entry) {
                      return CustomDataRow(
                        label: entry.key,
                        value: entry.value,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
