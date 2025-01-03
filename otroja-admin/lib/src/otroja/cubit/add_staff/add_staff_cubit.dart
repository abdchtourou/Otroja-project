import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'add_staff_state.dart';

class AddStaffCubit extends Cubit<AddStaffState> {
  AddStaffCubit() : super(AddStaffInitial()){
    firstNameController = TextEditingController();
    secondNameController = TextEditingController();
    careerController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  final ImagePicker imagePicker = ImagePicker();
  String image = 'assets/images/people (1) 1.png';
  late TextEditingController firstNameController;
  late TextEditingController secondNameController;
  late TextEditingController careerController;
  late TextEditingController phoneNumberController;
  Future<void> pickImage() async {
    try {
      final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        image = pickedImage.path;
        emit(ImageLoaded(pickedImage.path));
      } else {
        emit(ImageError("No Image Selected"));
      }
    } catch (e) {
      emit(ImageError("Error picking image"));
    }
  }
}
