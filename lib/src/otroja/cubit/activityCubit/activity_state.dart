part of 'activity_cubit.dart';

@immutable
sealed class ActivityState {}

final class ActivityInitial extends ActivityState {}

final class UpdateOtroja extends ActivityState {
  int otrojaCount;
  UpdateOtroja(this.otrojaCount);
}
