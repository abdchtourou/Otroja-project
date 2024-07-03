import 'dart:convert';

import '../../../core/networking/api_services.dart';

class ShowStudentsRepo {
  final ApiService showStudentServices;

  ShowStudentsRepo(this.showStudentServices);

  getStudents() async {
    final students = await showStudentServices.get("students");

    return students;
  }
}
