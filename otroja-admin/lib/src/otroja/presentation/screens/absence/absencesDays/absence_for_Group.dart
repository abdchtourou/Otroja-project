import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:admins/src/otroja/presentation/screens/absence/absencesDays/widgets/absence_item.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/models/stuednt_info.dart';

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
