import 'package:admins/src/otroja/presentation/widgets/buttons/otroja_button.dart';
import 'package:admins/src/otroja/presentation/widgets/custumDropDown.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/text%20field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cubit/students/check_student/check_student_cubit.dart';
import '../../../cubit/students/check_student/check_student_state.dart';
import '../../widgets/add_user/custom_drop_down.dart';
import '../../widgets/check_student/attendance_row_header.dart';

class CheckStudentScreen extends StatefulWidget {
  const CheckStudentScreen({super.key});

  @override
  State<CheckStudentScreen> createState() => _CheckStudentScreenState();
}

class _CheckStudentScreenState extends State<CheckStudentScreen> {
  bool isexit=false;
  List<bool> isPresentList = List<bool>.generate(5, (index) => false);

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 249, 245, 239),
        appBar: OtrojaAppBar(
          mainText: "تفقد الطلاب ",
          secText:
              'حدد تاريخ اليوم والحلقة المرادة واضغك على انهاء \n  التفقد عند الانتهاء ',
          optionalWidget: SizedBox(
            width: 35.w,
            height: 35.h,
            child: Image.asset('assets/icons/add.png'),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              PlatyTextField(
                  hintText: "حدد التاريخ",
                  labelText: 'اختر تاريخ',
                  containerColor: const Color(0xffffff),
                  containerWidth: 350.w,
                  borderThickness: 2,
                  borderColor: const Color(0xffE6E6E6),
                  imagePath: 'assets/icons/calendar.png',
                  textDirection: TextDirection.rtl),
              SizedBox(
                height: 10.h,
              ),
              CustomDropdown(list: const ["1",'2','3'], labelText: 'الحلقة المرادة ', hint: 'اختر حلقة', onChanged: (String? value) {  },),
              SizedBox(
                height: 20.h,
              ),
              const AttendanceRowHeader(),
           BlocBuilder<CheckStudentCubit, CheckStudentState>(
              builder: (context, state) {
              if (state is CheckStudentLoaded) {
                  return Column(
                    children: [

                      Container(
                        width: 340.w,
                        height: 300.h,
                        padding: const EdgeInsets.only(top: 7),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 245, 236, 224),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            height: 18.w,
                          ),
                          itemBuilder: (context, index) {

                            return Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 20, right: 5),
                                        child: Text(
                                         ' student.name',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 95.w,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 10, right: 0),
                                        child: InkWell(
                                          onTap: () {
                                            context.read<CheckStudentCubit>().togglePresence(index,true);
                                          },
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: const Color(0xff85313C),
                                                width: 2,
                                              ),
                                            ),
                                            child: state.isPresentList[index]==1
                                                ? const Icon(Icons.check, color: Colors.green)
                                                : const Text(''),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(bottom: 10, right: 45.w),
                                        child: InkWell(
                                          onTap:(){
                                            context.read<CheckStudentCubit>().togglePresence(index,false);

                                          },
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: const Color(0xff85313C),
                                                width: 2,
                                              ),
                                            ),
                                            child:  state.isPresentList[index]==2
                                                ? const Icon(Icons.check, color: Colors.green)
                                                : const Text('')
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    color: Color.fromARGB(223, 234, 226, 215),
                                    thickness: 1,
                                    indent: 10,
                                    endIndent: 10,
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: 5,
                        ),
                      ),
                    ],
                  );
                }
                return Container();
              },
            ),

              const SizedBox(
                height: 10,
              ),
             OtrojaButton(text: 'عرض المجموعة', onPressed: (){}),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
