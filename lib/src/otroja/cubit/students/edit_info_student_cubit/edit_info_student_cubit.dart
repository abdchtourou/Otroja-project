import 'package:admins/src/otroja/data/models/student_model/edit_info_student_model.dart';
import 'package:admins/src/otroja/data/repository/students_rpeos/edit_info_student_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
part 'edit_info_student_state.dart';

class EditInfoStudentCubit extends Cubit<EditInfoStudentState> {
  EditInfoStudentCubit(this.editInfoStudentRepo) : super(EditInfoStudentInitial()) {
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneNumberController = TextEditingController();
    dateController = TextEditingController();
  }

  final EditInfoStudentRepo editInfoStudentRepo;

  GlobalKey<FormState> formKey = GlobalKey();
  final ImagePicker imagePicker = ImagePicker();
  String image = 'assets/images/people (1) 1.png';
  late String address = "";

  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneNumberController;
  late TextEditingController dateController;

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
    }finally{
      close();
    }
  }

  Future<void> postData(String studentId) async {
    emit(EditInfoStudentLoading());
    final dataEdit = EditInfoStudentModel(
      groupId: "2",
      firstName: fullNameController.text,
      password: passwordController.text,
      birthDate: dateController.text,
      address: address,
      phoneNumber: phoneNumberController.text,
      studentId: studentId,
    );
    try {
       await editInfoStudentRepo.postInfo(dataEdit.toJson());

        emit(EditInfoStudentLoaded());

    } catch (e) {
      emit(EditInfoStudentFailure());
    }
  }


}

