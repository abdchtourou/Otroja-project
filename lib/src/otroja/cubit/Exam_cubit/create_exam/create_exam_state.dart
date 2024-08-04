
import '../../../data/models/group_model.dart';

abstract class CreateExamState {}
class CreateExamUpdated extends CreateExamState {
  final List<Group> groups;
  final bool isSelected;

  CreateExamUpdated(this.groups, this.isSelected);
}



class CreateExamInitial extends CreateExamState {}

class CreateExamLoading extends CreateExamState {}

class CreateExamLoaded extends CreateExamState {}

class CreateExamError extends CreateExamState {
  final String message;

  CreateExamError(this.message);
}
