import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'activity_state.dart';

class ActivityCubit extends Cubit<ActivityState> {
  ActivityCubit() : super(ActivityInitial());
  int otrojaCount = 1;

  updateOtroja(bool increment) {
    if (increment) {
      otrojaCount++;
      emit(UpdateOtrojaState());
    } else if (otrojaCount == 1) {
    } else {
      otrojaCount--;
      emit(UpdateOtrojaState());
    }
  }
}
