import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/cubit/parentCubit/parent_cubit.dart';
import 'package:admins/src/otroja/data/models/parent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admins/src/otroja/cubit/students/show_student_cubit/show_students_cubit.dart';
import 'package:admins/src/otroja/data/models/student_model/show_students.dart';
import 'package:admins/src/otroja/presentation/widgets/user_card.dart';

class ParentsList extends StatelessWidget {
  final List<Parent> parents;

  const ParentsList({
    Key? key,
    required this.parents,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: parents.length,
      itemBuilder: (context, index) {
        final parent = parents[index];
        return UserCard(
          name: "${parent.firstName} ${parent.lastName}",
          imagePath: "assets/images/kidsNew.png",
          iconPath: "assets/icons/return.png",
          onItemPressed: () {
            context.read<ParentCubit>().id = parent.id!;
            context.pop();
          },
        );
      },
    );
  }
}
