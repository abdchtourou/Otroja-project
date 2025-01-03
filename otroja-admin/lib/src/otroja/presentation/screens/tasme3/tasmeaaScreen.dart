import 'package:admins/src/otroja/cubit/recite/recite_cubit.dart';
import 'package:admins/src/otroja/cubit/standardCubit/standard_cubit.dart';
import 'package:admins/src/otroja/presentation/screens/tasme3/widgets/standard_item.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/otroja_button.dart';
import 'package:admins/src/otroja/presentation/widgets/OtrojaDatePicker.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/recite_model.dart';
import '../../widgets/otroja_circular_progress_indicator.dart';
import '../../widgets/otroja_seccuss_dialog.dart';
import 'widgets/page_count_widget.dart';
import 'widgets/table_title_widget.dart';

class TasmeaaScreen extends StatelessWidget {

  TasmeaaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Call getStandards when the screen is first loaded
    context.read<StandardCubit>().getStandards();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 245, 239),
      appBar: OtrojaAppBar(
        mainText: "تسميع الطلاب",
        secText: 'حدد تاريخ اليوم والصفحة المرادة \n  ثم املأ جدول المعايير',
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          OtrojaDatePickerWidget(
            hintText: "حدد التاريخ",
            labelText: 'اختر تاريخ',
            containerColor: Color(0xffffffff),
            containerWidth: 340.w,
            borderThickness: 2,
            borderColor: Color(0xffE6E6E6),
            imagePath: 'assets/icons/calendar.png',
            textDirection: TextDirection.rtl,
            onDateSelected: (DateTime picked) {
              String formattedDate =
                  "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
              context.read<StandardCubit>().updateDate(formattedDate);
            },
          ),
          SizedBox(
            height: 15.h,
          ),
          BlocBuilder<StandardCubit, StandardState>(
            builder: (context, state) {
              return PageCountWidget(
                pageCount: context.read<StandardCubit>().pageCount,
              );
            },
          ),
          SizedBox(
            height: 15.h,
          ),
          const TableTitleWidget(),
          Expanded(
            child: BlocBuilder<StandardCubit, StandardState>(
              builder: (context, state) {
                if (state is StandardLoaded ) {
                  context.read<StandardCubit>().standards.forEach((element) {
                    context.read<StandardCubit>().standardsCounts[element.id] =
                        0;
                  });
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return StandardItem(
                        standard:
                            context.read<StandardCubit>().standards[index],
                        count: 0,
                      );
                    },
                    itemCount: context.read<StandardCubit>().standards.length,
                  );
                } else if (state is StandardUpdated || state is PageCountUpdated) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return StandardItem(
                        standard:
                            context.read<StandardCubit>().standards[index],
                        count: context.read<StandardCubit>().standardsCounts[
                            context.read<StandardCubit>().standards[index].id]!,
                      );
                    },
                    itemCount: context.read<StandardCubit>().standards.length,
                  );
                } else if (state is StandardLoading) {
                  return const Center(child: OtrojaCircularProgressIndicator());
                } else {
                  return const Center(child: Text("Error loading standards"));
                }
              },
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocConsumer<ReciteCubit, ReciteState>(
                listener: (context, state) {
                  if (state is ReciteCreated) {
                    showDialog(
                      context: context,
                      builder: (context) => OtrojaSuccessDialog(
                        text: "!تم إضافة التسميع بنجاح",
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return OtrojaButton(
                      text: 'إنهاء التسميع',
                      onPressed: () {
                        print("tap");
                        List<StandardCount> standardCount = [];
                        context
                            .read<StandardCubit>()
                            .standardsCounts
                            .forEach((key, value) {
                          standardCount
                              .add(StandardCount(id: key, count: value));
                        });
                        print(context.read<StandardCubit>().studentId);
                        context.read<ReciteCubit>().createRecite(Recite(
                            date: context.read<StandardCubit>().date,
                            studentId: context.read<StandardCubit>().studentId,
                            pageCount:context.read<StandardCubit>().pageCount ,
                            reciteTypeId: "1",
                            standardCounts: standardCount));
                      });
                },
              ))
        ],
      ),
    );
  }
}
