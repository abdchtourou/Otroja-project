import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/data/models/student_model/show_students.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../core/routing/routes.dart';
import '../../../core/utils/constants/colors.dart';
import '../../widgets/student_details/custom_data_row.dart';
import '../../widgets/student_details/custom_container.dart';
import '../../widgets/student_details/profile_info.dart';
import '../../widgets/show_students_widget/appbar.dart';
import '../../widgets/show_students_widget/filter_bar.dart';
import '../../widgets/student_details/student_info_row.dart';

class StudentDetails extends StatelessWidget {
  final ShowStudentModel showStudentModel;
  final Map<String, String> data;

  StudentDetails({super.key, required this.showStudentModel})
      : data = {
          'البريد الإلكتروني': showStudentModel.firstName!,
          'تاريخ الميلاد': showStudentModel.birthDate!,
          'رقم الهاتف': showStudentModel.phoneNumber!,
          'المدينة': showStudentModel.address!,
          'الحلقة': showStudentModel.groupId!.toString(),
          'المستوى': showStudentModel.grade!,
        };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: 'معلومات الطالب',
        secText: 'في حال اردت تعديل المعلومات اضغط على أيقونة القلم يمينا',
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   ProfileInfo(
                    name: showStudentModel.firstName!,
                    personalNumber: showStudentModel.phoneNumber!,
                    imagePath: 'assets/images/people (1) 1.png',
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  const StudentInfoRow(),
                  const SizedBox(height: 52),
                  FilterBar(
                    optionalWidget: TextButton(
                      onPressed: () {
                        context.pushNamed(Routes.editStudentInfo,arguments: showStudentModel.id.toString());
                      },
                      child: Text('تعديل',style: TextStyle(color: OtrojaColors.primaryColor),),
                    ),
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
