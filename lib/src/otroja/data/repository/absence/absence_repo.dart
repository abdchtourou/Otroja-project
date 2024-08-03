import 'package:admins/src/otroja/data/datasource/api_services.dart';
import 'package:admins/src/otroja/data/models/student_model/show_students.dart';

import '../../models/absence_model/get_groups.dart';

class AbsenceRepo {
  ApiService apiService;
  List<getGroupsModel> groupsName = <getGroupsModel>[];
  List<ShowStudentModel> studentsList = <ShowStudentModel>[];


  AbsenceRepo(this.apiService);


  getGroups() async {
    final responseGroups = await apiService.get('group/get_groups_by_teacher',
       // queryParameters: {}
    );

    final Map<String, dynamic> responseData = responseGroups.data;
    for (var data in responseData['data']) {
      groupsName.add(getGroupsModel.fromJson(data));
    }

  }
  getStudent(int idGroup) async{
    final responseStudents= await apiService.get('group/students',queryParameters: {"group_id": idGroup});
    final Map<String, dynamic> responseBody = responseStudents.data;
    for(var data in responseBody['data']){
      studentsList.add(ShowStudentModel.fromJson(data));

    }

  }
  post(dynamic body) async{
    final response = await apiService.post("absence/student",data: body);
    return response;

  }

}
