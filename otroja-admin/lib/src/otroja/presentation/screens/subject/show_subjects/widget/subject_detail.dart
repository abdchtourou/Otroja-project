import 'package:admins/src/otroja/presentation/screens/subject/show_subjects/widget/subject_category.dart';
import 'package:admins/src/otroja/presentation/screens/subject/show_subjects/widget/subject_description.dart';
import 'package:admins/src/otroja/presentation/screens/subject/show_subjects/widget/subject_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/colors.dart';

class SubjectDetail extends StatelessWidget {
  const SubjectDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SubjectHeader(),
        SubjectCategory(),
        SubjectDescription()
      ],
    );
  }
}
