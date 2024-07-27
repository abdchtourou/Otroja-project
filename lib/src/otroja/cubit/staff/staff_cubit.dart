import 'package:admins/src/otroja/data/models/staff_model.dart';
import 'package:admins/src/otroja/data/repository/staff_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'staff_state.dart';

class StaffCubit extends Cubit<StaffState> {
  final StaffRepository repository;

  StaffCubit(this.repository) : super(StaffInitial()) {
    getAll();
  }

  Future<void> getAll() async {
    try {
      emit(StaffLoading());
      final teachersList = await repository.getAllTeachers();
      print(teachersList);
      emit(StaffLoaded(teachersList));
    } catch (e) {
      emit(StaffError(e.toString()));
    }
  }
}
