import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/show_activity/show_activity_cubit.dart';
import '../../widgets/otroja_app_bar.dart';
import '../../widgets/otroja_circular_progress_indicator.dart';
import '../../widgets/otroja_seccuss_dialog.dart';
import 'widgets/activity_item.dart';

class ActivityScreen extends StatelessWidget {
  ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 245, 239),
      appBar: OtrojaAppBar(
        mainText: "الأنشطة ",
        secText:
            'ابحث عن أي نشاط أو اضغط على زر الإضافة يمينا \n  لإضافة نشاط ',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BlocConsumer<ShowActivityCubit, ShowActivityState>(
              listener: (context, state) {
                if (state is ShowActivityDid) {
            showDialog(
              context: context,
              builder: (context) => OtrojaSuccessDialog(
                text: "!تم إضافة الحلقة بنجاح",
              ),
            );
          } 
              },
              builder: (BuildContext context, ShowActivityState state) {
                    if (state is ShowActivityLoaded) {
                      return Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) => ActivityItem(
                            activityDescrition:
                                state.showActivity[index].description!,
                            activityTitle: state.showActivity[index].name!,
                            activityOtroja: state.showActivity[index].points!,
                            //todo
                            activityId: state.showActivity[index].id!,
                            //state.showActivity[index].,
                          ),
                          itemCount: state.showActivity.length,
                        ),
                      );
                    } else {
                      return const Expanded(
                        child: Center(
                          child: OtrojaCircularProgressIndicator(),
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
