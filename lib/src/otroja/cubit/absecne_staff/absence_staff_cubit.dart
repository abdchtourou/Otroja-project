import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'absence_staff_state.dart';

class AbsenceStaffCubit extends Cubit<AbsenceStaffState> {
  AbsenceStaffCubit() : super(AbsenceStaffInitial()){
    isPresentList = List<int>.filled(2, 0);
    print(isPresentList.length);
  }
DateTime?dateTime;

  List<int> isPresentList = [];
  List<int> isAbsence = [];


  void togglePresence(int index, bool isPresent) {
    isPresentList[index] = isPresent ? 1 : 2;

    emit(AbsenceStaffTest());
  }

  addAbsence(int id, bool isPresent) {
    if (isPresent) {
      if (!isAbsence.remove(id)) {
        isAbsence.add(id);
      }
    } else {
      if (!isAbsence.contains(id)) {
        isAbsence.add(id);
      }
    }
  }
}
