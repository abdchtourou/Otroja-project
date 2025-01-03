import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otroja_users/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:otroja_users/src/otroja/presentation/widgets/otroja_circular_progress_indicator.dart';

import '../../../../cubits/documentCubit/document_cubit.dart';
import '../../../../data/repositories/document_repository.dart';
import 'widgets/document_list.dart';

class ShowDocumentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: OtrojaAppBar(
          mainText: "المكتبة",
        ),
        body: BlocBuilder<DocumentCubit, DocumentState>(
          builder: (context, state) {
            if (state is DocumentLoading) {
              return OtrojaCircularProgressIndicator();
            } else if (state is DocumentLoaded) {
              return DocumentsList(documents:state.documents);
            } else if (state is DocumentError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text('No documents available'));
            }
          },
        ),
      );
  }
}

