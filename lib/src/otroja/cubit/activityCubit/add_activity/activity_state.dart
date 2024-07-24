part of 'activity_cubit.dart';

@immutable
sealed class ActivityState {}

final class ActivityInitial extends ActivityState {}

final class UpdateOtrojaState extends ActivityState {
  UpdateOtrojaState();
}
