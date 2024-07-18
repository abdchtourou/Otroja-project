import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_activity_state.dart';

class AddActivityCubit extends Cubit<ActivityState> {
  AddActivityCubit() : super(ActivityInitial());
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
