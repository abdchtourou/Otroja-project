import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/parent.dart';
import '../../data/repository/parent_repository.dart';

part 'parent_state.dart';

class ParentCubit extends Cubit<ParentState> {
  final ParentRepository repository;
  ParentCubit(this.repository) : super(ParentInitial());

  int? id;
  String? firstName;
  String? lastName;
  String? userName;
  String? email;
  String? password;
  String? confirmPassword;
  String? phone;
  String? profession;

  Future<void> addParent(Parent parent) async {
    try {
      Parent newParent = await repository.addParent(parent);
      id = newParent.id!;
      emit(ParentCreated());
    } catch (e) {
      emit(ParentError(e.toString()));
    }
  }

  Future<void> fetchAllParents() async {
    try {
      emit(ParentLoading());
      final parents = await repository.getAllParents();
      emit(ParentsLoaded(parents));
    } catch (e) {
      emit(ParentError(e.toString()));
    }
  }

  void resetState() {
    firstName = null;
    lastName = null;
    userName = null;
    email = null;
    password = null;
    confirmPassword = null;
    phone = null;
    profession = null;
    emit(ParentInitial());
  }
}
