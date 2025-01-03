import 'package:admins/src/otroja/presentation/screens/Exams/qustion/widgets/otroja_time_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:admins/src/otroja/presentation/widgets/OtrojaDatePicker.dart';

import '../../widgets/otroja_app_bar.dart';
import '../../widgets/otroja_drop_down.dart'; // Import your time picker widget

class Exam extends StatelessWidget {
  const Exam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 245, 239),
      appBar: OtrojaAppBar(
        mainText: 'Exam',
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w), // Add padding around the entire body
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: OtrojaDropdown(
                  list: const ['Subject 1', 'Subject 2'],
                  labelText: 'اختيار الامتحان',
                  hint: "اختر الامتحان",
                  onChange: (value) {},
                ),
              ),
              SizedBox(height: 16.h), // Add spacing between elements
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 8.w), // Add padding to the right
                      child: OtrojaTimePickerWidget(
                        labelText: 'الوقت',
                        hintText: 'اختر وقت التفقد',
                        containerColor: const Color(0xffffffff),
                        containerWidth: double.infinity, // Take full width
                        borderThickness: 2,
                        borderColor: const Color(0xffE6E6E6),
                        imagePath: 'assets/icons/clock.png',
                        textDirection: TextDirection.rtl,
                        onTimeSelected: (time) {
                          print("Selected time: ${time.format(context)}");
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.w), // Add padding to the left
                      child: OtrojaDatePickerWidget(
                        labelText: 'تاريخ الامتحان',
                        hintText: 'اختر تاريخ',
                        containerColor: const Color(0xffffffff),
                        containerWidth: double.infinity, // Take full width
                        borderThickness: 2,
                        borderColor: const Color(0xffE6E6E6),
                        imagePath: 'assets/icons/calendar.png',
                        textDirection: TextDirection.rtl,
                        onDateSelected: (picked) {
                          // Handle date selection
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
