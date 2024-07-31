import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/permission_model.dart';
import '../../data/repository/permission_repository.dart';

part 'permission_state.dart';

class PermissionCubit extends Cubit<PermissionState> {
  final PermissionRepository _repository;

  PermissionCubit(this._repository) : super(PermissionInitial());

  Future<void> getPermissions() async {
    try {
      print('ggg');
      emit(PermissionLoading());
      final permissions = await _repository.getPermissions();
      emit(PermissionLoaded(permissions));
    } catch (e) {
      emit(PermissionError(e.toString()));
    }
  }
}
