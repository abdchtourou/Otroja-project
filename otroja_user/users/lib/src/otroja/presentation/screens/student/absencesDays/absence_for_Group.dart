
import 'package:flutter/material.dart';
import '../../../../data/models/stuednt_info.dart';
import '../../../widgets/otroja_app_bar.dart';
import 'widgets/absence_item.dart';


class StudentAbsencsForGroup extends StatelessWidget {
  final List<Absence> absence;
  StudentAbsencsForGroup({super.key, required this.absence});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OtrojaAppBar(mainText:"أيام الغياب" ),
      body: Column(
        children: [
          Expanded(
          child: ListView.builder(
            itemCount: absence.length,
            itemBuilder: (context, index) {
              return AbsenceItem(
                date: absence[index].date!,
                groupName: absence[index].groupName!,
              );
            },
          ),
                    ),
        ],
      ),
    );
  }
}
