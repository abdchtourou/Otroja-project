import 'dart:convert';


import '../../../core/networking/api_services.dart';


class ShowStudentsRepo{
final  ApiServices showStudentServices;

ShowStudentsRepo(this.showStudentServices);

  getStudents() async{
    final students= await showStudentServices.Get("students");

    return students;


 }

}