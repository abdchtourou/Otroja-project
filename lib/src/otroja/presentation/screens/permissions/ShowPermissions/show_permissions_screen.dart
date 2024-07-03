import 'package:admins/src/otroja/presentation/screens/permissions/ShowPermissions/widgets/permission_card.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/add_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_search_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/buttons/otroja_button.dart';

class ShowPermissionsScreen extends StatelessWidget {
  const ShowPermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> students = [
      "islam",
      "Abd",
      "islam",
      "Abd",
      "islam",
      "Abd",
      "islam",
      "Abd",
      "islam",
      "Abd",
      "islam",
      "Abd",
      "islam",
      "Abd",
      "islam",
      "Abd",
      "islam",
      "Abd",
      "islam",
      "Abd",
      "islam",
      "Abd",
      "islam",
      "Abd",
    ];
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: "الصلاحيات",
        secText:
            "ابحث عن أي صلاحية أو اضغط على الصلاحية لعرض تفاصيلها",
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const OtrojaSearchBar(),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return PermissionCard(
                    title: students[index],
                    numberOfAuthorizedAdmins: "5",
                    onPressed: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
