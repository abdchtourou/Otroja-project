import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../data/models/group_model.dart';
import 'create_exam_state.dart';

class CreateExamCubit extends Cubit<CreateExamState> {
  CreateExamCubit() : super(CreateExamInitial());

  final TextEditingController examNameController = TextEditingController();
  String? selectedSubject;
  bool isSelectByCourse = true;
  static List<Group> listGroups = [];
  static List<int> questionsId = [];
  bool isSelected = false;
  List<int> GroupsId=<int>[];


  void addToList({Group? group, int? questionId}) {
    bool itemAdded = false;

    if (group != null && !listGroups.contains(group)) {
      listGroups.add(group);
      GroupsId.add(group.id!);
      itemAdded = true;
    }

    if (questionId != null && !questionsId.contains(questionId)) {
      questionsId.add(questionId);
      itemAdded = true;
    }

    isSelected = itemAdded;
    emit(CreateExamUpdated(listGroups, isSelected));
  }

  void removeFromList({Group? group, int? questionId}) {
    bool itemRemoved = false;

    if (group != null && listGroups.remove(group)) {
      GroupsId.remove(group.id);
      itemRemoved = true;
    }

    if (questionId != null && questionsId.remove(questionId)) {
      itemRemoved = true;
    }

    isSelected = !itemRemoved;
    emit(CreateExamUpdated(listGroups, isSelected));
  }

  void selectSubject(String? subject) {
    selectedSubject = subject;
    emit(CreateExamLoaded());
  }

  void toggleSelectMode(bool isCourse) {
    isSelectByCourse = isCourse;
    emit(CreateExamLoaded());
  }

  bool validate() {
    if (examNameController.text.isEmpty || selectedSubject == null) {
      emit(CreateExamError('لو سمحت أملأ كل الحقول'));
      return false;
    }
    return true;
  }

  void submit() {
    if (validate()) {
      emit(CreateExamLoading());
      emit(CreateExamLoaded());
    }
  }
}
