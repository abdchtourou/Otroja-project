part of 'show_exams_cubit.dart';

@immutable
sealed class ShowExamsState {}

final class ShowExamsInitial extends ShowExamsState {}
final class ShowExamsLoaded extends ShowExamsState {
  final List<ShowExamsModel> list;

  ShowExamsLoaded(this.list);
}
final class ShowExamsLoading extends ShowExamsState {}
final class ShowExamsError extends ShowExamsState {
  final String message;

  ShowExamsError(this.message);
}
