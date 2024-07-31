import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/subject_model.dart';
import '../../data/repository/subject_repository.dart';

part 'subject_state.dart';

class SubjectCubit extends Cubit<SubjectState> {
  final SubjectRepository repository;

  SubjectCubit(this.repository) : super(SubjectInitial());
  var courseLevelId;

  Future<void> getSubjectsByCourseLeve(int id) async {
    emit(SubjectLoading());
    try {
      List<Subject> subjects = await repository.getSubjectsByCourseLevel(id);
      emit(SubjectsLoaded(subjects));
      print("llllllllllllllllllllllllllllllllll");
      print(subjects);
    } catch (e) {
      print('eeeeeeeeeeeeeeeeeeeee');
      print(e);
      emit(SubjectError(e.toString()));
    }
  }
  addSubject(){
    final data=Subject();

  }

}
