part of 'group_cubit.dart';

@immutable
sealed class GroupState {}

final class GroupInitial extends GroupState {}

final class GroupLoading extends GroupState {}
final class StudentAddedToGroup extends GroupState {}
final class GroupsAllGroupsLoaded extends GroupState {
  final List<Group> groups;

  GroupsAllGroupsLoaded(this.groups);
}
final class GroupsLoaded extends GroupState {
  final List<Group> groups;

  GroupsLoaded(this.groups);
}

final class GroupLoaded extends GroupState {
  final Group group;

  GroupLoaded(this.group);
}

final class GroupCreated extends GroupState {
  
}

final class GroupError extends GroupState {
  final String message;

  GroupError(this.message);
}