import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_search_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupStudentsScreen extends StatelessWidget {
  const GroupStudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> students = ["islam", "Abd"];
    return Scaffold(
      appBar: OtrojaAppBar(
          mainText: "طلاب الحلقة",
          secText:
              "لإزالة طالب من الحلقة اضغط على ايقونة الحذف"),
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
                  return UserCard(
                    name: students[index],
                    imagePath: "assets/images/kidsNew.png",
                    iconPath: "assets/icons/cancel.png",
                    onPressed: (){},
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
