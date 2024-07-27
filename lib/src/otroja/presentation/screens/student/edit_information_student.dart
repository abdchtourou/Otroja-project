import 'package:admins/src/otroja/cubit/students/show_student_cubit/show_students_cubit.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/otroja_button.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/students/add_studnet/add_studnet_cubit.dart';
import '../../../cubit/students/edit_info_student_cubit/edit_info_student_cubit.dart';
import '../../widgets/add_user/add_parent.dart';
import '../../widgets/add_user/custom_dialog.dart';
import '../../widgets/add_user/custom_drop_down.dart';
import '../../widgets/add_user/custom_text_date.dart';
import '../../widgets/add_user/custom_text_field.dart';
import '../../widgets/add_user/custom_text_date.dart';
import '../../widgets/add_user/image_student.dart';
import '../../widgets/buttons/save_cancel_button.dart';
import '../../widgets/show_students_widget/appbar.dart';
import '../../widgets/show_students_widget/student_info_form.dart';
class EditInformationStudent extends StatelessWidget {
  const EditInformationStudent({super.key, required this.studentId});

  final String studentId;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EditInfoStudentCubit>();
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: "تعديل المعلومات",
        secText: "املأ الحقول الموجودة في الأسفل بالبيانات الجديدة ثم اضغط على زر حفظ التغييرات",
      ),
      body: BlocListener<EditInfoStudentCubit, EditInfoStudentState>(
        listener: (context, state) {
          if (state is EditInfoStudentLoaded) {
            showDialog(
              context: context,
              builder: (BuildContext context) => MyDialog(),
            );
          }
        },
        child: BlocBuilder<EditInfoStudentCubit, EditInfoStudentState>(
          builder: (context, state) {
            return Form(
              key: cubit.formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageStudent(
                          isEdit: true,
                          image: cubit.image,
                          onPressed: () {
                            cubit.pickImage();
                          },
                        ),
                        const SizedBox(width: 20),
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
                      phoneNumberController: cubit.phoneNumberController,
                      dateController: cubit.dateController,
                      onChanged: (value) {
                        cubit.address = value!;
                      },
                    ),
                    SaveCancelButtons(
                      onPressedSave: () {
                        cubit.postData(studentId);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

