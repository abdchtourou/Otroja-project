import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/cubit/EditStudentCubit/edit_student_cubit.dart';
import 'package:admins/src/otroja/data/models/student_model/show_students.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routing/routes.dart';
import '../../../cubit/groups/group_cubit.dart';
import '../../../cubit/students/add_studnet/cubit/add_student_cubit.dart';
import '../../widgets/OtrojaDatePicker.dart';
import '../../widgets/add_user/add_parent.dart';
import '../../widgets/buttons/otroja_button.dart';
import '../../widgets/otroja_drop_down.dart';
import '../../widgets/otroja_seccuss_dialog.dart';
import '../../widgets/otroja_text_field.dart';
import '../../widgets/show_students_widget/appbar.dart';
import '../../widgets/show_students_widget/student_info_form.dart';

class EditInformationStudent extends StatelessWidget {
  ShowStudentModel student;
  EditInformationStudent({super.key, required this.student});
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
     final cubit =
                                              context.read<EditStudentCubit>();
    return Scaffold(
      appBar: Appbar(
        mainText: ' تعديل طالب',
        //secText: 'املأ الحقول الموجودة في الأسفل ثم اضغط على زر إضافة طالب ',
      ),
      body: BlocBuilder<EditStudentCubit, EditStudentState>(
        builder: (BuildContext context, EditStudentState state) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 5, left: 8, right: 8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: OtrojaTextFormField(
                                        initialValue: student.lastName,
                                        label: 'الاسم الثاني',
                                        prefixIcon: 'assets/icons/person.png',
                                        obscureText: false,
                                        onChange: (data) {
                                          context
                                              .read<EditStudentCubit>()
                                              .lastName = data;
                                        },
                                        hintText: "أكتب اسمك",
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: OtrojaTextFormField(
                                        initialValue: student.firstName,
                                        label: 'الاسم الأول',
                                        prefixIcon: 'assets/icons/person.png',
                                        obscureText: false,
                                        onChange: (data) {
                                          context
                                              .read<EditStudentCubit>()
                                              .firstName = data;
                                        },
                                        hintText: "أكتب اسمك",
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Padding(
                              //   padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                              //   child: OtrojaTextFormField(
                              //       type: TextInputType.emailAddress,
                              //       onChange: (data) {
                              //         context.read<EditStudentCubit>().email = data;
                              //       },
                              //       label: ' البريد الإلكتروني',
                              //       hintText: "اكتب البريد الإلكتروني الخاص بك"),
                              // ),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 5),
                                child: OtrojaTextFormField(
                                    initialValue: student.phoneNumber,
                                    label: 'رقم الهاتف',
                                    prefixIcon: 'assets/icons/phone.png',
                                    obscureText: false,
                                    onChange: (data) {
                                      context.read<EditStudentCubit>().phone =
                                          data;
                                    },
                                    type: TextInputType.phone,
                                    hintText: "اكتب رقم الهاتف"

                                    // controller: cubit.phoneNumberController,
                                    ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 5),
                                child: OtrojaTextFormField(
                                  initialValue: student.address,
                                  label: 'العنوان',
                                  prefixIcon: 'assets/icons/briefcase.png',
                                  obscureText: false,
                                  onChange: (data) {
                                    context.read<EditStudentCubit>().address =
                                        data;
                                  },
                                  hintText: "حدد العنوان",
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 5),
                                  child: OtrojaDatePickerWidget(
                                    hintText: 'حدد تاريخ',
                                    labelText: "ناريخ الولادة ",
                                    containerColor: Color(0xffffffff),
                                    containerWidth: 340.w,
                                    borderThickness: 2,
                                    borderColor: Color(0xffE6E6E6),
                                    imagePath: 'assets/icons/calendar.png',
                                    textDirection: TextDirection.rtl,
                                    onDateSelected: (DateTime picked) {
                                      String formattedDate =
                                          "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
                                      context
                                          .read<EditStudentCubit>()
                                          .birthDate = formattedDate;
                                    },
                                  )),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 5),
                                  child: OtrojaDropdown(
                                    list: const [
                                      "1",
                                      "2",
                                      "3",
                                      "4",
                                      "5",
                                      "6",
                                      "7",
                                      "8",
                                      "9",
                                      "10",
                                      "11",
                                      "12",
                                    ],
                                    hint: "الصف",
                                    labelText: "الصف",
                                    onChange: (value) {
                                      context.read<EditStudentCubit>().grade =
                                          value;
                                    },
                                    value:
                                        context.read<EditStudentCubit>().grade,
                                  )),

                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8, right: 8, left: 8, top: 20),
                                child: BlocConsumer<EditStudentCubit,
                                        EditStudentState>(
                                    listener: (context, state) {
                                  if (state is StudentUpdateSuccess) {
                                    showDialog(
                                      context: context,
                                      builder: (context) => OtrojaSuccessDialog(
                                        text: "!تم تعديل الطالب  بنجاح",
                                      ),
                                    ).then((_) {
                                      context.pop();
                                    });
                                  }
                                }, builder: (context, state) {
                                  return OtrojaButton(
                                      text: "تعديل الطالب ",
                                      onPressed: () {
                                        if (context
                                                .read<EditStudentCubit>()
                                                .birthDate ==
                                            null) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    'الرجاء ملىء جميع البيانات ')),
                                          );
                                          return;
                                        }
                                        if (formKey.currentState!.validate()) {
                                          final cubit =
                                              context.read<EditStudentCubit>();
                                          context
                                              .read<EditStudentCubit>()
                                              .updateStudent(ShowStudentModel(
                                                  id: student.id,
                                                  firstName: cubit.firstName,
                                                  lastName: cubit.lastName,
                                                  phoneNumber: cubit.phone,
                                                  address: cubit.address,
                                                  birthDate: cubit.birthDate,
                                                  grade: cubit.grade));
                                        }
                                      });
                                }),
                              )
                            ],
                          ),
                        ),
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
