import 'package:admins/src/otroja/core/networking/api_services.dart';

class EditInfoStudentRepo{
  final ApiService apiService;

  EditInfoStudentRepo(this.apiService);
  postInfo(dynamic data){
    print("repos .//////////////////////////$data");
    final response =apiService.post("student/update",data: data);
    return response;
    
  }
}