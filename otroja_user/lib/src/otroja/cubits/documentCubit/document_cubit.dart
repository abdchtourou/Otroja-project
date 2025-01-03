import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/Document.dart';
import '../../data/repositories/document_repository.dart';

part 'document_state.dart';

class DocumentCubit extends Cubit<DocumentState> {
  final DocumentRepository _repository;

  DocumentCubit(this._repository) : super(DocumentInitial());

  Future<void> loadDocuments() async {
    emit(DocumentLoading());
    try {
      final documents = await _repository.fetchDocuments();
      emit(DocumentLoaded(documents));
    } catch (e) {
      emit(DocumentError('Failed to load documents'));
    }
  }
}
