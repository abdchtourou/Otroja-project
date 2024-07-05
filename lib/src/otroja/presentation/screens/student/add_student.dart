import 'package:admins/src/otroja/presentation/widgets/buttons/otroja_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/students/add_studnet/add_studnet_cubit.dart';
import '../../widgets/add_user/add_parent.dart';
import '../../widgets/add_user/custom_dialog.dart';
import '../../widgets/add_user/custom_drop_down.dart';
import '../../widgets/add_user/custom_text_date.dart';
import '../../widgets/add_user/custom_text_field.dart';
import '../../widgets/add_user/image_student.dart';
import '../../widgets/show_students_widget/appbar.dart';
import '../../widgets/show_students_widget/student_info_form.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
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
          return Form(
            key: BlocProvider.of<AddStudentCubit>(context).formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageStudent(
                              image: context.read<AddStudentCubit>().image,
                              onPressed: () {
                                context.read<AddStudentCubit>().pickImage();
                              },
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ImageTextCard(
                              imagePath: 'assets/icons/add-group 1.png',
                              text: 'إضافة ولي أمر ',
                              onTap: () {},
                            ),
                          ],
                        ),
                        StudentInfoForm(
                          fullNameController: cubit.fullNameController,
                          emailController: cubit.emailController,
                          passwordController: cubit.passwordController,
                          phoneNumberController: cubit.phoneNumberController, dateController: cubit.dateController,  onChanged: (String? value) {
                            cubit.address=value!;

                        },
                        ),
                        OtrojaButton(
                          text: 'إضافة الطالب',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return MyDialog();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
