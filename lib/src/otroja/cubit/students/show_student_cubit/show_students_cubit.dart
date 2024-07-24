import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:admins/src/otroja/cubit/students/show_student_cubit/show_students_state.dart';
import '../../../data/models/student_model/show_students.dart';
import '../../../data/repository/students_rpeos/show_students_repo.dart';

class ShowStudentsCubit extends Cubit<ShowStudentsState> {
  final ShowStudentsRepo showStudentsRepo;
  final ScrollController scrollController = ScrollController();
  int currentPage = 1;
  bool isLoadingMore = false;

  ShowStudentsCubit(this.showStudentsRepo) : super(ShowStudentsInitial()) {
    getStudents();
    getStudentsIslam();
    scrollController.addListener(_onScroll);
  }

  List<ShowStudentModel> studentList = <ShowStudentModel>[];
  List<int> selectedStudents = [];

  Future<void> getStudentsIslam() async {
    emit(ShowStudentsLoading());
    try {
      final List<ShowStudentModel> students =
          await showStudentsRepo.getStudentsIslam();
      studentList = students;
      emit(ShowStudentsLoaded(studentList, false));
    } catch (e) {
      print(e);
      emit(ShowStudentsError());
    }
  }

  Future<void> getStudents() async {
    isLoadingMore = true;

    emit(ShowStudentsLoading());
    try {
      final students = await showStudentsRepo.getStudents(0);

      for (var data in students['data']['data']) {
        studentList.add(ShowStudentModel.fromJson(data));
      }
      emit(ShowStudentsLoaded(studentList, isLoadingMore));
      isLoadingMore = true;

      currentPage++;
    } catch (error) {}
  }

  Future<void> loadMoreStudents() async {
    isLoadingMore = true;

    try {
      final students = await showStudentsRepo.getStudents(currentPage);
      print(';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;');

      if (students['data']['data'].isEmpty) {
        isLoadingMore = false;
        emit(ShowStudentsLoaded(studentList, isLoadingMore));

        print(isLoadingMore);
        print("//////////////zed");
        return;
      }

      for (var data in students['data']['data']) {
        studentList.add(ShowStudentModel.fromJson(data));
      }
      emit(ShowStudentsLoaded(studentList, isLoadingMore));

      currentPage++;
    } catch (error) {}
  }

  void _onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loadMoreStudents();
    }
  }

  @override
  Future<void> close() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    return super.close();
  }

  Future<void> getStudentsByGroupId(int groupId) async {
    emit(ShowStudentsLoading());
    try {
      final students = await showStudentsRepo.getStudentsByGroupId(groupId);
      emit(ShowStudentsLoaded(students, false));
    } catch (e) {
      print(e);
      emit(ShowStudentsError());
    }
  }

  void toggleSelection(int id) {
    if (selectedStudents.contains(id)) {
      selectedStudents.remove(id);
    } else {
      selectedStudents.add(id);
    }

    emit(UpdateSelectedStudentState(List.from(selectedStudents)));
  }

  Future<void> removeStudentFromGroup(int? studentId, int groupId) async {
    try {
      final success =
          await showStudentsRepo.removeStudentFromGroup(studentId, groupId);
      if (success) {
        getStudentsByGroupId(groupId);
      } else {
        emit(ShowStudentsError());
      }
    } catch (e) {
      print(e);
      emit(ShowStudentsError());
    }
  }
}
