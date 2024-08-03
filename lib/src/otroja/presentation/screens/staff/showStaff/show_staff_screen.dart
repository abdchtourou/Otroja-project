import 'package:admins/src/otroja/cubit/staff/staff_cubit.dart';
import 'package:admins/src/otroja/cubit/students/show_student_cubit/show_students_cubit.dart';
import 'package:admins/src/otroja/cubit/students/show_student_cubit/show_students_state.dart';
import 'package:admins/src/otroja/presentation/screens/Groups/addStudentToGroup/widgets/staff_list.dart';
import 'package:admins/src/otroja/presentation/screens/Groups/addStudentToGroup/widgets/studentsListWidget.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/add_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/buttons/otroja_button.dart';
import '../../../widgets/otroja_circular_progress_indicator.dart';

class ShowStaffScreen extends StatelessWidget {
  const ShowStaffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: "حدد  المشرف",
  
          
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: BlocBuilder<StaffCubit, StaffState>(
                builder: (context, state) {
                  if (state is StaffLoading) {
                    return const Center(
                        child: OtrojaCircularProgressIndicator());
                  } else if (state is StaffLoaded) {
                    return StaffListWidget(
                        context: context,
                        staffs: state.staffList,
                        selectedStaffs: state is UpdateSelectedStaffState
                            ? (state as UpdateSelectedStaffState).selectedStaffs
                            : []);
                  } else if (state is UpdateSelectedStaffState) {
                    return StaffListWidget(
                        context: context,
                        staffs: context.read<StaffCubit>().staffs,
                        selectedStaffs: state.selectedStaffs);
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
