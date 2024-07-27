import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'check_student_state.dart';

class CheckStudentCubit extends Cubit<CheckStudentState> {

  List<int> isPresentList = [];

  CheckStudentCubit() : super(CheckStudentInitial()) {
    getStudents();
  }
  List<int> isAbsence=[];

  Future<void> getStudents() async {
    emit(CheckStudentLoading());
    try {


      isPresentList = List<int>.filled(5, 0);
      emit(CheckStudentLoaded( isPresentList));
    } catch (error) {
      emit(CheckStudentError(error.toString()));
    }
  }

  void togglePresence(int index, bool isPresent) {
    isPresentList[index] = isPresent ? 1:2 ;

    emit(CheckStudentLoaded( isPresentList));
  }
  addAbsence(int id ,bool isPresent){
   if(isPresent){
     if(!isAbsence.remove(id)){
       isAbsence.add(id);

     }

   }else {
     if(!isAbsence.contains(id)){
       isAbsence.add(id);

     }
   }
  }
}
