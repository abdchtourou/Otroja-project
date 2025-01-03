import 'package:flutter/material.dart';
import 'package:otroja_users/src/otroja/presentation/screens/myRecite/widgets/standard_item.dart';

import '../../../../data/models/myRecite.dart';
import '../../../widgets/otroja_app_bar.dart';

class StandartsScreen extends StatelessWidget {
  List<Standard> standard;
   StandartsScreen({
    super.key,
    required this.standard
  });

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OtrojaAppBar(mainText:"المعايير" ),
      body: Column(
        children: [
          Expanded(
          child: ListView.builder(
            itemCount: standard.length,
            itemBuilder: (context, index) {
              return StandardItem(
                count: "${standard[index].count} :",
                standard: standard[index].name,
              );
            },
          ),
        ),
      ],
    ),
  );
}
}
