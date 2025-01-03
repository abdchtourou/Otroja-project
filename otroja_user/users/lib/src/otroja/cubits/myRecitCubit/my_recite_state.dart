part of 'my_recite_cubit.dart';

@immutable
sealed class MyReciteState {}

final class MyReciteInitial extends MyReciteState {}
final class MyReciteLoading extends MyReciteState {}
final class MyReciteLoaded extends MyReciteState {
   final List<MyRecite> myRecite;

  MyReciteLoaded(this.myRecite);
}
final class MyReciteError extends MyReciteState {}
