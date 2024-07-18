


import '../../../core/networking/api_services.dart';

class ShowStudentsRepo{
final  ApiService showStudentServices;

ShowStudentsRepo(this.showStudentServices);

    getStudents(page ) async{

      final students= await showStudentServices.get("students?page=$page");

      return students;


   }

}