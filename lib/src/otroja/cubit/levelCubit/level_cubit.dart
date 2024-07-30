import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/course_model.dart';
import '../../data/repository/level_repository.dart';

part 'level_state.dart';

class LevelCubit extends Cubit<LevelState> {
 final LevelRepository repository;

  LevelCubit(this.repository) : super(LevelInitial());

  Future<void> getLevelsByCourseId(int courseId) async {
    try {
      emit(LevelLoading());
      final levels = await repository.getLevelsByCourseId(courseId);
      emit(LevelLoaded(levels));
    } catch (e) {
      emit(LevelError(e.toString()));
    }
  }
}
