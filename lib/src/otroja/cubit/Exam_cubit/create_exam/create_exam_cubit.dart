import 'package:admins/src/otroja/data/models/Exam/create_exam.dart';
import 'package:admins/src/otroja/data/repository/Exam/create_exam_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../data/models/group_model.dart';
import 'create_exam_state.dart';

class CreateExamCubit extends Cubit<CreateExamState> {
  CreateExamCubit(this.createExamRepo) : super(CreateExamInitial());

  final TextEditingController examNameController = TextEditingController();
  String? selectedSubject;
  var subjectId;
  bool isSelectByCourse = true;
  static List<Group> listGroups = [];
  static List<int> questionsId = [];
  bool isSelected = false;
  static List<int> GroupsId = <int>[];
  int? courseId;
  CreateExamRepo createExamRepo;

  void addToList({Group? group, int? questionId}) {
    bool itemAdded = false;

    if (group != null && !listGroups.contains(group)) {
      listGroups.add(group);
      GroupsId.add(group.id!);
      print(GroupsId);
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
    print('///////////////////////////');
    if (examNameController.text.isEmpty) {
      emit(CreateExamError('لو سمحت أملأ عنوان الامتحان'));
      return false;
    }

    if (subjectId == null) {
      emit(CreateExamError('لو سمحت اختر المادة'));
      return false;
    }

    if (isSelectByCourse && courseId == null) {
      emit(CreateExamError('لو سمحت اختر الدورة'));
      return false;
    }

    if (!isSelectByCourse && GroupsId.isEmpty) {
      emit(CreateExamError('لو سمحت اختر على الأقل مجموعة واحدة'));
      return false;
    }

    if (questionsId.isEmpty) {
      emit(CreateExamError('لو سمحت اختر على الأقل سؤال واحد'));
      return false;
    }

    return true;
  }

  void submit() async {
    if (validate()) {
    print(GroupsId);
    emit(CreateExamLoading());
      final data = CreateExamModel(
          name: examNameController.text,
          subjectId: subjectId,
          date: '2001-09-28',
          questionIds: questionsId,
          duration: 20,
          groupIds: GroupsId);
      await createExamRepo.postData(data.toJson());

      emit(CreateExamLoaded());
    }
  }
}
