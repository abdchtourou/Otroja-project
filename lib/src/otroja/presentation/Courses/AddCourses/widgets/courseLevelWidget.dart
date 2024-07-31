import 'package:admins/src/otroja/cubit/levelCubit/level_cubit.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LevelCheckboxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LevelCubit, LevelState>(
      builder: (context, state) {
        if (state is LevelLoading) {
          return Center(child: OtrojaCircularProgressIndicator());
        } else if (state is LevelLoaded || state is LevelUpdated) {
          Map<int, bool> levels = context.read<LevelCubit>().levels;
        
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  'حدد مستويات الدورة ',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                ...levels.entries.map((entry) {
                  int index = entry.key;
                  bool isChecked = entry.value;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'مستوى $index',
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                          value: isChecked,
                          onChanged: (bool? value) {
                            context
                                .read<LevelCubit>()
                                .updateSelection(index, value ?? false);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          activeColor: Color(0xFF85313C),
                          checkColor: Colors.white,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ],
            ),
          );
        } else if (state is LevelError) {
          return Center(child: Text('Failed to load levels: ${state.message}'));
        } else {
          return Container();
        }
      },
    );
  }
}
