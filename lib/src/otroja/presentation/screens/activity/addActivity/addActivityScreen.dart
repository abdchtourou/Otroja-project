import 'package:admins/src/otroja/cubit/activity/activityCubit/add_activity_cubit.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/otroja_button.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/add_user/custom_dialog.dart';
import '../../../widgets/text field.dart';
import 'widgets/add_activity_widget.dart';

class AddActivityScreen extends StatelessWidget {
  const AddActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddActivityCubit>();

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 249, 245, 239),
        appBar: OtrojaAppBar(
          mainText: "إضافة نشاط",
          secText: 'املأ الحقول الموجودة في الأسفل ثم اضغط على زر إضافة النشاط',
        ),
        body: BlocListener<AddActivityCubit, AddActivityState>(
          listener: (context, state) {
            if (state is AddActivityLoaded) {
              showDialog(
                context: context,
                builder: (BuildContext context) => MyDialog(),
              );
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  OtrojaTextFormField(
                    label: "الاسم",
                    prefixIcon: 'assets/icons/product-development(1).png',
                    hintText: "اكتب اسم النشاط ",
                    myController: cubit.nameController,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  OtrojaTextFormField(
                    label: "الوصف",
                    prefixIcon: 'assets/icons/info.png',
                    hintText: "اكتب وصف عن النشاط",
                    myController: cubit.descriptionController,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const Text(
                    'عدد أترجات النشاط ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    children: [
                      const AddOtrojaWidget(),
                      OtrojaButton(
                          text: "إضافة النشاط",
                          onPressed: () {
                            cubit.addActivity();
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
