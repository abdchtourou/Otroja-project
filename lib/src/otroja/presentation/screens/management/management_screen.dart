import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/cubit/permissionCubit/permission_cubit.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/routing/routes.dart';
import 'widgets/account_type_card.dart';
import 'widgets/category_card.dart';

class ManagemetScreen extends StatelessWidget {
  ManagemetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: "الدورات",
        secText: "اختر دورة لعرض المعلومات",
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CategoryCard(title: 'إدارة الحسابات',),
            // AccountTypeCard(
            //   title: "أولياء الأمور",
            //   onPressed: (){},
            // ),
            AccountTypeCard(
              title: "أساتذة و إداريين",
              onPressed: (){
                context.pushNamed(Routes.addStaff);
              },
            ),
            AccountTypeCard(title: "طلاب", onPressed: (){
               context.pushNamed(Routes.addStudent);
            }),
            AccountTypeCard(title: "الصلاحيات", onPressed: (){
              context.pushNamed(Routes.showPermissions);
            }),
            CategoryCard(title: 'إدارة العملية التعليمة',),
            AccountTypeCard(title: "الدورات", onPressed: (){
              context.pushNamed(Routes.addCourses);
            }),
            AccountTypeCard(title: "الحلقات", onPressed: (){
               context.pushNamed(Routes.addGroup);
            }),
            AccountTypeCard(title: "الأنشطة", onPressed: (){
               context.pushNamed(Routes.activity);
            }),
            
          ],
        ),
      ),
    );
  }
}
