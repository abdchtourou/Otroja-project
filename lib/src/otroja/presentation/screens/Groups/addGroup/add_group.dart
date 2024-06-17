import 'package:admins/src/otroja/presentation/screens/Groups/addGroup/widgets/group_number_widget.dart';
import 'package:admins/src/otroja/presentation/widgets/add_button.dart';
import 'package:admins/src/otroja/presentation/widgets/view_button.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_drop_down.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/otroja_text_field.dart';

class AddGroup extends StatefulWidget {
  AddGroup({super.key});

  static String id = 'AddGroupScreen';

  @override
  State<AddGroup> createState() => _AddGroupState();
}

class _AddGroupState extends State<AddGroup> {
  String? userName;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const OtrojaAppBar(
              mainText: "إنشاء حلقة",
              secText:
                  "املأ الحقول الموجودة في الأسفل ثم اضغط على زر إنشاء حلقة"),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  children: [
                    const GroupNumberWidget(),
                    SizedBox(
                      height: 20.h,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          OtrojaTextFormField(
                              label: "اسم الحلقة",
                              onChange: (data) {
                                userName = data;
                              },
                              hintText: "اسم الحلقة",
                              prefixIcon:
                                  const AssetImage('assets/icons/person.png')),
                          SizedBox(height: 20.h),
                          OtrojaDropdown(
                            labelText: "الأستاذ ",
                            hint: "الأستاذ",
                            list: ["أحمد", "إسلام"],
                          ),
                          SizedBox(height: 20.h),
                          OtrojaDropdown(
                            labelText: "الدورة",
                            hint: "الدورة",
                            list: ["قران", "حديث"],
                          ),
                          SizedBox(height: 45.h),
                          Row(
                            children: [
                              ViewButton(
                                onTap: () {},
                                icon: AssetImage('assets/icons/student.png'),
                                backgroundColor: const Color(0xffEEEAE4),
                                text: "طلاب الحلقة",
                                textColor: const Color(0xFF85313C),
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              AddButton(
                                onTap: () {},
                                icon:
                                    AssetImage('assets/icons/studentWhite.png'),
                                backgroundColor: const Color(0xFF85313C),
                                text: "طلاب الحلقة",
                                textColor: const Color(0xffEEEAE4),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 60.h,
                          ),
                          CustomButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {}
                            },
                            text: 'إنشاء حلقة',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

