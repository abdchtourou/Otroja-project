import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/parent.dart';
import '../../data/repository/parent_repository.dart';

part 'parent_state.dart';

class ParentCubit extends Cubit<ParentState> {
  final ParentRepository repository;
  ParentCubit(this.repository) : super(ParentInitial());


   Future<void> addParent(Parent parent) async {
    try {
      await repository.addParent(parent);
      emit(ParentAdded());
    } catch (e) {
      emit(ParentError(e.toString()));
    }
  }
  
}
