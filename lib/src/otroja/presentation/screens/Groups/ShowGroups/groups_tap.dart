import 'package:admins/src/otroja/cubit/groups/group_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/group_item.dart';

class GroupsTapScreen extends StatelessWidget {
  GroupsTapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 245, 239),
      body: BlocBuilder<GroupCubit, GroupState>(
        builder: (context, state) {
          if (state is GroupLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GroupsLoaded) {
            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 18,
              ),
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) => GroupItem(
                startdate: state.groups[index].createdAt.toString(),
                groupName:state.groups[index].name,
                studentCount: state.groups[index].studentsCount.toString(),
                teacherName:state.groups[index].staffName!,
              ),
              itemCount: state.groups.length,
            );
          } else {
            return const Center(child: Text("Error loading students"));
          }
        },
      ),
    );
  }
}

