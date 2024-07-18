part of 'add_staff_cubit.dart';

@immutable
sealed class AddStaffState {}

final class AddStaffInitial extends AddStaffState {}
final class ImageLoaded extends AddStaffState {
  String? imagePath;

  ImageLoaded(this.imagePath);
}
final class ImageError  extends AddStaffState {
  String? errorMessage;

  ImageError(this.errorMessage);
}