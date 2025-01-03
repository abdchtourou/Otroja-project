part of 'parent_cubit.dart';

@immutable
sealed class ParentState {}

final class ParentInitial extends ParentState {}
class ParentLoading extends ParentState {}
class ParentCreated extends ParentState {
}
class ParentsLoaded extends ParentState {
  final List<Parent> parents;
  
  ParentsLoaded(this.parents);
}
class ParentError extends ParentState {
  final String message;
  ParentError(this.message);
}