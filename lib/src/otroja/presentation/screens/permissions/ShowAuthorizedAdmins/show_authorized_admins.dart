import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/cubit/permissionCubit/permission_cubit.dart';
import 'package:admins/src/otroja/cubit/staff/staff_cubit.dart';
import 'package:admins/src/otroja/presentation/screens/permissions/ShowAuthorizedAdmins/widgets/edit_discription.dart';
import 'package:admins/src/otroja/presentation/screens/permissions/ShowAuthorizedAdmins/widgets/permission_description.dart';
import 'package:admins/src/otroja/presentation/screens/permissions/ShowPermissions/widgets/permission_card.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/add_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_search_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routing/routes.dart';
import '../../../../data/models/permission_model.dart';
import '../../../widgets/buttons/otroja_button.dart';
import '../../Groups/groupStudents/widgets/RemoveConfirmationDialog.dart';
import '../../Groups/groupStudents/widgets/add_dialog.dart';
import 'widgets/remove_permission_from_staff_dialog.dart';

class ShowAuthorizedAdminsScreen extends StatelessWidget {
  Permission permission;
  ShowAuthorizedAdminsScreen({super.key, required this.permission});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: permission.name,
        optionalWidget: AddAppBar(onTap: () {
          context.pushNamed(Routes.showStaff).then(
              (_) async {
                final cubit = context.read<StaffCubit>();
                if(cubit.selectedStaff.isNotEmpty){
                final shouldAdd = await AddDialog.show(context);
                if (shouldAdd) {  
                  context.read<PermissionCubit>().addPermission(permission.id, cubit.selectedStaff);
                }
                }
              },
            );
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
  
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
                    onIconPressed: () async {
                       final shouldRemove =
                await RemovePermissionFromStaffDialog.show(context, permission.staffs[index]);
            if (shouldRemove) {
              context
                  .read<PermissionCubit>()
                  .removePermission(permission.id,permission.staffs[index].id);
            }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
