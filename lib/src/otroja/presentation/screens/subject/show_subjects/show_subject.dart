import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:admins/src/otroja/presentation/screens/subject/show_subjects/widget/add_subject_card.dart';
import 'package:admins/src/otroja/presentation/screens/subject/show_subjects/widget/subject_card.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/show_students_widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../subject_classification/widget/tilted_image_label_card.dart';

class ShowSubject extends StatelessWidget {
  ShowSubject({super.key});

  final ValueNotifier<String> searchNotifier = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF9F5),
      appBar: OtrojaAppBar(
        mainText: 'المواد',
        secText: 'اضغط على المادة لعرض تفاصيلها',
      ),
      body: Column(
        children: [
          OtrojaSearchBar1(searchNotifier: searchNotifier),
          Expanded(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: 11,
                itemBuilder: (context, index) {
                  if (index < 10) {
                    return const SubjectCard();
                  } else {
                    return AddSubjectCard();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
