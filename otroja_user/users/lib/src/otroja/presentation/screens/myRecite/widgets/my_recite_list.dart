import 'package:flutter/material.dart';
import 'package:otroja_users/src/otroja/data/models/myRecite.dart';
import 'package:otroja_users/src/otroja/presentation/screens/Library/showDocuments/widgets/document_item.dart';

import 'recite_item.dart';


class MyReciteList extends StatelessWidget {
  List<MyRecite> recites;
  MyReciteList({super.key, required this.recites});

  @override
  Widget build(BuildContext context) {
    print(recites.length);
    return ListView.builder(
      
      itemCount: recites.length,
      itemBuilder: (context, index) {
        final recite = recites[index];
        return ReciteItem(recite: recite);
      },
    );
  }
}
