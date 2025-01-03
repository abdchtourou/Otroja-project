import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:admins/src/otroja/presentation/screens/absence/absencesDays/widgets/absence_item.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routing/routes.dart';
import '../../../../data/models/stuednt_info.dart';

class AbsenceDayesScreen extends StatelessWidget {
  final List<Absence> absence;
  Map<String, int> absenceCount = {};
  AbsenceDayesScreen({super.key, required this.absence});

  @override
  Widget build(BuildContext context) {
    absenceCount = countAbsencesByGroupName(absence);
    return Scaffold(
      appBar: OtrojaAppBar(mainText:"عدد أيام غياب الطالب لكل حلقة"),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: absenceCount.length,
              itemBuilder: (context, index) {
                var groupName = absenceCount.keys.elementAt(index);
                var count = absenceCount[groupName];

                return InkWell(
                  onTap: () {
                    List<Absence> groupAbsences = absence
                        .where((a) => a.groupName == groupName)
                        .toList();

                   
                    context.pushNamed(Routes.studentAbsencsForGroup,arguments: groupAbsences);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFF85313C), width: 2.w),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "$count",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              ": $groupName",
                              style: TextStyle(
                                color: OtrojaColors.primaryColor,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Map<String, int> countAbsencesByGroupName(List<Absence> absences) {
    Map<String, int> absenceCount = {};

    for (var absence in absences) {
      // Check if the groupName exists in the map
      if (absence.groupName != null) {
        absenceCount[absence.groupName!] =
            (absenceCount[absence.groupName!] ?? 0) + 1;
      }
    }

    return absenceCount;
  }
}
