part of 'edit_info_student_cubit.dart';

@immutable
sealed class EditInfoStudentState {}

final class EditInfoStudentInitial extends EditInfoStudentState {}
final class ImageLoaded extends EditInfoStudentState {
  String? imagePath;

  ImageLoaded(this.imagePath);
}
final class ImageError  extends EditInfoStudentState {
  String? errorMessage;

  ImageError(this.errorMessage);
}
final class EditInfoStudentLoading extends EditInfoStudentState{}
final class EditInfoStudentLoaded extends EditInfoStudentState{}
final class EditInfoStudentFailure extends EditInfoStudentState{}
