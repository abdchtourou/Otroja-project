import 'package:admins/src/otroja/presentation/screens/tasme3/widgets/standard_item.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/otroja_button.dart';
import 'package:admins/src/otroja/presentation/widgets/karamDatePicker.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/page_count_widget.dart';
import 'widgets/table_title_widget.dart';

class TasmeaaScreen extends StatelessWidget {
  TextEditingController _activityController = TextEditingController(text: '1');

   TasmeaaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 249, 245, 239),
        appBar: OtrojaAppBar(
          mainText: "تسميع الطلاب",
          secText:
              'حدد تاريخ اليوم والصفحة المرادة \n  ثم املأ جدول المعايير',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              DatePickerWidget(
                hintText: "حدد التاريخ",
                labelText: 'اختر تاريخ',
                containerColor: Color(0xffffffff),
                containerWidth: 340.w,
                borderThickness: 2,
                borderColor: Color(0xffE6E6E6),
                imagePath: 'assets/icons/calendar.png',
                textDirection: TextDirection.rtl,
              ),
              SizedBox(
                height: 15.h,
              ),
              PageCountWidget(),
              SizedBox(
                height: 15.h,
              ),
              Column(
                children: [
                  const TableTitleWidget(),
                  Container(
                    width: 340.w,
                    height: 300.h,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 245, 236, 224),
                    ),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return StandardItem(title: "أحكام النون",);
                      },
                      itemCount: 5, // Replace with actual list length
                    ),
                  ),
                  OtrojaButton(text: 'إنهاء التسميع', onPressed: (){})
                ],
              ),
            ],
          ),
        ),
      );
  }
}
