import 'package:admins/src/otroja/cubit/standardCubit/standard_cubit.dart';
import 'package:admins/src/otroja/presentation/screens/tasme3/widgets/page_count_editor_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageCountWidget extends StatelessWidget {
  PageCountWidget({super.key, required this.pageCount});
int pageCount ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'عدد الصفحات ',
          style: TextStyle(
            color: Colors.black,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: Row(
            children: [
              PageCountEditorWidget(
                  icon: 'assets/icons/minus-sign.png',
                  onTap: () {
                    context.read<StandardCubit>().updatePageCount(false);
                  }),
              Expanded(
                child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                      'assets/icons/label.png',
                    ))),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("$pageCount",
                        style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.sp,
                          ),),
                      )
                    )),
              ),
              PageCountEditorWidget(
                  icon: 'assets/icons/plus(6).png', onTap: () {
                    context.read<StandardCubit>().updatePageCount(true);
                  }),
            ],
          ),
        )
      ],
    );
  }
}
