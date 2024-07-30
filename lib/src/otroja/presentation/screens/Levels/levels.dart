import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/data/models/course_model.dart';
import 'package:admins/src/otroja/presentation/screens/Levels/widgets/level_card.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routing/routes.dart';
import '../subject/subject_classification/widget/tilted_image_label_card.dart';

class ShowLevels extends StatelessWidget {
  List<Level> levels;
  ShowLevels({super.key, required this.levels});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: "مستويات الدورة",
        secText: "اختر مستوى لعرض المعلومات ",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: GridView.builder(
                  padding: EdgeInsets.only(top: 6.h),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 20),
                  itemCount: levels.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          //  context.pushNamed(Routes.showSubject);
                        },
                        child: LevelCard(
                          level: levels[index].name,
                          onTap: () {
                            context.pushNamed(Routes.subjectOrGroup,
                                arguments: levels[index].pivot.id);
                          },
                        ));
                  },
                ),
              ),
            )
            // OtrojaButton(text: "إضافة", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
