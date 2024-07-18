import 'package:admins/src/otroja/presentation/widgets/buttons/add_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 245, 239),
      appBar: OtrojaAppBar(
        mainText: "الأعمال ",
        secText: 'ابحث عن أي عمل أو اضغط على زر الإضافة يمينا \n  لإضافة عمل ',
        optionalWidget:AddAppBar(onTap: () {
          
        },)
      ),
      body: Column(
        children: [         
          OtrojaSearchBar(),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10),
            height: 392.h,
            width: 340.w,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 18.w,
              ),
              itemBuilder: (context, index) => ActivityItem(),
              itemCount: 5,
            ),
          )
        ],
      ),
    );
  }
}

class ActivityItem extends StatelessWidget {
  const ActivityItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff85313C), width: 2.w),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 35.h,
                width: 65.w,
                decoration: const BoxDecoration(
                  color: Color(0xff85313C),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 25.w,
                      height: 30.h,
                      child: Image.asset('assets/icons/lemon.png'),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      '5',
                      style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontSize: 18.sp),
                    ),
                  ],
                ),
              ),
              Container(
                width: 275.w,
                height: 35.h,
                padding: EdgeInsets.only(bottom: 4.h),
                decoration: BoxDecoration(
                  color: Color.fromARGB(223, 245, 236, 224),
                ),
                child: Center(
                  child: Text(
                    'الصلاة على وقتها',
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 371.h,
            height: 180.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(color: Color(0xff85313C), width: 2)),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                'ينال الطالب خمس أترجات لكل فريضة صلاة \n يؤديها على وقتها ',
                style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
