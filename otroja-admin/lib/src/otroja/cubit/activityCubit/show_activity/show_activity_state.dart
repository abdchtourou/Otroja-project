part of 'show_activity_cubit.dart';

@immutable
sealed class ShowActivityState {}

final class ShowActivityInitial extends ShowActivityState {}
final class ShowActivityLoading extends ShowActivityState {}
final class ShowActivityLoaded extends ShowActivityState {
  final List<ShowActivityModel> showActivity;

  ShowActivityLoaded(this.showActivity);
}

