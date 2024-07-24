import 'package:admins/src/otroja/presentation/widgets/buttons/add_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/activity_item.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 245, 239),
      appBar: OtrojaAppBar(
          mainText: "الأنشطة ",
          secText:
              'ابحث عن أي نشاط أو اضغط على زر الإضافة يمينا \n  لإضافة نشاط ',
          optionalWidget: AddAppBar(
            onTap: () {},
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            OtrojaSearchBar(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ActivityItem(
                  activityDescrition:
                      'ينال الطالب خمس أترجات لكل فريضة صلاة \n يؤديها على وقتها ',
                  activityTitle: 'الصلاة على وقتها',
                  activityOtroja: '6',
                ),
                itemCount: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
