import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'add_studnet_state.dart';

class AddStudentCubit extends Cubit<AddStudnetState> {
  AddStudentCubit() : super(AddStudnetInitial());
  GlobalKey<FormState> formKey = GlobalKey();

}
