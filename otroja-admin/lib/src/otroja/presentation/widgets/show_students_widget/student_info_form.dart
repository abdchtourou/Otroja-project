import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/cubit/groups/group_cubit.dart';
import 'package:admins/src/otroja/cubit/parentCubit/parent_cubit.dart';
import 'package:admins/src/otroja/cubit/students/add_studnet/cubit/add_student_cubit.dart';
import 'package:admins/src/otroja/presentation/widgets/OtrojaDatePicker.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_drop_down.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../add_user/custom_drop_down.dart';
import '../add_user/custom_text_date.dart';
import '../add_user/custom_text_field.dart';
import '../otroja_button.dart';
import '../otroja_seccuss_dialog.dart';

class StudentInfoForm extends StatelessWidget {
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  const StudentInfoForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final studentCubit = context.read<AddStudentCubit>();
    final parentCubit = context.read<ParentCubit>();
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 20, bottom: 5, left: 8, right: 8),
              child: Row(
                children: [
                  Expanded(
                    child: OtrojaTextFormField(
                      label: 'الاسم الثاني',
                      prefixIcon: 'assets/icons/person.png',
                      obscureText: false,
                      onChange: (data) {
                        context.read<AddStudentCubit>().lastName = data;
                      },
                      hintText: "أكتب اسمك",
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OtrojaTextFormField(
                      label: 'الاسم الأول',
                      prefixIcon: 'assets/icons/person.png',
                      obscureText: false,
                      onChange: (data) {
                        context.read<AddStudentCubit>().firstName = data;
                      },
                      hintText: "أكتب اسمك",
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: OtrojaTextFormField(
                  onChange: (data) {
                    context.read<AddStudentCubit>().userName = data;
                  },
                  label: 'اسم المستخدم',
                  hintText: "اكتب اسم المستخدم الخاص بك"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: OtrojaTextFormField(
                  type: TextInputType.emailAddress,
                  onChange: (data) {
                    context.read<AddStudentCubit>().email = data;
                  },
                  label: ' البريد الإلكتروني',
                  hintText: "اكتب البريد الإلكتروني الخاص بك"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: OtrojaTextFormField(
                label: 'كلمة المرور',
                hintText: "اكتب كلمة المرور",
                obscureText: true,
                onChange: (data) {
                  context.read<AddStudentCubit>().password = data;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: OtrojaTextFormField(
                label: 'تأكيد كلمة المرور',
                hintText: "اكتب كلمة المرور مرة أخرى",
                obscureText: true,
                onChange: (data) {
                  context.read<AddStudentCubit>().confirmPassword = data;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: OtrojaTextFormField(
                  label: 'رقم الهاتف',
                  prefixIcon: 'assets/icons/phone.png',
                  obscureText: false,
                  onChange: (data) {
                    context.read<AddStudentCubit>().phone = data;
                  },
                  type: TextInputType.phone,
                  hintText: "اكتب رقم الهاتف"

                  // controller: cubit.phoneNumberController,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: OtrojaTextFormField(
                label: 'العنوان',
                prefixIcon: 'assets/icons/briefcase.png',
                obscureText: false,
                onChange: (data) {
                  context.read<AddStudentCubit>().address = data;
                },
                hintText: "حدد العنوان",
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
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
                    context.read<AddStudentCubit>().birthDate = formattedDate;
                  },
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
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
                    studentCubit.grade = value;
                  },
                  value: studentCubit.grade,
                )),

 Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: BlocConsumer<GroupCubit, GroupState>(
                  listener: (context, state) {
                   
                  },
                  builder: (context, state) {
                    List<String> groupNames = [];
                    Map <String, int> groupsId ={};
                    if (state is GroupsLoaded)
                    {
                      state.groups.forEach((element) { 
                        groupNames.add(element.name);
                        groupsId[element.name] = element.id!;
                      });
                    }
                    return OtrojaDropdown(
                                  list: groupNames,
                                  hint: "الحلقة",
                                  labelText: "الحلقة",
                                onChange: (value) {
          studentCubit.groupId = groupsId[value]; // Ensure this value exists in the map
        },
       value: studentCubit.groupId != null ? groupNames.firstWhere((name) => groupsId[name] == studentCubit.groupId,) : null,
                                );
                  },
                )),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 8, right: 8, left: 8, top: 20),
              child: BlocConsumer<AddStudentCubit, AddStudentState>(
                  listener: (context, state) {
                if (state is StudentRegistered) {
                  showDialog(
                    context: context,
                    builder: (context) => OtrojaSuccessDialog(
                      text: "!تم إضافة الطالب  بنجاح",
                    ),
                  ).then((_) {
                    formKey.currentState?.reset();
                    context.read<AddStudentCubit>().reset();
                    context.pop();
                  });
                }
              }, builder: (context, state) {
                return OtrojaButton(
                    text: "إضافة الطالب ",
                    onPressed: () {
                      if (studentCubit.birthDate == null ||
                          parentCubit.id == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'الرجاء تحديد ولي أمر  و ملىء جميع البيانات ')),
                        );
                        return;
                      }
                      if (formKey.currentState!.validate()) {
                        studentCubit.registerStudent(
                          userName: studentCubit.userName!,
                          firstName: studentCubit.firstName!,
                          lastName: studentCubit.lastName!,
                          birthDate: studentCubit.birthDate!,
                          address: studentCubit.address!,
                          password: studentCubit.password!,
                         // email: studentCubit.email,
                          parentId: parentCubit.id!,
                          grade: studentCubit.grade!,
                          phoneNumber: studentCubit.phone!,
                          groupId: studentCubit.groupId!
                        );
                    
                      }
                    });
              }),
            )
          ],
        ),
      ),
    );
  }
}
