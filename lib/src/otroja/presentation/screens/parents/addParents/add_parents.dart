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
        secText:"املأ الحقول الموجودة في الأسفل ثم اضغط على زر إضافة المشرف",
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20 ,bottom: 5 ,left: 8,right: 8),
            child: Row(
              children: [
                Expanded(
                  child: OtrojaTextFormField(
                    label: 'الاسم الثاني',
                    prefixIcon: 'assets/icons/person.png',
                    obscureText: false,
                    onChange: (data) {},
                    hintText: "أكتب اسمك",
                    type: TextInputType.text,
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
                    type: TextInputType.text,
                    //controller: cubit.firstNameController,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:  8.0, vertical: 5),
            child: OtrojaTextFormField(
              label: 'رقم الهاتف',
              prefixIcon: 'assets/icons/phone.png',
              obscureText: false,
              onChange: (data) {},
              hintText: "اكتب رقم الهاتف",
              type: TextInputType.number, 
             // controller: cubit.phoneNumberController,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:  8.0, vertical: 5),
              child: OtrojaTextFormField(
                label: 'المهنة',
                prefixIcon: 'assets/icons/briefcase.png',
                obscureText: false,
                onChange: (data) {},
                hintText: "اختر مهنة ",
                type: TextInputType.text, 
               // controller: cubit.careerController ,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OtrojaButton(text: "إضافة المشرف", onPressed: (){}),
          )

        ],
      ),
    );
  }
}

