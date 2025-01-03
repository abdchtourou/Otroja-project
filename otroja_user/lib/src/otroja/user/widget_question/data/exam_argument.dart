import '../../../data/models/exam_details_model.dart';
import '../../model/questions.dart';

class ExamArguments {
  final List<Question> showExamsModel;
  final int examId;
  final duration;


  ExamArguments({
    required this.showExamsModel,
    required this.examId,
    required this.duration,
  });
}