import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otroja_users/src/core/utils/extensions.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../data/models/myRecite.dart';
import 'CourseItemBody.dart';

class ReciteItem extends StatelessWidget {
  MyRecite recite;
  ReciteItem({super.key, required this.recite});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          context.pushNamed(Routes.standard, arguments: recite.standards);
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: OtrojaColors.primaryColor,
                width: 2,
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CourseItemBody(
              date: recite.date,
              score: recite.score,
              staffName: "${recite.staff.firstName} ${recite.staff.lastName} ",
              page: recite.pageNumber,
            ),
          ),
        ),
      ),
    );
  }
}
