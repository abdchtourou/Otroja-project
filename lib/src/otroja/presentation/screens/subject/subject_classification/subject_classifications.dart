import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/presentation/screens/subject/subject_classification/widget/add_subject_classification_card.dart';
import 'package:admins/src/otroja/presentation/screens/subject/subject_classification/widget/add_subject_classification_dialog.dart';
import 'package:admins/src/otroja/presentation/screens/subject/subject_classification/widget/tilted_image_label_card.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../widgets/show_students_widget/search_bar.dart';

class SubjectClassifications extends StatelessWidget {
  SubjectClassifications({super.key});

  final ValueNotifier<String> searchNotifier = ValueNotifier<String>('');
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF9F5),
      appBar: OtrojaAppBar(
        mainText: 'تصنيفات المواد',
        secText: 'اضغط على التصنيف لعرض مواده',
      ),
      body: Column(
        children: [
          OtrojaSearchBar1(searchNotifier: searchNotifier),
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
                itemCount: 11,
                // itemCount: list.length + 1,
                itemBuilder: (context, index) {
                  if (index < 10) {
                    return InkWell(
                      onTap: (){
                        context.pushNamed(Routes.showSubject);
                      },
                        child: const TiltedImageLabelCard());
                  } else {
                    return AddSubjectClassificationCard(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              const AddSubjectClassificationDialog(),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
