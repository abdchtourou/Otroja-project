import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
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
        optionalWidget: SizedBox(
          width: 35.w,
          height: 35.h,
          child: Image.asset('assets/icons/add.png'),
        ),
      ),
      body: SizedBox(
        width: double.infinity.w,
        height: double.infinity.h,
        child: Column(
          children: [
            Container(
              width: 340.w,
              height: 50.h,
              margin: EdgeInsets.only(left: 0.w, top: 10.h),
              decoration: BoxDecoration(
                  color: Color.fromARGB(223, 245, 236, 224),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: Color.fromARGB(223, 234, 226, 215),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'بحث',
                    style: TextStyle(
                        color: Color(0xff85313C),
                        fontStyle: FontStyle.normal,
                        fontSize: 18.sp),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 17.w),
                    width: 25.w,
                    height: 30.h,
                    child: Image.asset('assets/icons/search.png'),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              height: 392.h,
              width: 340.w,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 18.w,
                ),
                itemBuilder: (context, index) => Stack(
                  children: [
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
                    Row(
                      children: [
                        Container(
                          height: 35.h,
                          width: 65.w,
                          decoration: BoxDecoration(
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
                            border:
                                Border.all(width: 2, color: Color(0xff85313C)),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                            ),
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
                  ],
                ),
                itemCount: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
