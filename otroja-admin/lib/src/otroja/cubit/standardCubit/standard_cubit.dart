import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/recite_model.dart';
import '../../data/models/standard_model.dart';
import '../../data/repository/standard_repository.dart';

part 'standard_state.dart';

class StandardCubit extends Cubit<StandardState> {
  final StandardRepository _repository;
  StandardCubit(this._repository) : super(StandardInitial());

  Map<int, int> standardsCounts = {};
  List<Standard> standards = [];
  int pageCount = 0;
  List<StandardCount> standardCount = [];
  String date = "";
  int studentId = 0;

  void updateDate(String newDate) {
    date = newDate;
  }

  Future<void> getStandards() async {
    try {
      emit(StandardLoading());
      standards = await _repository.getStandards();
      emit(StandardLoaded(standards));
    } catch (e) {
      emit(StandardError(e.toString()));
    }
  }

  updateStandardCount(bool increment, int standardId) {
    if (increment && standardsCounts[standardId] != null) {
      standardsCounts[standardId] = standardsCounts[standardId]! + 1;

      emit(StandardUpdated());
    } else if (standardsCounts[standardId] == 0) {
    } else {
      standardsCounts[standardId] = standardsCounts[standardId]! - 1;
      emit(StandardUpdated());
    }
  }

  updatePageCount(bool increment) {
    if (increment) {
      pageCount = pageCount + 1;

      emit(PageCountUpdated());
    } else if (pageCount == 0) {
    } else {
      pageCount = pageCount - 1;
      emit(PageCountUpdated());
    }
  }

  // Future<void> createStandard(Standard standard) async {
  //   try {
  //     emit(StandardLoading());
  //     await _repository.createStandard(standard);
  //     await getStandards(); // Refresh the list after creating
  //   } catch (e) {
  //     emit(StandardError(e.toString()));
  //   }
  // }

  // Future<void> updateStandard(Standard standard) async {
  //   try {
  //     emit(StandardLoading());
  //     await _repository.updateStandard(standard);
  //     await getStandards(); // Refresh the list after updating
  //   } catch (e) {
  //     emit(StandardError(e.toString()));
  //   }
  // }

  // Future<void> deleteStandard(int id) async {
  //   try {
  //     emit(StandardLoading());
  //     await _repository.deleteStandard(id);
  //     await getStandards(); // Refresh the list after deleting
  //   } catch (e) {
  //     emit(StandardError(e.toString()));
  //   }
  // }
}
