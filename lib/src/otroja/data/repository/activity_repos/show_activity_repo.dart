
import '../../datasource/api_services.dart';

class ShowActivityRepo{
  ApiService apiService;

  ShowActivityRepo(this.apiService);
  getStudents( ) async{

    final students= await apiService.get("activities");

    return students;


  }
}