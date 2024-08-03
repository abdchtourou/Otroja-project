import 'package:meta/meta.dart';

import '../../../data/models/absence_model/get_groups.dart';
import '../../../data/models/student_model/show_students.dart';

@immutable
abstract class CheckStudentState {}

class CheckStudentInitial extends CheckStudentState {}
class CheckStudentChange extends CheckStudentState {}
class CheckStudentGroupLoaded extends CheckStudentState {
  List<getGroupsModel> groupsName ;

  CheckStudentGroupLoaded(this.groupsName);
}

class CheckStudentLoadingGroup extends CheckStudentState {}
class CheckStudentLoading extends CheckStudentState {}
class CheckStudentSend extends CheckStudentState {}

class CheckStudentLoaded extends CheckStudentState {
  final List<int> isPresentList;
  List<ShowStudentModel> studentsList ;

  CheckStudentLoaded(this.isPresentList,  this.studentsList);

}

class CheckStudentError extends CheckStudentState {
  final String error;

  CheckStudentError(this.error);
}
