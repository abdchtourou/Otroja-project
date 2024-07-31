import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/recite_model.dart';
import '../../data/repository/recite_repository.dart';

part 'recite_state.dart';

class ReciteCubit extends Cubit<ReciteState> {
  final ReciteRepository repository;
  ReciteCubit(this.repository) : super(ReciteInitial());

  

  Future<void> createRecite(Recite recite) async {
    try {
      await repository.createRecite(recite);
      emit(ReciteCreated());
      print("gggggggggggggggggggggggg");
    } catch (e) {
      print("eeeeeeeeeeeeeeeee");
      emit(ReciteError(e.toString()));
    }
  }
}
