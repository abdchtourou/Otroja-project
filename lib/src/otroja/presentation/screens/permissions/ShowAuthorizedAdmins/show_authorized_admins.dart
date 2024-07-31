import 'package:admins/src/otroja/presentation/screens/permissions/ShowAuthorizedAdmins/widgets/edit_discription.dart';
import 'package:admins/src/otroja/presentation/screens/permissions/ShowAuthorizedAdmins/widgets/permission_description.dart';
import 'package:admins/src/otroja/presentation/screens/permissions/ShowPermissions/widgets/permission_card.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/add_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_search_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/models/permission_model.dart';
import '../../../widgets/buttons/otroja_button.dart';

class ShowAuthorizedAdminsScreen extends StatelessWidget {
  Permission permission;
  ShowAuthorizedAdminsScreen({super.key, required this.permission});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: permission.name,
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
                itemCount: permission.staffs.length,
                itemBuilder: (context, index) {
                  return UserCard(
                    name:
                        "${permission.staffs[index].firstName} ${permission.staffs[index].lastName}",
                    imagePath: "assets/images/kidsNew.png",
                    iconPath: "assets/icons/cancel.png",
                    onItemPressed: () {},
                  );
                },
              ),
            ),
            OtrojaButton(
              onPressed: () {},
              text: "إضافة مسؤول",
            )
          ],
        ),
      ),
    );
  }
}
