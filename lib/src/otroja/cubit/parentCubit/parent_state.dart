part of 'parent_cubit.dart';

@immutable
sealed class ParentState {}

final class ParentInitial extends ParentState {}
class ParentLoading extends ParentState {}
class ParentAdded extends ParentState {
}
class ParentError extends ParentState {
  final String message;
  ParentError(this.message);
}