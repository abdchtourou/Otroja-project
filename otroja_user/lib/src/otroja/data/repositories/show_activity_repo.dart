

import '../datasource/api_services.dart';
import '../models/show_activity_model.dart';

class ShowActivityRepo{
  ApiService apiService;

  ShowActivityRepo(this.apiService);
  getStudents( ) async{

    final students= await apiService.get("activities/do");

    return students.data;


  }
  Future<dynamic> didActivity(int studentId, int activityId) async {
    print(studentId);
    print(activityId);

  final response = await apiService.post(
    "activity/student/create",
    data: {
      'student_id': studentId,
      'activity_id': activityId,
    },
  );
  print(activityId);

  return response.data;
}
  
}