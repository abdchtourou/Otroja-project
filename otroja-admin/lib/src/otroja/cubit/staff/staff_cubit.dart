import 'package:admins/src/otroja/data/models/staff_model.dart';
import 'package:admins/src/otroja/data/repository/staff_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'staff_state.dart';

class StaffCubit extends Cubit<StaffState> {
  final StaffRepository repository;

  StaffCubit(this.repository) : super(StaffInitial());

  String? userName;
  String? firstName;
  String? lastName;
  String? phone;
  String? password;
  String? role;

  List<Staff> staffs = [];
  List<int> selectedStaff = [];
  Future<void> registerStaff(Staff staff) async {
    emit(StaffLoading());
    try {
      await repository.registerStaff(staff);
      emit(StaffRegistered());
    } catch (e) {
      emit(StaffError(e.toString()));
    }
  }

  Future<void> getAllStaff() async {
    emit(StaffLoading());
    try {
      final staffList = await repository.getAllStaff();
      staffs = staffList;
      emit(StaffLoaded(staffList));
    } catch (e) {
      emit(StaffError(e.toString()));
    }
  }

  Future<void> getTeachers() async {
    try {
      emit(StaffLoading());
      final teachersList = await repository.getAllTeachers();
      print(teachersList);
      emit(StaffLoaded(teachersList));
    } catch (e) {
      emit(StaffError(e.toString()));
    }
  }

  reset() {
    userName = null;
    firstName = null;
    lastName = null;
    phone = null;
    password = null;
    role = null;
  }

  void toggleSelection(int id) {
    if (selectedStaff.contains(id)) {
      selectedStaff.remove(id);
    } else {
      selectedStaff.add(id);
      // print(selectedStaff.length);
    }

    emit(UpdateSelectedStaffState(List.from(selectedStaff)));
  }
}
