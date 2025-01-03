import 'package:flutter/material.dart';
import 'package:otroja_users/src/otroja/presentation/screens/Library/showDocuments/widgets/document_item.dart';

import '../../../../../data/models/Document.dart';

class DocumentsList extends StatelessWidget {
  List<Document> documents;
  DocumentsList({super.key, required this.documents});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: documents.length,
      itemBuilder: (context, index) {
        final document = documents[index];
        return DocumentItem(document: document);
      },
    );
  }
}
