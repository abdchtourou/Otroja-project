import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../cubit/activityCubit/add_activity/activity_cubit.dart';

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
            left: 68.w,
            top: -7.h,
            child: Transform.rotate(
              angle: 3.14 / 4,
              child: Container(
                margin: EdgeInsets.only(left: 72, top: 32.5),
                width: 105.w,
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Color.fromARGB(255, 245, 236, 224),
                  border: Border.all(width: 4, color: Color(0xff85313C)),
                ),
              ),
            ),
          ),
          Positioned(
            left: 75.w,
            top: 7.h,
            child: Transform.rotate(
              angle: 3.14 / 4,
              child: Container(
                margin: EdgeInsets.only(left: 130, top: 90),
                padding: EdgeInsets.only(left: 15, bottom: 0),
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Color(0xff85313C),
                ),
                child: Transform.rotate(
                  angle: -3.14 / 4,
                ),
              ),
            ),
          ),
          Positioned(
            left: 152.w,
            top: 55.h,
            child: SizedBox(
              width: 50.w,
              height: 50.h,
              child: Image.asset('assets/icons/lemon.png'),
            ),
          ),
          Positioned(
            left: 155.w,
            top: 123.h,
            child: BlocConsumer<ActivityCubit, ActivityState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Text(
                  ' ${BlocProvider.of<ActivityCubit>(context).otrojaCount}',
                  style: TextStyle(
                      fontSize: 22.5,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffEEEAE4)),
                );
              },
            ),
          ),
          Positioned(
            top: 120,
            child: Row(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 125.w,
                      height: 125.h,
                      child: Image.asset('assets/icons/islam.png'),
                    ),
                    Positioned(
                      left: 47,
                      top: 53,
                      child: InkWell(
                        onTap: () {
                          BlocProvider.of<ActivityCubit>(context)
                              .updateOtroja(false);
                        },
                        child: SizedBox(
                          width: 30.w,
                          height: 30.h,
                          child: Image.asset('assets/icons/minus-sign.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 90,
                ),
                Stack(
                  children: [
                    SizedBox(
                      width: 125.w,
                      height: 125.h,
                      child: Image.asset('assets/icons/islam.png'),
                    ),
                    Positioned(
                      left: 47,
                      top: 53,
                      child: InkWell(
                        onTap: () {
                          BlocProvider.of<ActivityCubit>(context)
                              .updateOtroja(true);
                        },
                        child: SizedBox(
                          width: 30.w,
                          height: 30.h,
                          child: Image.asset('assets/icons/plus(6).png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
