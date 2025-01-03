import 'package:admins/src/otroja/data/repository/group_repository.dart';
import 'package:admins/src/otroja/presentation/screens/subject/subjuctTap/subject_tap.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/groups/group_cubit.dart';
import '../../../data/datasource/api_services.dart';
import '../Groups/ShowGroups/groups_tap.dart';

class SubjectOrGroupScreen extends StatelessWidget {
  int courseLevelId;
  SubjectOrGroupScreen({super.key, required this.courseLevelId});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Builder(
        builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context)!;
          return Scaffold(
            appBar: OtrojaAppBar(
              mainText: 'معلومات الدورة',
              // secText: 'Welcome to my app',
              tabs: [
                Tab(text: 'الحلقات'),
                Tab(text: 'المواد'),
              ],
              tabController: tabController,
            ),
            body: TabBarView(
              controller: tabController,
              children: [
                GroupsTapScreen(),
                SubjectsTap(),
              ],
            ),
          );
        },
      ),
    );
  }
}
