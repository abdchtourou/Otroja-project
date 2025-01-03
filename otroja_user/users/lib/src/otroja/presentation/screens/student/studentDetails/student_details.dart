
import 'package:flutter/material.dart';
import 'package:otroja_users/src/otroja/data/models/stuednt_info.dart';
import '../../../widgets/otroja_app_bar.dart';
import 'widgets/custom_data_row.dart';
import 'widgets/filter_bar.dart';
import 'widgets/profile_info.dart';
import 'widgets/student_info_row.dart';

class StudentDetails extends StatelessWidget {
  final StudentInfo studentInfo;
  final Map<String, String> data;


  StudentDetails({super.key, required this.studentInfo})
      : data = {
        'الأترجات' : studentInfo.studentProfile!.points.toString(),
    'البريد الإلكتروني': studentInfo.studentProfile!.firstName!,
    'تاريخ الميلاد': studentInfo.studentProfile!.birthDate!,
    'رقم الهاتف': studentInfo.studentProfile!.phoneNumber!,
    'المدينة': studentInfo.studentProfile!.address!,
    // 'الحلقة': showStudentModel.groupId!.toString(),
    'الصف': studentInfo.studentProfile!.grade!,
  };


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: 'معلومات الطالب',
   
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileInfo(
                    name: studentInfo.studentProfile!.firstName!,
                    personalNumber: studentInfo.studentProfile!.phoneNumber!,
                    imagePath: 'assets/images/people (1) 1.png',
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                   StudentInfoRow(studentInfo: studentInfo,),
                  const SizedBox(height: 52),
                  FilterBar(
                    text: 'المعلومات العامة',
                  ),
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
