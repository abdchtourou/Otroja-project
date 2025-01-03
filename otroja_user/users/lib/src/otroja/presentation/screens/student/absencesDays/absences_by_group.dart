import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otroja_users/src/core/utils/extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../data/models/stuednt_info.dart';
import '../../../widgets/otroja_app_bar.dart';

class AbsenceByGroup extends StatelessWidget {
  final List<Absence> absence;
  Map<String, int> absenceCount = {};
  AbsenceByGroup({super.key, required this.absence});

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
