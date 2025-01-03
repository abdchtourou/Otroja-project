import 'package:bloc/bloc.dart';
import 'package:otroja_users/src/otroja/data/models/exam_details_model.dart';
import 'package:otroja_users/src/otroja/data/repositories/exam_details_repo.dart';

class ExamDetailsState {
  final ExamDetailsModel? exam;
  final bool isLoading;
  final String? error;

  ExamDetailsState({
    this.exam,
    this.isLoading = false,
    this.error,
  });

  ExamDetailsState copyWith({
    ExamDetailsModel? exam,
    bool? isLoading,
    String? error,
  }) {
    return ExamDetailsState(
      exam: exam ?? this.exam,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class ExamDetailsCubit extends Cubit<ExamDetailsState> {
  final ExamDetailsRepo _examRepository;

  ExamDetailsCubit(this._examRepository) : super(ExamDetailsState());

  Future<void> loadExam(int examId) async {
    try {
      emit(state.copyWith(isLoading: true));
      final exam = await _examRepository.fetchExam(examId);
      print(exam);
      emit(state.copyWith(isLoading: false, exam: exam));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
