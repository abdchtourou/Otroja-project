import 'package:admins/src/otroja/presentation/Courses/ShowCourses/widgets/courseItem.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/show_students_widget/search_bar.dart';
import 'package:flutter/material.dart';

class ShowCourses extends StatelessWidget {
   ShowCourses({super.key});
  final ValueNotifier<String> searchNotifier = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: OtrojaAppBar(mainText: 'عرض الدورات',

      secText: 'انقر على زر عرض الدورة لعرض تفاصيلها',
      optionalWidget: Container(
          width: 35,
          height: 35,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/icons/add.png')),
          ),
        ),),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      
      children: [
        OtrojaSearchBar1(searchNotifier: searchNotifier),
          const SizedBox(height: 10),
          Expanded(child: 
          ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            itemCount: 5,
            itemBuilder: (context, index) => CourseItem(),))
          
      ],),
    );
  }
}