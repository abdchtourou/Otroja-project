import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/students/add_studnet/add_studnet_cubit.dart';
import '../../widgets/add_user/add_parent.dart';
import '../../widgets/add_user/custom_dialog.dart';
import '../../widgets/add_user/custom_drop_down.dart';
import '../../widgets/add_user/custom_text_date.dart';
import '../../widgets/add_user/custom_text_field.dart';
import '../../widgets/add_user/custom_text_date.dart';
import '../../widgets/add_user/image_student.dart';


class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OtrojaAppBar(
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
                            ImageStudent(),
                            const SizedBox(
                              width: 20,
                            ),
                            ImageTextCard(imagePath: 'assets/icons/add-group 1.png', text: 'إضافة ولي أمر ', onTap: () {  },),
                          ],
                        ),
                        CustomTextFormField(
                            labelText: 'الاسم الكامل',
                            onChange: (data) {},
                            hintText: "اكتب اسمك",
                            prefixIcon: Transform.scale(
                              scale: 0.60,
                              child: const ImageIcon(
                                AssetImage('assets/icons/person.png'),
                                color: Color(0xFFE6E6E6),
                              ),
                            )),
                        CustomTextFormField(
                          labelText: 'ادخل البريد الإلكتروني',
                          prefixIcon: Transform.scale(
                            scale: 1.2,
                            child: const Icon(
                              Icons.email_outlined,
                              color: Color(0xFFE6E6E6),
                            ),
                          ),
                          obscureText: false,
                          onChange: (data) {},
                          hintText: "ادخل البريد الإلكتروني",
                          type: TextInputType.emailAddress,
                        ),
                        CustomTextFormField(
                          labelText: "كلمة المرور",
                          prefixIcon: Transform.scale(
                            scale: 0.6,
                            child: const ImageIcon(
                              AssetImage('assets/icons/Lock.png'),
                              color: Color(0xFFE6E6E6),
                            ),
                          ),
                          suffixIcon: Transform.scale(
                            scale: 0.6,
                            child: const ImageIcon(
                              AssetImage('assets/icons/eye.png'),
                              color: Color(0xFFE6E6E6),
                            ),
                          ),
                          obscureText: true,
                          onChange: (data) {},
                          hintText: "اكتب كلمة مرورك",
                          type: TextInputType.visiblePassword,
                        ),
                        CustomTextDate(
                          labelText: "تاريخ الميلاد",
                          prefixIcon: Transform.scale(
                            scale: 1,
                            child: const Icon(
                              Icons.date_range,
                              color: Color(0xFFE6E6E6),
                            ),
                          ),
                          obscureText: false,
                          onChange: (data) {},
                          hintText: "اختر تاريخ ",
                        ),
                        CustomTextFormField(
                          labelText: 'رقم الهاتف',
                          prefixIcon: Transform.scale(
                            scale: 1,
                            child: const Icon(
                              Icons.phone_enabled_outlined,
                              color: Color(0xFFE6E6E6),
                            ),
                          ),
                          obscureText: false,
                          onChange: (data) {},
                          hintText: "ادخل رقمك ",
                          type: TextInputType.phone,
                        ),
                        CustomDropdown(
                          labelText: "المدينة",
                          list: const [
                            'United States',
                            'Canada',
                            'Mexico',
                            'United Kingdom',
                            'Germany',
                            'France',
                            'Italy',
                            'Spain',
                            'China',
                            'Japan',
                            'Australia',
                            'India',
                            'Brazil',
                            'South Africa',
                          ],
                          hint: 'مدينة',
                        ),
                        CustomDropdown(
                          labelText: "الحلقة",
                          hint: "حلقة",
                          list: const [
                            'United States',
                            'Canada',
                            'Mexico',
                            'United Kingdom',
                            'Germany',
                            'France',
                            'Italy',
                            'Spain',
                            'China',
                            'Japan',
                            'Australia',
                            'India',
                            'Brazil',
                            'South Africa',
                          ],
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
