import 'package:admins/src/otroja/cubit/Exam_cubit/create_exam/create_exam_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../cubit/Exam_cubit/create_exam/create_exam_cubit.dart';
import '../../../../cubit/course/course_cubit.dart';
import '../../../../cubit/groups/group_cubit.dart';
import '../../../../cubit/levelCubit/level_cubit.dart';
import '../../../../data/models/group_model.dart';
import '../../../widgets/otroja_app_bar.dart';
import '../../../widgets/otroja_drop_down.dart';
import '../../../widgets/otroja_search_bar.dart';

class GroupsScreen extends StatelessWidget {
  GroupsScreen({super.key, required this.isSelectedGroup});

  bool isSelectedGroup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 245, 239),
      appBar: OtrojaAppBar(
        mainText: "عرض الحلقات",
        secText: 'ابحث عن أي حلقة أو اضغط على الحلقة لعرض \n  تفاصيلها',
        optionalWidget: SizedBox(
          width: 35.w,
          height: 35.h,
          child: Image.asset('assets/icons/add.png'),
        ),
      ),
      body: Column(
        children: [
          if (isSelectedGroup) ...[
            const OtrojaSearchBar(),
            _buildSelectedGroupList(context)
          ] else ...[
            _buildDropdowns(context),
            const OtrojaSearchBar(),
            _buildGroupList(context)
          ]
        ],
      ),
    );
  }

  Widget _buildDropdowns(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<LevelCubit, LevelState>(
          builder: (context, state) {
            if (state is LevelLoaded) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: OtrojaDropdown(
                    list: context.read<LevelCubit>().levelsName,
                    labelText: 'المستوى',
                    hint: "اختر مستوى",
                    onChange: (value) {
                      context.read<GroupCubit>().getGroupByCourseLevel(
                          context.read<LevelCubit>().levelsId[value]!);
                    },
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
        BlocBuilder<CourseCubit, CourseState>(
          builder: (context, state) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: OtrojaDropdown(
                  list: context.read<CourseCubit>().coursesNames,
                  labelText: 'اسم الدورة',
                  hint: "اختر دورة",
                  onChange: (value) {
                    context.read<LevelCubit>().getLevelsByCourseId(
                        context.read<CourseCubit>().coursesId[value]!);
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildGroupList(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GroupCubit, GroupState>(
        builder: (context, state) {
          if (state is GroupsLoaded) {
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 18),
              padding: const EdgeInsets.all(10),
              itemCount: state.groups.length,
              itemBuilder: (context, index) =>
                  _buildGroupItem(context, state.groups[index]),
            );
          } else if (state is GroupLoading) {
            return const Expanded(
                child: Center(child: CircularProgressIndicator()));
          } else {
            return const Center(
                child: Text('اختر الدورة و المستوى لعرض حلقاته'));
          }
        },
      ),
    );
  }

  Widget _buildSelectedGroupList(BuildContext context) {
    final groupList = CreateExamCubit.listGroups;
    print(groupList);
    return BlocBuilder<CreateExamCubit,CreateExamState >(
  builder: (context, state) {
    return Expanded(
        child: ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 18),
      padding: const EdgeInsets.all(10),
      itemCount: groupList.length,
      itemBuilder: (context, index) =>
          _buildSelectedGroupItem(context, groupList[index]),
    ));
  },
);
  }

  Widget _buildGroupItem(BuildContext context, Group group) {
    return BlocBuilder<CreateExamCubit, CreateExamState>(
      builder: (context, state) {
        final isSelected = CreateExamCubit.listGroups.contains(group);
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xff85313C), width: 2),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 22, top: 11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 145,
                      height: 30,
                      margin: const EdgeInsets.only(right: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            group.createdAt!,
                            style: const TextStyle(
                              color: Color(0xff85313C),
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Color.fromARGB(223, 234, 226, 215),
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 17),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            group.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Color.fromARGB(223, 234, 226, 215),
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        height: 41,
                        child: OutlinedButton(
                          onPressed: () {
                            context.read<CreateExamCubit>().addToList(group: group);
                            print(CreateExamCubit.listGroups);
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: isSelected ? Colors.green : const Color(0xFF85313C),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Icon(
                            Icons.add,
                            color: isSelected ? Colors.green : const Color(0xFF85313C),
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 41,
                          child: OutlinedButton(
                            onPressed: () {
                              context.read<CreateExamCubit>().removeFromList(group: group);
                              print(CreateExamCubit.listGroups);
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: Color(0xFF85313C),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Icon(
                              Icons.remove_circle,
                              color: Color(0xFF85313C),
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  Widget _buildSelectedGroupItem(BuildContext context, Group group) {

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xff85313C), width: 2),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 22, top: 11),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 145,
                  height: 30,
                  margin: const EdgeInsets.only(right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        group.createdAt!,
                        style: const TextStyle(
                          color: Color(0xff85313C),
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Divider(
            color: Color.fromARGB(223, 234, 226, 215),
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 17),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        group.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Divider(
            color: Color.fromARGB(223, 234, 226, 215),
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 41,
              child: OutlinedButton(
                onPressed: () {
                  // CreateExamCubit.list.remove(group);
                  context.read<CreateExamCubit>().removeFromList(group: group);
                  print(CreateExamCubit.listGroups);
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Color(0xFF85313C),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Icon(
                  Icons.remove_circle,
                  color: Color(0xFF85313C),
                  size: 30,
                ),
              ),
            ),
          )
        ],
      ),
    );

  }
}
