part of 'add_activity_cubit.dart';

@immutable
sealed class AddActivityState {}

final class ActivityInitial extends AddActivityState {}

final class UpdateOtrojaState extends AddActivityState {

  UpdateOtrojaState();
}
final class AddActivityLoading extends AddActivityState{}
final class AddActivityLoaded extends AddActivityState{}
