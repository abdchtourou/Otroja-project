import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/myRecite.dart';
import '../../data/repositories/my_recite_repository.dart';

part 'my_recite_state.dart';

class MyReciteCubit extends Cubit<MyReciteState> {
  final MyReciteRepository _reciteRepository;

  MyReciteCubit(this._reciteRepository)
      : super(MyReciteInitial()); // Set initial state

  Future<void> fetchRecites() async {
    emit(MyReciteLoading()); // Emit loading state
    try {
      final recites = await _reciteRepository.fetchRecites();
      print(recites);
      emit(MyReciteLoaded(recites)); // Emit success state
    } catch (e) {
      print(e);
      emit(MyReciteError()); // Emit error state
    }
  }
}
