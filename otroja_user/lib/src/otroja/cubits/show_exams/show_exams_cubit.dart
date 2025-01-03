import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/show_exam_repo.dart';
import '../../user/model/questions.dart';


part 'show_exams_state.dart';

class ShowExamsCubit extends Cubit<ShowExamsState> {
  ShowExamsCubit(this.showExamsRepo) : super(ShowExamsInitial());
  ShowExamRepo showExamsRepo;

  getExams() async {
    try {
      emit(ShowExamsLoading());
      final List<ShowExamsModel> response = await showExamsRepo.showExams();


      emit(ShowExamsLoaded(response));
    } catch (e) {
      emit(ShowExamsError(e.toString()));
    }
  }
}
