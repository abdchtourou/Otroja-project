part of 'add_studnet_cubit.dart';

@immutable
sealed class AddStudentState {}

final class AddStudentInitial extends AddStudentState {}
final class ImageLoaded extends AddStudentState {
  String? imagePath;

  ImageLoaded(this.imagePath);
}
final class ImageError  extends AddStudentState {
  String? errorMessage;

  ImageError(this.errorMessage);
}

