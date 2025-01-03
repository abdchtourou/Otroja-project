import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/otroja_app_bar.dart';
import 'widgets/exam_item.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> exams = ["islam"];
    return Scaffold(
      appBar: OtrojaAppBar(
          mainText: " الامتحانات ",
          secText:
              "اضغط على الامتحان لعرض تفاصيله"
              ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ExamItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
