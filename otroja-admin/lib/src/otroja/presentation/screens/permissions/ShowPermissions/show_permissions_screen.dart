import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/cubit/permissionCubit/permission_cubit.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routing/routes.dart';
import '../../../widgets/otroja_circular_progress_indicator.dart';
import 'widgets/permission_card.dart';

class ShowPermissionsScreen extends StatelessWidget {
  ShowPermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: "الصلاحيات",
        secText: "اختر صلاحية لعرض المعلومات",
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: BlocBuilder<PermissionCubit, PermissionState>(
                builder: (context, state) {
                  if (state is PermissionLoading) {
                    return const Center(
                        child: OtrojaCircularProgressIndicator());
                  } else if (state is PermissionLoaded) {
                    return ListView.builder(
                      itemCount: state.permissions.length,
                      itemBuilder: (context, index) {
                        return PermissionCard(
                          title: state.permissions[index].name,
                          numberOfAuthorizedAdmins:
                              state.permissions[index].staffs.length.toString(),
                          onPressed: () {
                            context.pushNamed(Routes.showAuthorizedAdmins, arguments: state.permissions[index] );
                          },
                        );
                      },
                    );
                  } else {
                    return const Center(child: Text("Error loading students"));
                  }
                },
              ),
            ),
            // OtrojaButton(text: "إضافة", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
