import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'add_studnet_state.dart';

class AddStudentCubit extends Cubit<AddStudentState> {
  AddStudentCubit() : super(AddStudentInitial()){
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneNumberController = TextEditingController();
    dateController = TextEditingController();
  }
  GlobalKey<FormState> formKey = GlobalKey();
  final ImagePicker imagePicker = ImagePicker();
  String image='assets/images/people (1) 1.png';
  late String address='';

  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneNumberController;
  late TextEditingController dateController;

  Future<void> pickImage() async {
    try {
      final pickedImage= await imagePicker.pickImage(source: ImageSource.gallery);
      if(pickedImage!=null){
        image=pickedImage.path;
        emit(ImageLoaded(pickedImage.path));


      }else{
        emit(ImageError("No Image Selected"));


      }



    } catch (e) {}
  }
  @override
  Future<void> close() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    return super.close();
  }
}
