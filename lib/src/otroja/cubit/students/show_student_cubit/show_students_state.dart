
import '../../../data/models/student_model/show_students.dart';

sealed class ShowStudentsState {}

final class ShowStudentsInitial extends ShowStudentsState {}

final class ShowStudentsLoading extends ShowStudentsState {}

final class ShowStudentsLoaded extends ShowStudentsState {
  final List<ShowStudentModel> students;
  bool isLoadingMore;

  ShowStudentsLoaded(this.students,this.isLoadingMore);
}
