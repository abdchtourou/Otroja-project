part of 'standard_cubit.dart';

@immutable
sealed class StandardState {}

final class StandardInitial extends StandardState {}
class StandardLoading extends StandardState {}
class StandardLoaded extends StandardState {
  final List<Standard> standards;
  StandardLoaded(this.standards);
}
class StandardUpdated extends StandardState {
}
class PageCountUpdated extends StandardState {
}
class StandardError extends StandardState {
  final String message;
  StandardError(this.message);
}