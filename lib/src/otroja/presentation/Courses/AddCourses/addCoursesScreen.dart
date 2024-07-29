import 'package:admins/src/otroja/presentation/Courses/AddCourses/widgets/courseLevelWidget.dart';
import 'package:admins/src/otroja/presentation/screens/absence/teachersAbsence/widgets/absence_date_picker.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_button.dart';
import 'package:admins/src/otroja/presentation/widgets/text%20field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCourses extends StatelessWidget {
  AddCourses({super.key});
  final ValueNotifier<String> searchNotifier = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 245, 239),
      appBar: OtrojaAppBar(
        mainText: 'إضافة دورة',
        secText: 'إملأ التفاصيل أدناه ثم اضغط زر إضافة دورة',
        optionalWidget: Container(
          width: 35,
          height: 35,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/icons/labelname.png')),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PlatyTextField(
                hintText: "اكتب اسم الدورة",
                labelText: 'اسم الدورة',
                containerColor: const Color(0xffffffff),
                containerWidth: double.infinity,
                borderThickness: 2,
                borderColor: const Color(0xffE6E6E6),
                imagePath: 'assets/icons/calendar.png',
                textDirection: TextDirection.rtl),
            SizedBox(
              height: 10.h,
            ),
            AbsenceDatePicker(
              hintText: 'حدد تاريخ بدايتها',
              labelText: ' تاريخ بدايتها',
              containerColor: const Color(0xffffffff),
              containerWidth: 340.w,
              borderThickness: 2,
              borderColor: const Color(0xffE6E6E6),
              imagePath: 'assets/icons/calendar.png',
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10.h,
            ),
            // Add the LevelCheckboxWidget here
            LevelCheckboxWidget(),
            SizedBox(
              height: 10.h,
            ),
            OtrojaButton(text: 'إضافة الدورة', onPressed: (){})
          ],
        ),
      ),
    );
  }
}

