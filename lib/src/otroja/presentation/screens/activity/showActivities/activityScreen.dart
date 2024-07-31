import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/cubit/activityCubit/show_activity/show_activity_cubit.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/add_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../widgets/otroja_circular_progress_indicator.dart';
import 'widgets/activity_item.dart';

class ActivityScreen extends StatelessWidget {
  ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ShowActivityCubit>();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 245, 239),
      appBar: OtrojaAppBar(
          mainText: "الأنشطة ",
          secText:
              'ابحث عن أي نشاط أو اضغط على زر الإضافة يمينا \n  لإضافة نشاط ',
          optionalWidget: AddAppBar(
            onTap: () {
               context.pushNamed(Routes.addActivity);
            },
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            OtrojaSearchBar(),
            BlocBuilder<ShowActivityCubit, ShowActivityState>(
              builder: (BuildContext context, ShowActivityState state) {
                if (state is ShowActivityLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => ActivityItem(
                        activityDescrition:
                            state.showActivity[index].description!,
                        activityTitle: state.showActivity[index].name!,
                        activityOtroja: state.showActivity[index].points!,
                      ),
                      itemCount: state.showActivity.length,
                    ),
                  );
                } else {
                  return const Expanded(
                    child: Center(
                      child:
                         OtrojaCircularProgressIndicator(),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
