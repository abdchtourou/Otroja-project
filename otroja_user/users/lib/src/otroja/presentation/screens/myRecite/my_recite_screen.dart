import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otroja_users/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:otroja_users/src/otroja/presentation/widgets/otroja_circular_progress_indicator.dart';
import '../../../cubits/documentCubit/document_cubit.dart';
import '../../../cubits/myRecitCubit/my_recite_cubit.dart';
import 'widgets/my_recite_list.dart';

class MyReciteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: OtrojaAppBar(
          mainText: "المكتبة",
        ),
        body: BlocBuilder<MyReciteCubit, MyReciteState>(
          builder: (context, state) {
            if (state is MyReciteLoading) {
              return OtrojaCircularProgressIndicator();
            } else if (state is MyReciteLoaded) { 
              return MyReciteList(recites:state.myRecite);
            } else if (state is MyReciteError) {
              return Center(child: Text("error"));
            } else {
              return Center(child: Text('No documents available'));
            }
          },
        ),
      );
  }
}

