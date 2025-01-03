part of 'document_cubit.dart';

@immutable
sealed class DocumentState {}

final class DocumentInitial extends DocumentState {}
class DocumentLoading extends DocumentState {}

class DocumentLoaded extends DocumentState {
  final List<Document> documents;

  DocumentLoaded(this.documents);
}

class DocumentError extends DocumentState {
  final String message;

  DocumentError(this.message);
}