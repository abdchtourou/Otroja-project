import 'package:admins/src/otroja/data/models/activity_model/add_activity.dart';
import 'package:admins/src/otroja/data/repository/activity_repos/add_activity_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter/material.dart';
part 'add_activity_state.dart';

class AddActivityCubit extends Cubit<AddActivityState> {
  AddActivityCubit(this.addActivityRepo) : super(ActivityInitial()){
    nameController=TextEditingController();
    descriptionController=TextEditingController();
  }
  AddActivityRepo addActivityRepo;
 late TextEditingController nameController;
 late TextEditingController descriptionController;
  int otrojaCount = 1;

  updateOtroja(bool increment) {
    if (increment) {
      otrojaCount++;
      emit(UpdateOtrojaState());
    } else if (otrojaCount == 1) {
    } else {
      otrojaCount--;
      emit(UpdateOtrojaState());
    }
  }
 Future<void> addActivity()async{
    emit(AddActivityLoading());
    final dataActivity =AddActivityModel(name: nameController.text, description: descriptionController.text, points: otrojaCount);
    try{
      final response = await addActivityRepo.addActivity(dataActivity.toJson());
      emit(AddActivityLoaded());
      print('//////////////////////////////////////');
    }catch(e){
      print(e);
    }
  }
}
