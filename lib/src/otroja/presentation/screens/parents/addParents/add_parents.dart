import 'package:admins/src/otroja/cubit/add_staff/add_staff_cubit.dart';
import 'package:admins/src/otroja/cubit/parentCubit/parent_cubit.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/otroja_button.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/parent.dart';
import '../../../widgets/otroja_seccuss_dialog.dart';

class AddParents extends StatelessWidget {
  const AddParents({super.key});
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                          context.read<ParentCubit>().lastName = data;
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
                          context.read<ParentCubit>().firstName = data;
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
                      context.read<ParentCubit>().userName = data;
                    },
                    label: 'اسم المستخدم',
                    hintText: "اكتب اسم المستخدم الخاص بك"),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: OtrojaTextFormField(
                    type: TextInputType.emailAddress,
                    onChange: (data) {
                      context.read<ParentCubit>().email = data;
                    },
                    label: ' البريد الإلكتروني',
                    hintText: "اكتب البريد الإلكتروني الخاص بك"),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: OtrojaTextFormField(
                  label: 'كلمة المرور',
                  hintText: "اكتب كلمة المرور",
                  obscureText: true,
                  onChange: (data) {
                    context.read<ParentCubit>().password = data;
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
                    context.read<ParentCubit>().confirmPassword = data;
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
                      context.read<ParentCubit>().phone = data;
                    },
                    type: TextInputType.phone,
                    hintText: "اكتب رقم الهاتف"

                    // controller: cubit.phoneNumberController,
                    ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: OtrojaTextFormField(
                  label: 'المهنة',
                  prefixIcon: 'assets/icons/briefcase.png',
                  obscureText: false,
                  onChange: (data) {
                    context.read<ParentCubit>().profession = data;
                  },
                  hintText: "اختر مهنة ",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 8, right: 8, left: 8, top: 20),
                child: BlocConsumer<ParentCubit, ParentState>(
                    listener: (context, state) {
                  if (state is ParentCreated) {
                    showDialog(
                      context: context,
                      builder: (context) => OtrojaSuccessDialog(
                        text: "!تم إضافة الحلقة بنجاح",
                      ),
                    ).then((_) {
                      formKey.currentState?.reset();
                      context.read<ParentCubit>().resetState();
                    });
                  }
                }, builder: (context, state) {
                  return OtrojaButton(
                      text: "إضافة ولي أمر",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final cubit = context.read<ParentCubit>();
                          context.read<ParentCubit>().addParent(Parent(
                              firstName: cubit.firstName!,
                              lastName: cubit.lastName!,
                              userName: cubit.userName!,
                              email: cubit.email!,
                              password: cubit.password!,
                              phoneNumber: cubit.phone!,
                              profession: cubit.profession!));
                          print("tap");
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
