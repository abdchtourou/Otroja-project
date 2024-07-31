part of 'permission_cubit.dart';

@immutable
sealed class PermissionState {}

final class PermissionInitial extends PermissionState {}
class PermissionLoading extends PermissionState {}

class PermissionLoaded extends PermissionState {
  final List<Permission> permissions;

  PermissionLoaded(this.permissions);
}

class PermissionError extends PermissionState {
  final String message;

  PermissionError(this.message);
}