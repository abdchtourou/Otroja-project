part of 'level_cubit.dart';

@immutable
sealed class LevelState {}

final class LevelInitial extends LevelState {}

class LevelLoading extends LevelState {}

class LevelLoaded extends LevelState {
  final List<Level> levels;

  LevelLoaded(this.levels);
}

class LevelError extends LevelState {
  final String message;

  LevelError(this.message);
}
