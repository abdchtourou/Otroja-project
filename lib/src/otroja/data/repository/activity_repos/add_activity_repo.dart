import 'package:admins/src/otroja/core/networking/api_services.dart';

class AddActivityRepo{
  ApiService apiService;

  AddActivityRepo(this.apiService);
  addActivity(dynamic body){
    final response = apiService.post("activity/create",data: body);
    return response;
    
  }
}