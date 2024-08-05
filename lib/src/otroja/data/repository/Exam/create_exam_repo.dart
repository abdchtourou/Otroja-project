import 'package:admins/src/otroja/data/datasource/api_services.dart';

class CreateExamRepo{
  ApiService apiService;

  CreateExamRepo(this.apiService);
  postData(dynamic data) async{
    print(data);
    final response= await apiService.post('exams/create',data: data);
    return response;
  }
}