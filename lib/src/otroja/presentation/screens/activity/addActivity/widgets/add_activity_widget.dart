import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../cubit/activity/activityCubit/add_activity_cubit.dart';

class AddOtrojaWidget extends StatelessWidget {
  const AddOtrojaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340.w,
      height: 250.h,
      child: Stack(
        children: [
          Positioned(
            left: 70,
            child: Container(
              width: 200.w,
              height: 180.h,
              child: Image.asset('assets/icons/rub-el-hizb.png'),
            ),
          ),
          Positioned(
            left: 66.w,
            top: 0.h,
            child: Transform.rotate(
              angle: 3.14 / 4,
              child: Container(
                margin: EdgeInsets.only(left: 60.w, top: 32.5),
                width: 110.w,
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: const Color.fromARGB(255, 245, 236, 224),
                  border: Border.all(width: 4, color: const Color(0xff85313C)),
                ),
              ),
            ),
          ),
          Positioned(
            left: 78.w,
            top: 21.h,
            child: Transform.rotate(
              angle: 3.14 / 4,
              child: Container(
                margin: EdgeInsets.only(left: 115.w, top: 75.h),
                padding: EdgeInsets.only(left:0.w, bottom: 0),
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: const Color(0xff85313C),
                ),
                child: Transform.rotate(
                  angle: -3.14 / 4,
                  // child:

                ),
              ),
            ),
          ),
          Positioned(
            left: 150.w,
            top: 48.h,
            child: SizedBox(
              width: 50.w,
              height: 50.h,
              child: Image.asset('assets/icons/lemon.png'),
            ),
          ),
          Positioned(
            left: 150.w,
            top: 121.h,
            child: BlocConsumer<AddActivityCubit, ActivityState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Text(
                  ' ${BlocProvider.of<AddActivityCubit>(context).otrojaCount}',
                  style: const TextStyle(
                      fontSize: 22.5,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffEEEAE4)),
                );
              },
            ),
          ),
          Positioned(
            top: 130.h,
            child: Row(
              children: [
                Container(
                  width: 125.w,
                  height: 125.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icons/islam.png')
                    )
                  ),
                  child: Center(
                    child:    InkWell(
                      onTap: () {
                        BlocProvider.of<AddActivityCubit>(context)
                            .updateOtroja(false);
                      },
                      child: SizedBox(
                        width: 30.w,
                        height: 30.h,
                        child: Image.asset('assets/icons/minus-sign.png'),
                      ),
                    ),
                  )
                ),

                const SizedBox(
                  width: 90,
                ),
                Container(
                    width: 125.w,
                    height: 125.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/icons/islam.png')
                        )
                    ),
                    child: Center(
                      child:    InkWell(
                        onTap: () {
                          BlocProvider.of<AddActivityCubit>(context)
                              .updateOtroja(true);
                        },
                        child: SizedBox(
                          width: 30.w,
                          height: 30.h,
                          child: Image.asset('assets/icons/plus(6).png'),
                        ),
                      ),
                    )
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
