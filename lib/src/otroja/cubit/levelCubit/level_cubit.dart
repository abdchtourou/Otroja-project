import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/course_model.dart';
import '../../data/repository/level_repository.dart';

part 'level_state.dart';

class LevelCubit extends Cubit<LevelState> {
  final LevelRepository repository;
  Map<int, bool> levels = {};
  String name = '';
  String startDate = '';
  List<int> levelsint = [];

  LevelCubit(this.repository) : super(LevelInitial());

  resetState() {
    name = '';
    startDate = '';
    levels = levels.map((key, value) => MapEntry(key, false));
    emit(LevelUpdated(levels));
  }

  bool isAnyLevelSelected() {
    bool b = false;
    levels.forEach((key, value) {
      if (value) b = true;
    });
    return b;
  }

  getSelectedLevelIds() {
    levels.forEach((key, value) {
      if (value) levelsint.add(key);
    });
  }

  void updateSelection(int index, bool selected) {
    for (int i = 1; i <= index; i++) {
      levels[i] = selected;
    }
    for (int i = index + 1; i <= levels.length; i++) {
      levels[i] = false;
    }
    emit(LevelUpdated(levels));
  }

  Future<void> getLevelsByCourseId(int courseId) async {
    try {
      emit(LevelLoading());
      final levels = await repository.getLevelsByCourseId(courseId);
      emit(LevelLoaded(levels));
    } catch (e) {
      emit(LevelError(e.toString()));
    }
  }

  Future<void> getAllLevels() async {
    try {
      emit(LevelLoading());
      final levels = await repository.getAllLevels();
      this.levels = {for (var level in levels) level.id: false};
      emit(LevelLoaded(levels));
    } catch (e) {
      emit(LevelError(e.toString()));
    }
  }
}
