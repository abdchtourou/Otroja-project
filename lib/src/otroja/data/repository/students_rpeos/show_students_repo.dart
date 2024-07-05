import 'dart:convert';


import '../../../core/networking/api_services.dart';


class ShowStudentsRepo{
final  ApiServices showStudentServices;

ShowStudentsRepo(this.showStudentServices);

  getStudents(page ) async{

    final students= await showStudentServices.Get("students?page=$page");

    return students;


 }

}