import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/cubit/parentCubit/parent_cubit.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/otroja_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/routing/routes.dart';
import '../../../cubit/students/add_studnet/cubit/add_student_cubit.dart';
import '../../widgets/add_user/add_parent.dart';
import '../../widgets/add_user/custom_dialog.dart';
import '../../widgets/add_user/custom_drop_down.dart';
import '../../widgets/add_user/custom_text_date.dart';
import '../../widgets/add_user/custom_text_field.dart';
import '../../widgets/add_user/image_student.dart';
import '../../widgets/show_students_widget/appbar.dart';
import '../../widgets/show_students_widget/student_info_form.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddStudentCubit>();

    return Scaffold(
      appBar: Appbar(
        mainText: 'إضافة طالب',
        secText: 'املأ الحقول الموجودة في الأسفل ثم اضغط على زر إضافة طالب ',
      ),
      body: BlocBuilder<AddStudentCubit, AddStudentState>(
        builder: (BuildContext context, AddStudentState state) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageTextCard(
                            imagePath: 'assets/icons/add-group 1.png',
                            text: 'تحديد ولي أمر ',
                            onTap: () {
                              context.pushNamed(Routes.showParents);
                            },
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ImageTextCard(
                            imagePath: 'assets/icons/add-group 1.png',
                            text: 'إضافة ولي أمر ',
                            onTap: () {
                              context.pushNamed(Routes.addParents);
                            },
                          ),
                        ],
                      ),
                      StudentInfoForm(
                      
                      ),
                     
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
