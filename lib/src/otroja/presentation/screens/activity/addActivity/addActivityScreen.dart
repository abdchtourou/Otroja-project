import 'package:admins/src/otroja/presentation/widgets/buttons/otroja_button.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/text field.dart';
import 'widgets/add_activity_widget.dart';

class AddActivityScreen extends StatelessWidget {
  const AddActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 245, 239),
      appBar: OtrojaAppBar(
        mainText: "تفقد الطلاب ",
        secText:
            'حدد تاريخ اليوم والحلقة المرادة واضغك على انهاء \n  التفقد عند الانتهاء ',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              OtrojaTextFormField(
                label: "الاسم",
                prefixIcon: 'assets/icons/product-development(1).png',
                hintText: "اكتب اسم العمل ",
              ),
              SizedBox(
                height: 10.h,
              ),
              OtrojaTextFormField(
                label: "الوصف",
                prefixIcon: 'assets/icons/info.png',
                hintText: "اكتب وصف عن العمل",
              ),
              SizedBox(
                height: 15.h,
              ),
              const Text(
                'عدد أترجات العمل ',
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
                  AddOtrojaWidget(),
                  OtrojaButton(text: "عرض المجموعة", onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
