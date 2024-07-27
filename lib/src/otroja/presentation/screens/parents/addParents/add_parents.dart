import 'package:admins/src/otroja/cubit/add_staff/add_staff_cubit.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/otroja_button.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddParents extends StatelessWidget {
  const AddParents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: "إضافة ولي أمر",
        secText: "املأ الحقول الموجودة في الأسفل ثم اضغط على زر إضافة ولي أمر",
      ),
      body: SingleChildScrollView(
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
                      onChange: (data) {},
                      hintText: "أكتب اسمك",
                      //controller: cubit.secondNameController,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OtrojaTextFormField(
                      label: 'الاسم الأول',
                      prefixIcon: 'assets/icons/person.png',
                      obscureText: false,
                      onChange: (data) {},
                      hintText: "أكتب اسمك",
                      //controller: cubit.firstNameController,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: OtrojaTextFormField(
                  label: 'اسم المستخدم',
                  hintText: "اكتب اسم المستخدم الخاص بك"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: OtrojaTextFormField(
                  type: TextInputType.emailAddress,
                  label: ' البريد الإلكتروني',
                  hintText: "اكتب البريد الإلكتروني الخاص بك"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: OtrojaTextFormField(
                label: 'كلمة المرور',
                hintText: "اكتب كلمة المرور",
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: OtrojaTextFormField(
                label: 'تأكيد كلمة المرور',
                hintText: "اكتب كلمة المرور مرة أخرى",
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: OtrojaTextFormField(
                  label: 'رقم الهاتف',
                  prefixIcon: 'assets/icons/phone.png',
                  obscureText: false,
                  onChange: (data) {},
                  type: TextInputType.phone,
                  hintText: "اكتب رقم الهاتف"
                  // controller: cubit.phoneNumberController,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: OtrojaTextFormField(
                label: 'المهنة',
                prefixIcon: 'assets/icons/briefcase.png',
                obscureText: false,
                onChange: (data) {},
                hintText: "اختر مهنة ",
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 8, right: 8, left: 8, top: 20),
              child: OtrojaButton(text: "إضافة ولي أمر", onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
