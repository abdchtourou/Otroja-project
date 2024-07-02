import 'package:admins/src/otroja/presentation/screens/permissions/ShowAuthorizedAdmins/widgets/edit_discription.dart';
import 'package:admins/src/otroja/presentation/screens/permissions/ShowAuthorizedAdmins/widgets/permission_description.dart';
import 'package:admins/src/otroja/presentation/screens/permissions/ShowPermissions/widgets/permission_card.dart';
import 'package:admins/src/otroja/presentation/widgets/add_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_search_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/otroja_button.dart';

class ShowAuthorizedAdminsScreen extends StatelessWidget {
  const ShowAuthorizedAdminsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> students = [
      "islam",
      "Abd",
      "islam",
      "Abd",
      "islam",
      "Abd",
      "islam",
      "Abd",
      "islam",
      "Abd",
      "islam",
      "Abd",
      "islam",
      "Abd",
      "islam",
      "Abd",
      "islam",
      "Abd",
      "islam",
      "Abd",
      "islam",
      "Abd",
      "islam",
      "Abd",
    ];
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: "صلاحية إنشاء حساب طالب",
        secText:
            "بإمكان الشخص المعطى هذه الصلاحية بإنشاء حسابات للطلاب وتعديلها",
      //  optionalWidget:EditeDescripton(onTap: (){}) ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const OtrojaSearchBar(),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return UserCard(
                    name: students[index],
                    imagePath: "assets/images/kidsNew.png",
                    iconPath: "assets/icons/cancel.png",
                    onPressed: () {},
                  );
                },
              ),
            ),
            OtrojaButton(onPressed: (){},text: "إضافة مسؤول",)
          ],
        ),
      ),
    );
  }
}
