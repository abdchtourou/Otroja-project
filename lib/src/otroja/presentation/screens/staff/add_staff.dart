import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/cubit/add_staff/add_staff_cubit.dart';
import 'package:admins/src/otroja/cubit/parentCubit/parent_cubit.dart';
import 'package:admins/src/otroja/cubit/staff/staff_cubit.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/otroja_button.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/staff_model.dart';
import '../../widgets/otroja_drop_down.dart';
import '../../widgets/otroja_seccuss_dialog.dart';

class AddStaff extends StatelessWidget {
  const AddStaff({super.key});
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    StaffCubit staffCubit = context.read<StaffCubit>();
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: "إضافة ولي أمر",
        secText: "املأ الحقول الموجودة في الأسفل ثم اضغط على زر إضافة ولي أمر",
      ),
      body: SingleChildScrollView(
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
                        label: 'الاسم الثاني',
                        prefixIcon: 'assets/icons/person.png',
                        obscureText: false,
                        onChange: (data) {
                          staffCubit.lastName = data;
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
                          staffCubit.firstName = data;
                        },
                        hintText: "أكتب اسمك",
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: OtrojaTextFormField(
                    onChange: (data) {
                      staffCubit.userName = data;
                    },
                    label: 'اسم المستخدم',
                    hintText: "اكتب اسم المستخدم الخاص بك"),
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              //   child: OtrojaTextFormField(
              //       type: TextInputType.emailAddress,
              //       onChange: (data) {
              //         staffCubit.email = data;
              //       },
              //       label: ' البريد الإلكتروني',
              //       hintText: "اكتب البريد الإلكتروني الخاص بك"),
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: OtrojaTextFormField(
                  label: 'كلمة المرور',
                  hintText: "اكتب كلمة المرور",
                  obscureText: true,
                  onChange: (data) {
                    staffCubit.password = data;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: OtrojaTextFormField(
                  label: 'تأكيد كلمة المرور',
                  hintText: "اكتب كلمة المرور مرة أخرى",
                  obscureText: true,
                  onChange: (data) {
                   // staffCubit.confirmPassword = data;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: OtrojaTextFormField(
                    label: 'رقم الهاتف',
                    prefixIcon: 'assets/icons/phone.png',
                    obscureText: false,
                    onChange: (data) {
                      staffCubit.phone = data;
                    },
                    type: TextInputType.phone,
                    hintText: "اكتب رقم الهاتف"

                    // controller: cubit.phoneNumberController,
                    ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                  child: OtrojaDropdown(
                    list: const [
                      "1. أستاذ",
                      "2. إداري",
                    ],
                    hint: "الدور",
                    labelText: "الدور",
                    onChange: (value) {
                      staffCubit.role = value;
                    },
                    value: staffCubit.role,
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 8, right: 8, left: 8, top: 20),
                child: BlocConsumer<StaffCubit, StaffState>(
                    listener: (context, state) {
                  if (state is StaffRegistered) {
                    showDialog(
                      context: context,
                      builder: (context) => OtrojaSuccessDialog(
                        text: "!تم إضافة المشرف  بنجاح",
                      ),
                    ).then((_) {
                      formKey.currentState?.reset();
                      context.read<StaffCubit>().reset();
                      context.pop();
                    });
                  }
                }, builder: (context, state) {
                  return OtrojaButton(
                      text: "إضافة  مشرف",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          int roleId;
                          if (staffCubit.role == "1. أستاذ") {
                            roleId = 1;
                          } else {
                            roleId = 2;
                          }

                          staffCubit.registerStaff(Staff(
                              userName: staffCubit.userName,
                              firstName: staffCubit.firstName,
                              lastName: staffCubit.lastName,
                              password: staffCubit.password,
                              phoneNumber: staffCubit.phone,
                              roleId: roleId));

                          print("tap ${roleId}");
                        }
                      });
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
