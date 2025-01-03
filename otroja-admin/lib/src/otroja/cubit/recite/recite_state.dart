part of 'recite_cubit.dart';

@immutable
sealed class ReciteState {}

final class ReciteInitial extends ReciteState {}
class ReciteLoading extends ReciteState {}

class ReciteCreated extends ReciteState {


}

class ReciteError extends ReciteState {
  final String message;

   ReciteError(this.message);

}