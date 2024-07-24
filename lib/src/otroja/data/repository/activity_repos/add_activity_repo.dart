
import '../../datasource/api_services.dart';

class AddActivityRepo{
  ApiService apiService;

  AddActivityRepo(this.apiService);
  addActivity(dynamic body) async{
    final response = await apiService.post("activity/create",data: body);
    return response;
    
  }
}