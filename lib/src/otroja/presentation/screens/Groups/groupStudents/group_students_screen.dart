import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupStudentsScreen extends StatelessWidget {
  const GroupStudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        OtrojaAppBar(mainText: "حدد طلاب الحلقة", secText: "في حال أردت إضافة طالب جديد غير موجود مسبقا فاضغط على زر الإضافة يمينا"),
        SizedBox(height: 10.h,),
        OtrojaSearchBar(),
        
        SizedBox(height: 10.h,),
         
      ],),
    );
  }
}