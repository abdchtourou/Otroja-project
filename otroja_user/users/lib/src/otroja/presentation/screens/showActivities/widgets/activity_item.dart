import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../cubits/show_activity/show_activity_cubit.dart';
import 'activity_title.dart';

class ActivityItem extends StatelessWidget {
  String activityDescrition;
  String activityTitle;
  int activityOtroja;
  int activityId;
  ActivityItem({
    super.key,
    required this.activityDescrition,
    required this.activityTitle,
    required this.activityOtroja,
    required this.activityId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          context.read<ShowActivityCubit>().activityId= activityId;
          context.read<ShowActivityCubit>().didActivity();

        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff85313C), width: 2.w),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              ActivityTitle(
                activityTitle: activityTitle,
                activityOtroja: activityOtroja,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Color(0xFF85313C), width: 2.w))),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Text(
                      textAlign: TextAlign.center,
                      activityDescrition,
                      style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
